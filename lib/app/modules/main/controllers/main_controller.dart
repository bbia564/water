import 'dart:ffi';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:health_water/app/modules/his_list/views/his_list_view.dart';
import 'package:health_water/app/modules/home/views/home_view.dart';
import 'package:health_water/app/modules/mine_set/views/mine_set_view.dart';
import 'package:health_water/app/modules/uitils/local_manager.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;
  final PageController pageController = PageController(initialPage: 0);

  var initialTime = 0;

  List<Widget> pageList = [
    const HomeView(),
    const HisListView(),
    const MineSetView(),
  ];

  @override
  void onInit() {
    super.onInit();

    initialTime = HWLocalTool.getInt("initialTime") ?? 0;

    
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeCurrentPageIndex(int index) {
    currentIndex.value = index;
  }
}
