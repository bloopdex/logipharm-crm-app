import 'package:bloc/bloc.dart';
import 'package:crm/features/clients/repositories/details.repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/statistics/client_statistics.dart';

part 'client_details_cubit.freezed.dart';
part 'client_details_state.dart';

class ClientDetailsCubit extends Cubit<ClientDetailsState> {
  ClientDetailsCubit() : super(const ClientDetailsState.initial());

  Future<void> load({required int clientId}) async {
    emit(const ClientDetailsState.loading());
    try {
      final response = await ClientDetailsRepository.get(id: clientId);

      final statistics = ClientStatistics.fromJson(response.data['body']);
      emit(ClientDetailsState.loaded(statistics: statistics));
    } catch (e) {
      emit(ClientDetailsState.failure(message: e.toString()));
    }
  }
}
