import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medicin_app/componanats/constatnts.dart';
import 'package:medicin_app/componanats/widgets.dart';
import 'package:medicin_app/screen/home_screen.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    //firstTimeCreateDB();

    Timer(const Duration(milliseconds: 2500), () {
      
     Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  Home()),
  );
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              height: Get.height,
              width: Get.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/pattern.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: Get.height,
              width: Get.width,
              color: Colors.white70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Align(
                  //   alignment: Alignment.center,
                  //   child: Image.asset(
                  //     "assets/images/logo-c.png",
                  //     height: Get.width * 0.5,
                  //   ),
                  // ),
                  br(15),
                  text("Dent Care Mannarkad",
                      color: Constants.primaryColor, size: 22)
                ],
              ),
            ),
          ],
        ));
  }
}
