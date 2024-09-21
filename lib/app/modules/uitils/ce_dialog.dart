
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:health_water/app/modules/uitils/color_tool.dart';
import 'package:health_water/app/modules/uitils/componets.dart';

class PMAleart extends StatelessWidget {
  final String color;
  final Function() okAction;
  final Function()? cancleAction;
  const PMAleart(
      {super.key,
      this.cancleAction,
      required this.okAction,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: hwGetContainer(
            radius: 10.w,
            width: 300.w,
            height: 200.h,
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                14.verticalSpace,
                hwGetText("复制颜色", fontSize: 14),
                13.verticalSpace,
                hwGetContainer(
                    radius: 15.h,
                    width: 54.w,
                    height: 30.h,
                    color: HWColorTools.hwGetColor(color)),
                9.verticalSpace,
                hwGetText(color, fontSize: 16),
                20.verticalSpace,
                Divider(
                  color: HWColorTools.hwGetColor("#EFEFEF"),
                ),
                SizedBox(
                  height: 46.h,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: InkWell(
                          onTap: Get.back,
                          child: Container(
                            alignment: Alignment.center,
                            child: hwGetText("取消",
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      hwGetContainer(
                        height: 30.h,
                        width: 1,
                        color: HWColorTools.hwGetColor("#EFEFEF"),
                      ),
                      Flexible(
                          flex: 1,
                          child: InkWell(
                            onTap: okAction,
                            child: Container(
                              alignment: Alignment.center,
                              child: hwGetText("复制",
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          )),
                    ],
                  ),
                )
              ],
            )));
  }
}
