import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:health_water/app/assets/assets.dart';



abstract class HWBaseView<T extends GetxController> extends GetView<T> {
  const HWBaseView({super.key});

  Widget _buildBgView() {
    return Image.asset(
      Assets.background,
      height: 1.sh,
      width: 1.sw,
      fit: BoxFit.fill,
    );
  }

  String viewTitle();
  Widget contentViewBuild(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            viewTitle(),
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            _buildBgView(),
            Positioned(
              top:
                  kMinInteractiveDimension + MediaQuery.of(context).padding.top,
              bottom: 0,
              right: 0,
              left: 0,
              child: contentViewBuild(context),
            ),
          ],
        ));
  }
}
