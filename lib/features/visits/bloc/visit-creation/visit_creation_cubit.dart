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
      // Send contact type as ID string ("1"|"2"|"3")
      'contactType': data['contactType'],
      'rapport': data['rapport'],
      'rapportText': data['rapportText'],
      'longitude': data['longitude'],
      'latitude': data['latitude'],
    };
    // Include dynamic category-specific visit attributes when present
    const dynamicKeys = [
      // Pharmacie
      'nomInterlocuteur', 'fonction', 'receptionPrescription',
      'prescriptionDetails', 'produitConcurrent',
      // Médecin
      'potentiel', 'connaissanceProduit', 'prescripteur',
      'promessePrescription',
      // Shared
      'objections',
      // Patient
      'medecinTraitant', 'specialiteMedecin', 'typeDiabete',
      'patientConnaissanceProduit', 'testeProduit', 'resultatTest',
    ];
    for (final key in dynamicKeys) {
      if (data.containsKey(key) &&
          data[key] != null &&
          data[key].toString().isNotEmpty) {
        body[key] = data[key];
      }
    }
    // Include optional category-specific attributes when present
    const extraKeys = [
      'nomInterlocuteur',
      'fonction',
      'receptionPrescription',
      'prescriptionDetails',
      'produitConcurrent',
      'objections',
      'potentiel',
      'connaissanceProduit',
      'prescripteur',
      'promessePrescription',
      'medecinTraitant',
      'specialiteMedecin',
      'typeDiabete',
      'patientConnaissanceProduit',
      'testeProduit',
      'resultatTest',
    ];
    for (final k in extraKeys) {
      if (data[k] != null && data[k].toString().isNotEmpty) {
        body[k] = data[k];
      }
    }
    // If a contact is selected (company type 0 flow), include it for backend support
    if (data['contactId'] != null) {
      body['contactId'] = data['contactId'];
    }
    try {
      final Response response = await VisitsRepository.validate(data: body);
      if (response.statusCode == 200) {
        TourDetail visit = TourDetail.fromJson(response.data['body']);
        emit(VisitCreationState.loaded(visit: visit));
        return;
      } else {
        switch (response.data['codeError']) {
          case 'error.tournee.is.not.open':
            emit(VisitCreationState.failure(
                message: S.current.visitTourIsntOpen));
            return;
          case 'error.visit.already.entered':
            emit(VisitCreationState.failure(
                message: S.current.visitAlreadyEntered));
            return;
          case 'error.privilege.add.visit':
            emit(VisitCreationState.failure(
                message: S.current.visitPrivilegeMissing));
            return;
          case 'error.visit.date':
            emit(VisitCreationState.failure(message: S.current.visitErrorDate));
            return;
          case 'error.tourney.is.not.open':
            emit(VisitCreationState.failure(
                message: S.current.visitTourIsntOpen));
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
