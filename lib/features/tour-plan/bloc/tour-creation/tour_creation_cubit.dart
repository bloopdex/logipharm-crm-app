import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../l10n/l10n.dart';
import '../../models/tour.dart';
import '../../services/creation.repository.dart';

part 'tour_creation_state.dart';
part 'tour_creation_cubit.freezed.dart';

class TourCreationCubit extends Cubit<TourCreationState> {
  TourCreationCubit() : super(const TourCreationState.initial());

  Future<void> validate({required Map<String, dynamic> data}) async {
    emit(const TourCreationState.loading());

    try {
      final Response response = await CreationRepository.validate(data: data);
      if (response.statusCode == 200) {
        Tour tour = Tour.fromJson(response.data['body']);
        emit(TourCreationState.loaded(tour: tour));
        return;
      } else {
        emit(TourCreationState.failure(message: S.current.error));
        return;
      }
    } catch (e) {
      emit(TourCreationState.failure(message: e.toString()));
      return;
    }
  }

  void reset() {
    emit(const TourCreationState.initial());
  }
}
