import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/services/helpers/dio.helper.dart';
import '../../auth/services/auth.repository.dart';
import '../models/specialite_lov.dart';

part 'specialite_lov_cubit.freezed.dart';

@freezed
class SpecialiteLovState with _$SpecialiteLovState {
  const factory SpecialiteLovState.initial() = _Initial;
  const factory SpecialiteLovState.loading() = _Loading;
  const factory SpecialiteLovState.loaded(List<SpecialiteLov> data) = _Loaded;
  const factory SpecialiteLovState.error(String message) = _Error;
}

class SpecialiteLovCubit extends Cubit<SpecialiteLovState> {
  SpecialiteLovCubit() : super(const SpecialiteLovState.initial());

  Future<void> load() async {
    emit(const SpecialiteLovState.loading());
    try {
      final token = await AuthRepository.token;
      final response = await DioHelper.getData(url: '/lov/201', token: token);
      final list = (response.data['body'] as List)
          .map((e) => SpecialiteLov.fromJson(e))
          .toList();
      emit(SpecialiteLovState.loaded(list));
    } catch (e) {
      emit(SpecialiteLovState.error(e.toString()));
    }
  }
}
