import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/claims/motif.dart';
import '../../repositories/details.repository.dart';

part 'category_cubit.freezed.dart';
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(const CategoryState.initial());

  Future<void> get() async {
    emit(const CategoryState.loading());
    try {
      final response = await ClientDetailsRepository.categories();
      List<ClaimMotif> categories =
          response.data['body'].map<ClaimMotif>((cat) => ClaimMotif.fromJson(cat)).toList();
      emit(CategoryState.loaded(categories));
    } catch (e) {
      emit(CategoryState.error(e.toString()));
    }
  }
}
