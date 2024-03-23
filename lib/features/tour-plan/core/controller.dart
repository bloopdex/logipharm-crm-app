import 'package:flutter/material.dart';

class TourTabController {
  static TabController? controller;

  static void setController(TabController tabController) {
    controller = tabController;
  }
}