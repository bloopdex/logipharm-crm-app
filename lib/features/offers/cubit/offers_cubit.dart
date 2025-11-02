import 'package:bloc/bloc.dart';
import 'package:crm/features/auth/services/auth.repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/offer_dto.dart';
import '../offers_repository.dart';
part 'offers_cubit.freezed.dart';
part 'offers_state.dart';

class OffersCubit extends Cubit<OffersState> {
  OffersCubit({OffersRepository? repository})
      : _repository = repository ?? const OffersRepository(),
        super(const OffersState.initial());

  final OffersRepository _repository;

  Future<void> load({bool refresh = false}) async {
    emit(const OffersState.loading());
    try {
      final token = await AuthRepository.token;
      final companyId = await AuthRepository.companyId;
      if (token == null || companyId == null) {
        emit(const OffersState.error('Missing credentials'));
        return;
      }

      final offers =
          await _repository.getOffers(authToken: token, companyId: companyId);
      if (offers.isEmpty) {
        emit(const OffersState.empty());
      } else {
        emit(OffersState.loaded(offers));
      }
    } catch (e) {
      emit(OffersState.error(e.toString()));
    }
  }
}
