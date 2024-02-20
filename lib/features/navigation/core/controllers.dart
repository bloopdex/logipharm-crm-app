import 'package:flutter/material.dart';

class TabControllers {
  static TabController? medicamentTabController;
  static TabController? orderTabController;

  static void init(
      {required TabController medicamentController,
      required TabController orderController}) {
    medicamentTabController = medicamentController;
    orderTabController = orderController;
  }
}
