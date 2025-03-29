import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../../../models/person/person.dart';
import '../services/delegate.repository.dart';

class DelegateCubit extends Cubit<List<Person>> {
  DelegateCubit() : super([]);

  Future<void> load() async {
    try {
      final Response response = await DelegateRepository.get();
      if (response.statusCode == 200) {
        List<Person> delegates =
            response.data['body'].map<Person>((delegate) => Person.fromJson(delegate)).toList();
        emit(delegates);
      } else {
        emit([]);
      }
    } catch (e) {
      emit([]);
    }
  }

  void reset() {
    emit([]);
  }
}
