import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/order/order.dart';
import '../../services/order_service.dart';

part 'orders_cubit.freezed.dart';
part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(const OrdersState.initial());

  Future<void> load({DateTime? from, DateTime? to}) async {
    emit(const OrdersState.loading());
    try {
      final response = await OrderService.getOrders(from: from, to: to);
      if (response.statusCode == 200) {
        final data = response.data['body'] as List? ?? [];
        final orders = data.map((e) => Order.fromJson(e as Map<String, dynamic>)).toList();
        emit(OrdersState.loaded(orders: orders));
      } else {
        emit(OrdersState.failure(message: response.data['message']?.toString() ?? 'Error'));
      }
    } catch (e) {
      emit(OrdersState.failure(message: e.toString()));
    }
  }
}
