import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:medicin_app/componanats/constatnts.dart';
// ignore_for_file: deprecated_member_use

showLoaderDialog(BuildContext context, {bool isRootNav = false}) {
  showDialog(
      context: context,
      useRootNavigator: isRootNav,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()));
}

deleteDialog({required Function onConfirm, String keyName = "Item"}) {
  Get.defaultDialog(
    title: "Delete $keyName",
    middleText: "Are you sure you want delete this $keyName?",
    radius: 5,
    titlePadding: const EdgeInsets.only(top: 15),
    contentPadding: pad25(vert: 10),
    confirm: ElevatedButton(
      onPressed: () {
        onConfirm();
        Get.back();
        // snack(text: "$keyName is deleted");
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.red[800]),
      ),
      child: text("Yes, Delete", color: Colors.white),
    ),
    cancel: ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: text("No", color: Colors.white)),
  );
}

showDialogueBox(BuildContext context,
    {String? title,
    @required String? message,
    VoidCallback? onCompleted,
    bool useRootNavigator = false,
    bool showCancelButton = false,
    String? button1,
    String? button2,
    VoidCallback? onCancelled}) {
  showDialog(
      context: context,
      useRootNavigator: useRootNavigator,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
            title: Center(
              child: Text(
                title ?? "Delete the product !",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            content: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                message!,
                style: TextStyle(color: Colors.red[800]),
              ),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Constants.primaryColor, // Background color
                    ),
                    child: Text(
                      button2 ?? "No",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      if (onCancelled != null) {
                        onCancelled();
                      }
                    },
                  ),
                  kWidth(8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[800], // Background color
                    ),
                    child: Text(
                      button1 ?? "Yes",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      if (onCompleted != null) {
                        onCompleted();
                      }
                    },
                  ),
                ],
              )
            ],
          ));
}

kHight(double height) {
  return SizedBox(
    height: height,
  );
}

kWidth(double width) {
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

EdgeInsets pad12({double? vert}) {
  return EdgeInsets.symmetric(horizontal: 12, vertical: vert ?? 0);
}

// snack({required String text, color, int duration = 1, BuildContext? context}) {
//   return ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
//     duration: Duration(seconds: duration),
//     content: Text(
//       text,
//       style: const TextStyle(fontFamily: Fonts.primaryFont),
//     ),
//     backgroundColor: color ?? Colors.green[700],
//   ));
// }

// AppBar appBar(String title,
//     {List<Widget>? actions, double elevation = 4, Widget? titleWidget}) {
//   return AppBar(
//     title: titleWidget ?? Text(title),
//     centerTitle: true,
//     actions: actions ?? [],
//     elevation: elevation,
//     backgroundColor: AppColors.primaryColor,
//   );
// }

// void showAlertDialog(BuildContext context, String title, String message) {
//   Widget continueButton = ElevatedButton(
//     style: ElevatedButton.styleFrom(
//       backgroundColor: AppColors.primaryColor, // Background color
//     ),
//     child: const Text("Continue"),
//     onPressed: () {
//       Navigator.of(context).pop();
//     },
//   );
//   AlertDialog alert = AlertDialog(
//     title: Text(title),
//     content: Text(message),
//     actions: [
//       continueButton,
//     ],
//   );
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }
