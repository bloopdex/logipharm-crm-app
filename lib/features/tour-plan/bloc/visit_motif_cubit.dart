import 'package:bloc/bloc.dart';
import 'package:crm/features/tour-plan/models/motif_visit/motif_visit.dart';
import 'package:dio/dio.dart';

import '../services/motif.repository.dart';

class MotifVisitCubit extends Cubit<List<MotifVisit>> {
  MotifVisitCubit() : super([]);

  Future<void> load() async {
    try {
      final Response response = await VisitMotifRepository.get();
      if (response.statusCode == 200) {
        List<MotifVisit> motifs = response.data['body']
            .map<MotifVisit>((delegate) => MotifVisit.fromJson(delegate))
            .toList();
        emit(motifs);
      } else {
        emit([]);
      }
    } catch (e) {
      emit([]);
    }
  }
}
