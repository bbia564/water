import 'dart:io';
import 'package:get/get.dart';
import 'app/modules/his_list/bindings/his_list_binding.dart';
import 'app/modules/his_list/views/his_list_view.dart';
import 'app/modules/home/bindings/home_binding.dart';
import 'app/modules/home/views/home_view.dart';
import 'app/modules/list_detail/bindings/list_detail_binding.dart';
import 'app/modules/list_detail/views/list_detail_view.dart';
import 'app/modules/main/bindings/main_binding.dart';
import 'app/modules/main/views/main_view.dart';
import 'app/modules/mine_set/bindings/mine_set_binding.dart';
import 'app/modules/mine_set/views/mine_set_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:health_water/app/modules/uitils/app_util.dart';
import 'package:health_water/app/modules/uitils/color_tool.dart';

import 'app/modules/uitils/hd_tool.dart';
import 'app/modules/water_man/water_man_binding.dart';
import 'app/modules/water_man/water_man_view.dart';

void main() {
  runApp(_initApp());
}

Widget ceInitGetMaterialApp({
  Widget Function(BuildContext, Widget?)? builder,
}) {
  return GetMaterialApp(
    darkTheme: ThemeData.dark(),
    useInheritedMediaQuery: true,
    themeMode: ThemeMode.light,
    fallbackLocale: const Locale("zh", "CN"),
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    getPages: HomeLists,
    defaultTransition: Transition.rightToLeft,
    theme: ThemeData(
        scaffoldBackgroundColor: HWColorTools.hwGetColor("#F2F2F2"),
        indicatorColor: Colors.grey,
        brightness: Brightness.light,
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.white.withOpacity(0),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarIconBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.white,
          ),
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0.0,
        ),
        bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
        bottomNavigationBarTheme:
            const BottomNavigationBarThemeData(backgroundColor: Colors.white)),
    builder: builder,
    supportedLocales: const [
      Locale('zh', 'CN'),
      Locale('en', 'US'),
    ],
    localizationsDelegates: const [
      GlobalWidgetsLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
  );
}

_initApp() {
  if (!kIsWeb && Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  Widget body = ceInitGetMaterialApp(
    builder: (context, child) {
      final easyLoading = EasyLoading.init();

      return ScreenUtilInit(
        designSize: const Size(375, 812),
        useInheritedMediaQuery: true,
        builder: (p0, p1) {
          Widget body = GestureDetector(
            onTap: () {
              HWAppTools.keyboardDismis(context);
            },
            child: child,
          );
          body = easyLoading(context, body);
          return body;
        },
      );
    },
  );
  return body;
}
List<GetPage<dynamic>> HomeLists = [
  GetPage(
    name: '/',
    page: () => const WaterManView(),
    binding: WaterManBinding(),
  ),
  GetPage(
    name: '/home',
    page: () => const HomeView(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: '/his-list',
    page: () => const HisListView(),
    binding: HisListBinding(),
  ),
  GetPage(
    name: '/tto',
    page: () => const HdTool(),
  ),
  GetPage(
    name: '/mine-set',
    page: () => const MineSetView(),
    binding: MineSetBinding(),
  ),
  GetPage(
    name: '/main',
    page: () => const MainView(),
    binding: MainBinding(),
  ),
  GetPage(
    name: '/list-detail',
    page: () => const ListDetailView(),
    binding: ListDetailBinding(),
  ),
];