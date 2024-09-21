import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:health_water/app/modules/his_list/controllers/his_list_controller.dart';
import 'package:health_water/app/modules/mine_set/controllers/mine_set_controller.dart';
import 'package:health_water/app/modules/uitils/app_util.dart';
import 'package:health_water/app/modules/uitils/hw_model.dart';
import 'package:health_water/app/modules/uitils/pm_db.dart';

class HomeController extends GetxController {
  final timeList = ["07:00", "10:00", "13:00", "16:00", "19:00", "22:00"];
  final finishedList = <int>[].obs;
  final allDateModels = <HWDateModel>[].obs;
  final currentTimeStr = "".obs;
  final todaymodel = Rx<HWDateModel?>(null);

  late Timer _timer;
  @override
  void onInit() {
    super.onInit();
    changeCurrenttime();
    const oneMin = Duration(seconds: 60);
    _timer = Timer.periodic(oneMin, (timer) {
      changeCurrenttime();
    });
  }

  @override
  void onReady() {
    super.onReady();
    
  }

  @override
  void onClose() {
    super.onClose();
  }

  void tofinished(int index) async {
    final tmp = finishedList.value;
    if (!tmp.contains(index)) {
      tmp.add(index);
      finishedList.value = tmp;
      todaymodel.value!.finishItems = tmp;
      await HWDBTool().update(todaymodel.value!);
      todaymodel.update((value) {});

      if (Get.isRegistered<HisListController>()) {
        final vc = Get.find<HisListController>();
        vc.loadDatas();
      }
    }
  }

  void changeCurrenttime() {
    currentTimeStr.value =
        HWAppTools.formatDateOnlyHour(dateTime: DateTime.now());
  }

  void refreshModel() async {
    allDateModels.value = await HWDBTool().getAllDatas();
    todaymodel.value = allDateModels.value.first;
    finishedList.value =
        todaymodel.value!.finishItems!.map((e) => int.parse("$e")).toList();
    print("${finishedList.value}   ${todaymodel.value!.finishItems}");
  }

  void refreshMineData() {
    final itemCount = allDateModels.length;
    var allFinisCount = 0;
    for (var item in allDateModels.value) {
      if (item.finishItems!.length >= 6) {
        allFinisCount += 1;
      }
    }

    if (Get.isRegistered<MineSetController>()) {
      final vc = Get.find<MineSetController>();
      vc.allDays.value = itemCount;
      vc.allFinishedDays.value = allFinisCount;
    }
  }

  void initailData() async {
    final date = DateTime.now();
    final totdy = HWAppTools.formatDateWithoutHour(dateTime: date);
    allDateModels.value = await HWDBTool().getAllDatas();
    if (allDateModels.value.isEmpty || totdy != allDateModels.first.title) {
      final newModel = HWDateModel();
      final millsecs = date.millisecondsSinceEpoch;
      newModel.title = totdy;
      newModel.dateTime = millsecs;
      newModel.finishCount = 0;
      newModel.createTime = millsecs;
      newModel.finishItem = jsonEncode([]);
      await HWDBTool().insertPDateData(newModel);
      refreshModel();
    } else {
      todaymodel.value = allDateModels.value.first;
      finishedList.value =
          todaymodel.value!.finishItems!.map((e) => int.parse("$e")).toList();
      print("${finishedList.value}   ${todaymodel.value!.finishItems}");
    }

    refreshMineData();
  }
}
