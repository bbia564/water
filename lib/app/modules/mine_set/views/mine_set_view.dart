import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:health_water/app/assets/assets.dart';
import 'package:health_water/app/modules/uitils/base_view.dart';
import 'package:health_water/app/modules/uitils/color_tool.dart';
import 'package:health_water/app/modules/uitils/componets.dart';
import '../controllers/mine_set_controller.dart';

class MineSetView extends HWBaseView<MineSetController> {
  const MineSetView({super.key});

  @override
  Widget contentViewBuild(BuildContext context) {
    return Column(
      children: [
        hwGetContainer(
            radius: 10.w,
            padding: EdgeInsets.all(16.w),
            margin: EdgeInsets.all(16.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                10.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(()=>topItem("${controller.allDays.value}", "Cumulatively")),
                    60.horizontalSpace,
                   Obx(()=> topItem("${controller.allFinishedDays.value}", "All Finished"))
                  ],
                ),
                16.verticalSpace,
                hwSepor(),
                10.verticalSpace,
                Row(
                  children: [
                    hwGetText("Ring Open",
                        fontSize: 14, fontWeight: FontWeight.w400),
                    const Spacer(),
                    Obx(() => Switch(
                        activeColor: Colors.white,
                        activeTrackColor: HWColorTools.hwGetColor("#16CBDE"),
                        value: controller.ringOn.value,
                        onChanged: controller.changeRingValue))
                  ],
                ),
                10.verticalSpace,
                hwSepor(),
                15.verticalSpace,
               InkWell(
                onTap: controller.clear,
                child:  Row(
                  children: [
                    hwGetText("Clear",
                        fontSize: 14, fontWeight: FontWeight.w400),
                    const Spacer(),
                    Image.asset(
                      Assets.jinatouGre,
                      height: 20.w,
                      width: 20.w,
                    )
                  ],
                ),
               ),
                15.verticalSpace,
                hwSepor(),
                15.verticalSpace,
                Row(
                  children: [
                    hwGetText("About",
                        fontSize: 14, fontWeight: FontWeight.w400),
                    const Spacer(),
                    Text('1.0.0')
                  ],
                ).paddingOnly(right: 10),
                15.verticalSpace,
              ],
            ))
      ],
    );
  }

  @override
  String viewTitle() {
    return "History";
  }

  Widget topItem(String top, String down) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        hwGetText(top, fontSize: 22),
        6.verticalSpace,
        hwGetText(down,
            fontSize: 14,
            textColor: HWColorTools.hwGetColor("#AAAAAA"),
            fontWeight: FontWeight.w400),
      ],
    );
  }
}
