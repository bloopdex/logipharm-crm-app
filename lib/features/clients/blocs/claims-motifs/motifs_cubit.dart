import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/claims/motif.dart';
import '../../repositories/claims.repository.dart';

part 'motifs_cubit.freezed.dart';
part 'motifs_state.dart';

class ClaimMotifCubit extends Cubit<ClaimMotifState> {
  ClaimMotifCubit() : super(const ClaimMotifState.initial());

  Future<void> get() async {
    emit(const ClaimMotifState.loading());
    try {
      final response = await ClaimRepository.motifs();

      List<ClaimMotif> claims =
          response.data['body'].map<ClaimMotif>((claim) => ClaimMotif.fromJson(claim)).toList();

      emit(ClaimMotifState.loaded(claims));
    } catch (e) {
      emit(ClaimMotifState.error(e.toString()));
    }
  }
}
