import 'package:get/get.dart';
import 'package:health_water/app/modules/uitils/hw_model.dart';
import 'package:health_water/app/modules/uitils/pm_db.dart';

class HisListController extends GetxController {
  final allmodels = <HWDateModel>[].obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    loadDatas();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void loadDatas() async {
    final all = await HWDBTool().getAllDatas();
    List<HWDateModel> temp = [];
    for (var element in all) {
      if (element.finishItems!.isNotEmpty) {
        temp.add(element);
      }
    }
    allmodels.value = temp;
  }
}
