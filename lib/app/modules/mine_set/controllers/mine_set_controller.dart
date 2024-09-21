import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:health_water/app/modules/his_list/controllers/his_list_controller.dart';
import 'package:health_water/app/modules/uitils/local_manager.dart';
import 'package:health_water/app/modules/uitils/pm_db.dart';

class MineSetController extends GetxController {
  final allDays = 0.obs;
  final allFinishedDays = 0.obs;

  final ringOn = false.obs;
  @override
  void onInit() {
    super.onInit();

    ringOn.value = HWLocalTool.getBool("ringOn") ?? false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeRingValue(bool value) {
    HWLocalTool.putBool("ringOn", value);
    ringOn.value = value;
  }

  void clear() async {
    await HWDBTool().clean();
    EasyLoading.showToast("Clear Success");
    if (Get.isRegistered<HisListController>()) {
      Get.find<HisListController>().loadDatas();
    }
  }
}
