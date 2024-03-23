import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../../create-plan/services/wilaya.repository.dart';
import '../models/wilaya/wilaya.dart';

class WilayaCubit extends Cubit<List<Wilaya>> {
  WilayaCubit() : super([]);

  Future<void> load() async {
    try {
      final Response response = await WilayaRepository.get();
      if (response.statusCode == 200) {
        List<Wilaya> delegates = response.data['body']
            .map<Wilaya>((delegate) => Wilaya.fromJson(delegate))
            .toList();
        emit(delegates);
      } else {
        emit([]);
      }
    } catch (e) {
      emit([]);
    }
  }
}
