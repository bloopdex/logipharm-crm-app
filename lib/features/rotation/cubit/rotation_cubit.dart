import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/product_rotation.dart';
import '../repositories/rotation_repository.dart';

part 'rotation_cubit.freezed.dart';

// ============================================================================
// State Definition
// ============================================================================

@freezed
class RotationState with _$RotationState {
  const factory RotationState.initial() = _Initial;
  const factory RotationState.loading() = _Loading;
  const factory RotationState.loaded(ProductRotationResponse data) = _Loaded;
  const factory RotationState.error({required String message}) = _Error;
}

// ============================================================================
// Cubit Definition
// ============================================================================

class RotationCubit extends Cubit<RotationState> {
  RotationCubit() : super(const RotationState.initial());

  Future<void> loadProductRotation({
    required DateTime startDate,
    required DateTime endDate,
    int limit = 1000,
    String? productName,
  }) async {
    emit(const RotationState.loading());

    try {
      final startFormatted = _formatDate(startDate);
      final endFormatted = _formatDate(endDate);

      final response = await RotationRepository.getProductRotation(
        startDate: startFormatted,
        endDate: endFormatted,
        limit: limit,
        productName: productName,
      );

      if (response.statusCode == 200 && response.data['body'] != null) {
        final rotationData = ProductRotationResponse.fromJson(response.data['body']);
        emit(RotationState.loaded(rotationData));
      } else {
        emit(RotationState.error(
          message: response.data['message'] ?? 'Failed to load product rotation',
        ));
      }
    } catch (e) {
      log('Error loading product rotation: $e');
      emit(RotationState.error(message: e.toString()));
    }
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  void reset() {
    emit(const RotationState.initial());
  }
}