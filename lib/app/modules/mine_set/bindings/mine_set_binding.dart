import 'package:get/get.dart';

import '../controllers/mine_set_controller.dart';

class MineSetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MineSetController>(
      () => MineSetController(),
    );
  }
}
