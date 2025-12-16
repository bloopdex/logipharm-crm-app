import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/contact.dart';
import '../services/contacts.repository.dart';

part 'contacts_cubit.freezed.dart';

@freezed
class ContactsState with _$ContactsState {
  const factory ContactsState.initial() = _Initial;
  const factory ContactsState.loading() = _Loading;
  const factory ContactsState.loaded(List<Contact> contacts) = _Loaded;
  const factory ContactsState.error(String message) = _Error;
}

class ContactsCubit extends Cubit<ContactsState> {
  ContactsCubit() : super(const ContactsState.initial());

  Future<void> load({List<String>? categories}) async {
    emit(const ContactsState.loading());
    try {
      final response = await ContactsRepository.list(categories: categories);
      if (response.statusCode == 200) {
        final List<dynamic> list = response.data['body'] as List<dynamic>;
        final contacts = list.map((e) => Contact.fromJson(e as Map<String, dynamic>)).toList();
        emit(ContactsState.loaded(contacts));
      } else {
        emit(ContactsState.error(response.data.toString()));
      }
    } catch (e) {
      emit(ContactsState.error(e.toString()));
    }
  }
}
