import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/services/helpers/dio.helper.dart';
import '../../../auth/services/auth.repository.dart';
import '../../models/fournisseur_lov.dart';

part 'fournisseur_lov_cubit.freezed.dart';

@freezed
class FournisseurLovState with _$FournisseurLovState {
  const factory FournisseurLovState.initial() = _Initial;
  const factory FournisseurLovState.loading() = _Loading;
  const factory FournisseurLovState.loaded(List<FournisseurLov> data) = _Loaded;
  const factory FournisseurLovState.error(String message) = _Error;
}

class FournisseurLovCubit extends Cubit<FournisseurLovState> {
  FournisseurLovCubit() : super(const FournisseurLovState.initial());

  Future<void> load() async {
    emit(const FournisseurLovState.loading());
    try {
      final token = await AuthRepository.token;
      final response = await DioHelper.getData(url: '/lov/76', token: token);
      final list = (response.data['body'] as List).map((e) => FournisseurLov.fromJson(e)).toList();
      emit(FournisseurLovState.loaded(list));
    } catch (e) {
      emit(FournisseurLovState.error(e.toString()));
    }
  }
}
