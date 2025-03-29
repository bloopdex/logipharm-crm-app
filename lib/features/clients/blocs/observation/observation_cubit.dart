import 'package:bloc/bloc.dart';
import 'package:crm/features/clients/repositories/observation.repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/observation/observation.dart';

part 'observation_cubit.freezed.dart';
part 'observation_state.dart';

class ObservationCubit extends Cubit<ObservationState> {
  ObservationCubit() : super(const ObservationState.initial());

  Future<void> get({required int pharmacyId}) async {
    emit(const ObservationState.loading());
    try {
      final response = await ObservationRepository.get(id: pharmacyId);

      List<Observation> observations = response.data['body']
          .map<Observation>((observation) => Observation.fromJson(observation))
          .toList();

      emit(ObservationState.loaded(observations));
    } catch (e) {
      emit(ObservationState.error(e.toString()));
    }
  }

  Future<void> create({required Map<String, dynamic> data}) async {
    emit(const ObservationState.loading());
    try {
      await ObservationRepository.create(data: data);

      get(pharmacyId: data['pharmacieId']);
    } catch (e) {
      emit(ObservationState.error(e.toString()));
    }
  }
}
