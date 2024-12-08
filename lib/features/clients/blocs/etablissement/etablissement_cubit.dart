import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/observation/observation.dart';
import '../../repositories/etablissement.repository.dart';

part 'etablissement_cubit.freezed.dart';
part 'etablissement_state.dart';

class EtablissementCubit extends Cubit<EtablissementState> {
  EtablissementCubit() : super(const EtablissementState.initial());

  Future<void> get({required int pharmacyId}) async {
    emit(const EtablissementState.loading());
    try {
      final response = await EtablissementRepository.get(id: pharmacyId);

      List<Observation> etablissements = response.data['body']
          .map<Observation>((etablissement) => Observation.fromJson(etablissement))
          .toList();

      emit(EtablissementState.loaded(etablissements));
    } catch (e) {
      emit(EtablissementState.error(e.toString()));
    }
  }

  Future<void> create({required Map<String, dynamic> data}) async {
    emit(const EtablissementState.loading());
    try {
      await EtablissementRepository.create(data: data);

      get(pharmacyId: data['pharmacieId']);
    } catch (e) {
      emit(EtablissementState.error(e.toString()));
    }
  }
}
