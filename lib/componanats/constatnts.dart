
import 'package:flutter/material.dart';

export 'package:get/get.dart';


// FabexFormatter fabex = FabexFormatter();

// late Box mainBox;
// late Box bookKeepBox;
// late Box booksBox;
// late Box notesBox;
// late Box contentIndex;
// late Box topicsBox;

class Constants {
  static const Color primaryColor = Color(_primaryColorVal);
  static const Color secondaryGold = Color(0xffFFC987);

  static const String primaryFont = "Nunito";
  static const String tajawalFont = "Tajawal";
  static const String sakkal = "Sakkal";
  static const String malFont = "NotoSerifMalayalam";
  static const String rootURL =
      "https://firebasestorage.googleapis.com/v0/b/prabhashanakosham.appspot.com";

  static const String thumbURL = "$rootURL/o/thumbs%2F";
  static const String bookUrl = "$rootURL/o/books%2F";
}

const int _primaryColorVal = 0xff00463C;

const MaterialColor primarySwatch = MaterialColor(
  _primaryColorVal,
  <int, Color>{
    50: Color(0xFF8e44ad),
    100: Color(0xffdcdde1),
    200: Color(0xff74b9ff),
    300: Color(_primaryColorVal),
    400: Color(0xFF2ecc71),
    500: Color(_primaryColorVal),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);
