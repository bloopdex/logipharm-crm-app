import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../models/contact_type.dart';
import '../services/contact_type.repository.dart';

class ContactTypeCubit extends Cubit<List<ContactType>> {
  ContactTypeCubit() : super(const []);

  Future<void> load() async {
    try {
      final Response response = await ContactTypeRepository.get();
      if (response.statusCode == 200) {
        final List<ContactType> types = (response.data['body'] as List)
            .map<ContactType>(
                (e) => ContactType.fromJson(e as Map<String, dynamic>))
            .toList();
        emit(types);
      } else {
        emit(const []);
      }
    } catch (_) {
      emit(const []);
    }
  }
}
