import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/services/helpers/dio.helper.dart';
import '../../auth/services/auth.repository.dart';
import '../models/visit_result_lov.dart';

part 'visit_result_cubit.freezed.dart';

@freezed
class VisitResultLovState with _$VisitResultLovState {
  const factory VisitResultLovState.initial() = _Initial;
  const factory VisitResultLovState.loading() = _Loading;
  const factory VisitResultLovState.loaded(List<VisitResultLov> data) = _Loaded;
  const factory VisitResultLovState.error(String message) = _Error;
}

class VisitResultLovCubit extends Cubit<VisitResultLovState> {
  VisitResultLovCubit() : super(const VisitResultLovState.initial());

  Future<void> load() async {
    emit(const VisitResultLovState.loading());
    try {
      final token = await AuthRepository.token;
      final response = await DioHelper.getData(url: '/lov/77', token: token);
      final list = (response.data['body'] as List)
          .map((e) => VisitResultLov.fromJson(e))
          .toList();
      emit(VisitResultLovState.loaded(list));
    } catch (e) {
      emit(VisitResultLovState.error(e.toString()));
    }
  }
}
