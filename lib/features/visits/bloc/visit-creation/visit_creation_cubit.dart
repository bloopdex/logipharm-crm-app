import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../l10n/l10n.dart';
import '../../../tour-plan/models/tour.dart';
import '../../services/visit.repository.dart';

part 'visit_creation_cubit.freezed.dart';
part 'visit_creation_state.dart';

class VisitCreationCubit extends Cubit<VisitCreationState> {
  VisitCreationCubit() : super(const VisitCreationState.initial());

  Future<void> validate({required Map<String, dynamic> data}) async {
    emit(const VisitCreationState.loading());
    final Map<String, dynamic> body = {
      'tourneeId': data['tourneeId'],
      'pharmacieId': data['pharmacieId'],
      'dateDebut': data['dateDebut'],
      'dateFin': DateTime.now().toIso8601String(),
      'motif': data['motif'],
      'rapport': data['rapport'],
      'rapportText': data['rapportText'],
      'longitude': data['longitude'],
      'latitude': data['latitude'],
    };
    try {
      final Response response = await VisitsRepository.validate(data: body);
      if (response.statusCode == 200) {
        TourDetail visit = TourDetail.fromJson(response.data['body']);
        emit(VisitCreationState.loaded(visit: visit));
        return;
      } else {
        switch (response.data['codeError']) {
          case 'error.tournee.is.not.open':
            emit(VisitCreationState.failure(message: S.current.visitTourIsntOpen));
            return;
          case 'error.visit.already.entered':
            emit(VisitCreationState.failure(message: S.current.visitAlreadyEntered));
            return;
          case 'error.privilege.add.visit':
            emit(VisitCreationState.failure(message: S.current.visitPrivilegeMissing));
            return;
          case 'error.visit.date':
            emit(VisitCreationState.failure(message: S.current.visitErrorDate));
            return;
          case 'error.tourney.is.not.open':
            emit(VisitCreationState.failure(message: S.current.visitTourIsntOpen));
            return;
          default:
            emit(VisitCreationState.failure(message: S.current.error));
            return;
        }
      }
    } catch (e) {
      log(e.toString());
      emit(VisitCreationState.failure(message: e.toString()));
      return;
    }
  }

  void reset() {
    emit(const VisitCreationState.initial());
  }
}
