import 'package:get/get.dart';
import 'package:health_water/app/modules/his_list/controllers/his_list_controller.dart';
import 'package:health_water/app/modules/home/controllers/home_controller.dart';
import 'package:health_water/app/modules/mine_set/controllers/mine_set_controller.dart';
import 'package:health_water/app/modules/uitils/local_manager.dart';
import 'package:health_water/app/modules/uitils/pm_db.dart';

import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    HWLocalTool.initialize();
    HWDBTool().init();
    Get.lazyPut<MainController>(
      () => MainController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<HisListController>(
      () => HisListController(),
    );
    Get.lazyPut<MineSetController>(
      () => MineSetController(),
    );
  }
}
