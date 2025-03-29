import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../l10n/l10n.dart';
import '../../models/eventvisite/eventvisite.dart';
import '../../repositories/event_visits_repository.dart';

part 'create_event_visit_cubit.freezed.dart';
part 'create_event_visit_state.dart';

class CreateEventVisitCubit extends Cubit<CreateEventVisitState> {
  CreateEventVisitCubit() : super(const CreateEventVisitState.initial());

  Future<void> createEventVisit({required Map<String, dynamic> data}) async {
    emit(const CreateEventVisitState.loading());
    final Map<String, dynamic> body = {
      'evenementId': data['evenementId'],
      'date': data['date'],
      'nom': data['nom'],
      'prenom': data['prenom'],
      'address': data['address'],
      'telephone': data['telephone'],
      'email': data['email'],
      'remarque': data['remarque'],
    };

    try {
      final Response response = await EventVisitsRepository.validate(data: body);
      if (response.statusCode == 201) {
        EventVisite eventVisit = EventVisite.fromJson(response.data['body']);
        emit(CreateEventVisitState.loaded(eventVisit: eventVisit));
        return;
      } else {
        switch (response.data['codeError']) {
          default:
            emit(CreateEventVisitState.failure(message: S.current.error));
            return;
        }
      }
    } catch (e) {
      log(e.toString());
      emit(CreateEventVisitState.failure(message: e.toString()));
      return;
    }
  }

  void reset() {
    emit(const CreateEventVisitState.initial());
  }
}
