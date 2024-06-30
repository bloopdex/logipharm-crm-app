import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/claim/claim.dart';
import '../../repositories/claims.repository.dart';

part 'claim_cubit.freezed.dart';
part 'claim_state.dart';

class ClaimCubit extends Cubit<ClaimState> {
  ClaimCubit() : super(const ClaimState.initial());

  Future<void> get({required int pharmacyId}) async {
    emit(const ClaimState.loading());
    try {
      final response = await ClaimRepository.get(id: pharmacyId);

      List<Claim> claims =
          response.data['body'].map<Claim>((claim) => Claim.fromJson(claim)).toList();

      emit(ClaimState.loaded(claims));
    } catch (e) {
      emit(ClaimState.error(e.toString()));
    }
  }

  Future<void> create({required Map<String, dynamic> data}) async {
    emit(const ClaimState.loading());
    try {
      await ClaimRepository.create(data: data);

      get(pharmacyId: data['pharmacieId']);
    } catch (e) {
      emit(ClaimState.error(e.toString()));
    }
  }
}
