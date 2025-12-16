import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/order/order_detail.dart';
import '../../services/order_service.dart';

part 'order_details_cubit.freezed.dart';
part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit() : super(const OrderDetailsState.initial());

  Future<void> load(int orderId) async {
    emit(const OrderDetailsState.loading());
    try {
      final response = await OrderService.getOrderDetails(orderId: orderId);
      if (response.statusCode == 200) {
        final data = response.data['body'] as List? ?? [];
        final details = data.map((e) => OrderDetail.fromJson(e as Map<String, dynamic>)).toList();
        emit(OrderDetailsState.loaded(details: details));
      } else {
        emit(OrderDetailsState.failure(message: response.data['message']?.toString() ?? 'Error'));
      }
    } catch (e) {
      emit(OrderDetailsState.failure(message: e.toString()));
    }
  }
}
