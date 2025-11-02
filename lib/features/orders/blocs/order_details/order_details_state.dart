part of 'order_details_cubit.dart';

@freezed
class OrderDetailsState with _$OrderDetailsState {
  const factory OrderDetailsState.initial() = _Initial;
  const factory OrderDetailsState.loading() = _Loading;
  const factory OrderDetailsState.loaded({required List<OrderDetail> details}) =
      _Loaded;
  const factory OrderDetailsState.failure({required String message}) = _Failure;
}
