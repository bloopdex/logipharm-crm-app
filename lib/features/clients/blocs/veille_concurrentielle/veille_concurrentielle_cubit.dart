import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/observation/observation.dart';
import '../../repositories/veille_concurrentielle.repository.dart';

part 'veille_concurrentielle_cubit.freezed.dart';
part 'veille_concurrentielle_state.dart';

class VeilleConcurrentielleCubit extends Cubit<VeilleConcurrentielleState> {
  VeilleConcurrentielleCubit() : super(const VeilleConcurrentielleState.initial());

  Future<void> get({required int pharmacyId}) async {
    emit(const VeilleConcurrentielleState.loading());
    try {
      final response = await VeilleConcurrentielleRepository.get(id: pharmacyId);

      List<Observation> veilles =
          response.data['body'].map<Observation>((v) => Observation.fromJson(v)).toList();

      emit(VeilleConcurrentielleState.loaded(veilles));
    } catch (e) {
      emit(VeilleConcurrentielleState.error(e.toString()));
    }
  }

  Future<void> create({required Map<String, dynamic> data}) async {
    emit(const VeilleConcurrentielleState.loading());
    try {
      await VeilleConcurrentielleRepository.create(data: data);
      get(pharmacyId: data['pharmacieId']);
    } catch (e) {
      emit(VeilleConcurrentielleState.error(e.toString()));
    }
  }
}
