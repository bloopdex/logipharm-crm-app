import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../l10n/l10n.dart';
import '../../../tour-plan/models/tour.dart';
import '../../services/visit.repository.dart';

part 'visit_creation_state.dart';
part 'visit_creation_cubit.freezed.dart';

class VisitCreationCubit extends Cubit<VisitCreationState> {
  VisitCreationCubit() : super(const VisitCreationState.initial());

  Future<void> validate({required Map<String, dynamic> data}) async {
    emit(const VisitCreationState.loading());
    final Map<String, dynamic> body = {
      'tourneeId': data['tourneeId'],
      'pharmacieId': data['pharmacieId'],
      'dateDebut': data['dateDebut'],
      'motif': data['motif'],
      'rapport': data['rapport'],
    };
    try {
      final Response response =
          await VisitCreationRepository.validate(data: body);
      if (response.statusCode == 200) {
        Tour tour = Tour.fromJson(response.data['body']);
        emit(VisitCreationState.loaded(tour: tour));
        return;
      } else {
        print("Error Code : ${response.data['codeError']}");
        if (response.data['codeError'] == 'error.tourney.is.not.open') {
          emit(
              VisitCreationState.failure(message: S.current.visitTourIsntOpen));
          return;
        }
        emit(VisitCreationState.failure(message: S.current.error));
        return;
      }
    } catch (e) {
      emit(VisitCreationState.failure(message: e.toString()));
      return;
    }
  }

  void reset() {
    emit(const VisitCreationState.initial());
  }
}
