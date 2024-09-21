import 'package:get/get.dart';

import 'water_man_logic.dart';

class WaterManBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
