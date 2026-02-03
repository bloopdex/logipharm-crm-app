import 'package:bloc/bloc.dart';
import 'package:crm/features/auth/services/auth.repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/product_dto.dart';
import '../offers_repository.dart';
part 'products_cubit.freezed.dart';
part 'products_state.dart';

class OfferProductsCubit extends Cubit<OfferProductsState> {
  OfferProductsCubit({OffersRepository? repository})
      : _repository = repository ?? const OffersRepository(),
        super(const OfferProductsState.initial());

  final OffersRepository _repository;

  Future<void> load(int offerId) async {
    emit(const OfferProductsState.loading());
    try {
      final token = await AuthRepository.token;
      if (token == null) {
        emit(const OfferProductsState.error('Missing credentials'));
        return;
      }
      final products = await _repository.getProducts(
        authToken: token,
        offerId: offerId,
      );
      if (products.isEmpty) {
        emit(const OfferProductsState.empty());
      } else {
        emit(OfferProductsState.loaded(products));
      }
    } catch (e) {
      emit(OfferProductsState.error(e.toString()));
    }
  }
}
