import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/observation/observation.dart';
import '../../repositories/grossiste.repository.dart';

part 'grossiste_cubit.freezed.dart';
part 'grossiste_state.dart';

class GrossisteCubit extends Cubit<GrossisteState> {
  GrossisteCubit() : super(const GrossisteState.initial());

  Future<void> get({required int pharmacyId}) async {
    emit(const GrossisteState.loading());
    try {
      final response = await GrossisteRepository.get(id: pharmacyId);

      List<Observation> grossistes = response.data['body']
          .map<Observation>((grossiste) => Observation.fromJson(grossiste))
          .toList();

      emit(GrossisteState.loaded(grossistes));
    } catch (e) {
      emit(GrossisteState.error(e.toString()));
    }
  }

  Future<void> create({required Map<String, dynamic> data}) async {
    emit(const GrossisteState.loading());
    try {
      await GrossisteRepository.create(data: data);

      get(pharmacyId: data['pharmacieId']);
    } catch (e) {
      emit(GrossisteState.error(e.toString()));
    }
  }

  Future<void> bulkUpdate({required Map<String, dynamic> data}) async {
    emit(const GrossisteState.loading());
    try {
      await GrossisteRepository.bulkUpdate(data: data);

      get(pharmacyId: data['pharmacieId']);
    } catch (e) {
      emit(GrossisteState.error(e.toString()));
    }
  }
}
