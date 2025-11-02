import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/order/realization.dart';
import '../../services/order_service.dart';

part 'realization_cubit.freezed.dart';
part 'realization_state.dart';

class RealizationCubit extends Cubit<RealizationState> {
  RealizationCubit() : super(const RealizationState.initial());

  Future<void> load({int? year, int? month}) async {
    emit(const RealizationState.loading());
    try {
      final response =
          await OrderService.getRealisation(year: year, month: month);
      if (response.statusCode == 200) {
        final data = response.data['body'];
        final list = (data as List?)
                ?.map((e) =>
                    DelegateRealization.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [];
        emit(RealizationState.loaded(list: list));
      } else {
        emit(RealizationState.failure(
            message: response.data['message']?.toString() ?? 'Error'));
      }
    } catch (e) {
      emit(RealizationState.failure(message: e.toString()));
    }
  }
}
