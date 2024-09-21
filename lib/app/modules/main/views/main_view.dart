import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:health_water/app/assets/assets.dart';
import 'package:health_water/app/modules/uitils/color_tool.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: PageView(
            controller: controller.pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (value) {
              controller.currentIndex.value = value;
            },
            children: controller.pageList,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            fixedColor: HWColorTools.hwGetColor("#16CBDE"),
            onTap: (value) {
              controller.currentIndex.value = value;
              controller.pageController.jumpToPage(value);
            },
            unselectedLabelStyle: TextStyle(
                color: HWColorTools.hwGetColor("#292929"),
                fontSize: 12.sp,
                fontWeight: FontWeight.w400),
            selectedLabelStyle: TextStyle(
                color: HWColorTools.hwGetColor("#16CBDE"),
                fontSize: 12.sp,
                fontWeight: FontWeight.w600),
            items: [
              BottomNavigationBarItem(
                  icon: _tbTbarItem(Assets.mainGre),
                  activeIcon: _tbTbarItem(Assets.mainBlue),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: _tbTbarItem(Assets.hisGrey),
                  activeIcon: _tbTbarItem(Assets.hisBlue),
                  label: "History"),
              BottomNavigationBarItem(
                label: "Settings",
                icon: _tbTbarItem(Assets.mineGre),
                activeIcon: _tbTbarItem(Assets.mainBlue),
              )
            ],
          ),
        ));
  }

  Widget _tbTbarItem(String name) {
    return Image.asset(
      name,
      height: 22.h,
      width: 22.h,
      fit: BoxFit.cover,
    );
  }
}
