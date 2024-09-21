import 'package:get/get.dart';

import '../controllers/his_list_controller.dart';

class HisListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HisListController>(
      () => HisListController(),
    );
  }
}
