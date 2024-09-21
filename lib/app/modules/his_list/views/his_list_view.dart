import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:health_water/app/assets/assets.dart';
import 'package:health_water/app/modules/uitils/base_view.dart';
import 'package:health_water/app/modules/uitils/color_tool.dart';
import 'package:health_water/app/modules/uitils/componets.dart';
import 'package:health_water/app/modules/uitils/hw_model.dart';

import '../controllers/his_list_controller.dart';

class HisListView extends HWBaseView<HisListController> {
  const HisListView({super.key});

  @override
  Widget contentViewBuild(BuildContext context) {
    return hwGetContainer(
        padding: EdgeInsets.all(16.h),
        radius: 10.w,
        margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
        child: ListView.builder(
          itemCount: controller.allmodels.length,
          // shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            final model = controller.allmodels[index];
            return InkWell(
              onTap: () {
                Get.toNamed('/list-detail',arguments: {"model":model});
              },
              child: _cell(model),
            );
          },
        ));
  }

  @override
  String viewTitle() {
    return "History";
  }

  Widget _cell(HWDateModel model) {
    final allFinished = model.finishItems!.length >= 6;

    final text = allFinished ? "All-finished" : "${model.finishItems?.length}-time";
    return SizedBox(
      height: 54.h,
      child: Row(
        children: [
          hwGetText(model.title ?? ""),
          const Spacer(),
          hwGetText(text,
              textColor: allFinished
                  ? HWColorTools.hwGetColor("#FF9E1A")
                  : HWColorTools.hwGetColor("#16CBDE")),
          10.horizontalSpace,
          Image.asset(
            Assets.jinatouGre,
            height: 20.h,
            width: 20.h,
          )
        ],
      ),
    );
  }
}
