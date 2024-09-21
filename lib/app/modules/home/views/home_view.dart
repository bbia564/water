import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:health_water/app/assets/assets.dart';

import 'package:health_water/app/modules/uitils/base_view.dart';
import 'package:health_water/app/modules/uitils/color_tool.dart';
import 'package:health_water/app/modules/uitils/componets.dart';
import '../controllers/home_controller.dart';

class HomeView extends HWBaseView<HomeController> {
  const HomeView({super.key});

  @override
  Widget contentViewBuild(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 25.h,
            left: 35.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => hwGetText(controller.currentTimeStr.value,
                    fontSize: 40, fontWeight: FontWeight.w800)),
                4.verticalSpace,
                hwGetText("  Current-Time",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    textColor: HWColorTools.hwGetColor("#585858")),
              ],
            )),
        hwGetContainer(
            padding: EdgeInsets.all(16.h),
            radius: 10.w,
            margin: EdgeInsets.fromLTRB(16.w, 120.h, 16.w, 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                hwGetText(" 6 glasses of water a day", fontWeight: FontWeight.w800),
                4.verticalSpace,
                hwGetText("  Promote gastrointestinal peristalsis\n improve dry skin, etc",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    textColor: HWColorTools.hwGetColor("#848484")),
                10.verticalSpace,
                Expanded(
                    child: Obx(() => controller.todaymodel.value == null
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            itemCount: controller.timeList.length,
                            // shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return mianCell(
                                  index,
                                  controller.finishedList.value
                                      .contains(index));
                            },
                          )))
              ],
            )),
        Positioned(
            top: 25.h,
            right: 20.w,
            child: Image.asset(
              Assets.iconBig,
              width: 140.w,
              height: 148.h,
            ))
      ],
    );
  }

  @override
  String viewTitle() {
    return "Loves drinking water";
  }

  Widget mianCell(int index, bool finished) {
    final title = controller.timeList[index];
    return hwGetContainer(
        radius: 10.w,
        borderColor: HWColorTools.hwGetColor("#EAEAEA"),
        color: HWColorTools.hwGetColor("#F7F7F7"),
        margin: EdgeInsets.only(bottom: 10.h),
        padding: EdgeInsets.all(15.w),
        child: Row(
          children: [
            Image.asset(
              Assets.cellIcon,
              width: 35.w,
              height: 35.h,
            ),
            16.horizontalSpace,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                hwGetText(title, fontSize: 20, fontWeight: FontWeight.w800),
                2.verticalSpace,
                hwGetText("${index + 1}th glasses",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    textColor: HWColorTools.hwGetColor("#585858")),
              ],
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                if (finished) {
                  return;
                }
                controller.tofinished(index);
              },
              child: hwGetContainer(
                  radius: 22.h,
                  width: 88.w,
                  height: 44.h,
                  color: finished
                      ? HWColorTools.hwGetColor("#CCCCCC")
                      : HWColorTools.hwGetColor("#16CBDE"),
                  alignment: Alignment.center,
                  child: hwGetText(finished ? "Finished" : "Drink",
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      textColor: Colors.white)),
            )
          ],
        ));
  }
}
