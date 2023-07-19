import 'package:flutter/material.dart';

import 'package:medicin_app/componanats/constatnts.dart';

br(double height) {
  return SizedBox(
    height: height,
  );
}

brw(double width) {
  return SizedBox(
    width: width,
  );
}

Widget text(String data,
    {Color? color,
    FontWeight? weight,
    double size = 14.0,
    String? font,
    TextAlign? align}) {
  return Text(
    data,
    textAlign: align ?? TextAlign.start,
    style: TextStyle(
        color: color ?? Colors.black,
        fontWeight: weight ?? FontWeight.normal,
        fontSize: size,
        fontFamily: font),
  );
}

EdgeInsets pad25({double? vert}) {
  return EdgeInsets.symmetric(horizontal: 25, vertical: vert ?? 0);
}

snack({required String text, color, int duration = 1}) {
  return ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
    duration: Duration(seconds: duration),
    content: Text(
      text,
      style: const TextStyle(fontFamily: Constants.primaryFont),
    ),
    backgroundColor: color ?? Colors.green[700],
  ));
}

double? getSize() {
  return Get.width * 0.07;
}

AppBar appBar(String title,
    {List<Widget>? actions, double elevation = 4, Widget? titleWidget}) {
  return AppBar(
    title: titleWidget ?? Text(title),
    centerTitle: true,
    actions: actions ?? [],
    elevation: elevation,
  );
}
