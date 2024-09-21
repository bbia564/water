import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:health_water/app/modules/uitils/color_tool.dart';
import 'package:health_water/app/modules/uitils/componets.dart';

import '../controllers/list_detail_controller.dart';

class ListDetailView extends GetView<ListDetailController> {
  const ListDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: hwGetText(controller.model.title ?? ""),
        centerTitle: true,
      ),
      body: Container(
        
        child: ListView.builder(
          itemCount: controller.model.finishItems?.length ?? 0,
        padding: EdgeInsets.all(16.w),
        itemBuilder: (context, index) {
          final int num = controller.model.finishItems?[index] ?? 0;
          return _cell(num);
        },
      ),
      ),
    );
  }

  Widget _cell(int index) {
    final title = controller.timeList[index];

    return hwGetContainer(
      height: 48.h,
      radius: 10.w,
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          hwGetText(title),
          const Spacer(),
          hwGetText("Finished", textColor: HWColorTools.hwGetColor("#16CBDE"))
        ],
      ),
    );
  }
}
