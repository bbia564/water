
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_water/app/modules/uitils/color_tool.dart';

class CEKeepAliveWrapper extends StatefulWidget {
  const CEKeepAliveWrapper(
      {super.key, @required this.child, this.keepAlive = true});

  final Widget? child;
  final bool keepAlive;

  @override
  State<CEKeepAliveWrapper> createState() => _CEKeepAliveWrapperState();
}

class _CEKeepAliveWrapperState extends State<CEKeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child!;
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;

  @override
  void didUpdateWidget(covariant CEKeepAliveWrapper oldWidget) {
    if (oldWidget.keepAlive != widget.keepAlive) {
      updateKeepAlive();
    }
    super.didUpdateWidget(oldWidget);
  }
}

Container hwGetContainer(
    {double? width,
    double? height,
    double radius = 0,
    Color color = Colors.white,
    double borderWidth = 0.0,
    Color borderColor = const Color(0x00000fff),
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BorderRadiusGeometry? borderRadius,
    Widget? child,
    Gradient? gradient,
    List<BoxShadow>? shadow,
    ImageProvider? bgImg,
    BoxFit? fit,
    Clip? clipBehavior}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(radius)),
        border: Border.all(color: borderColor, width: borderWidth),
        color: color,
        gradient: gradient,
        boxShadow: shadow,
        image: bgImg != null
            ? DecorationImage(
                image: bgImg,
                fit: fit ?? BoxFit.contain,
              )
            : null),
    alignment: alignment,
    padding: padding,
    margin: margin,
    clipBehavior: clipBehavior ?? Clip.antiAlias,
    child: child,
  );
}

Widget hwGetText(
  String text, {
  double fontSize = 16,
  Color? textColor,
  FontWeight fontWeight = FontWeight.bold,
}) {
  return Text(
    text,
    style: TextStyle(
        color: textColor ?? Colors.black,
        fontSize: fontSize.sp,
        fontWeight: fontWeight),
  );
}

Widget hwSepor() {
  return Divider(
    color: HWColorTools.hwGetColor("#EBEBEB"),
    height: 1,
    thickness: 0,
    indent: 0,
    endIndent: 0,
  );
}
