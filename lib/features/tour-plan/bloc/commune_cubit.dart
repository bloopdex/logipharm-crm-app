import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../models/commune/commune.dart';
import '../services/commune.repository.dart';

class CommuneCubit extends Cubit<List<Commune>> {
  CommuneCubit() : super([]);

  Future<void> load() async {
    try {
      final Response response = await CommuneRepository.get();
      if (response.statusCode == 200) {
        List<Commune> delegates =
            response.data['body'].map<Commune>((delegate) => Commune.fromJson(delegate)).toList();
        emit(delegates);
      } else {
        emit([]);
      }
    } catch (e) {
      emit([]);
    }
  }
}
