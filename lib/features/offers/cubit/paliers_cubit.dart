import 'package:bloc/bloc.dart';
import 'package:crm/features/auth/services/auth.repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/palier_dto.dart';
import '../offers_repository.dart';
part 'paliers_cubit.freezed.dart';
part 'paliers_state.dart';

class OfferPaliersCubit extends Cubit<OfferPaliersState> {
  OfferPaliersCubit({OffersRepository? repository})
      : _repository = repository ?? const OffersRepository(),
        super(const OfferPaliersState.initial());

  final OffersRepository _repository;

  Future<void> load(int offerId) async {
    emit(const OfferPaliersState.loading());
    try {
      final token = await AuthRepository.token;
      if (token == null) {
        emit(const OfferPaliersState.error('Missing credentials'));
        return;
      }
      final paliers = await _repository.getPaliers(
        authToken: token,
        offerId: offerId,
      );
      if (paliers.isEmpty) {
        emit(const OfferPaliersState.empty());
      } else {
        emit(OfferPaliersState.loaded(paliers));
      }
    } catch (e) {
      emit(OfferPaliersState.error(e.toString()));
    }
  }
}
