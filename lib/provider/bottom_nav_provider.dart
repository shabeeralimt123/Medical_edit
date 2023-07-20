import 'package:flutter/material.dart';
import 'package:medicin_app/screen/empty_screen.dart';
import 'package:medicin_app/screen/home_screen.dart';
import 'package:medicin_app/screen/medical_list.dart';

class BottomNavProvider extends ChangeNotifier {
  Widget currentPage = MedicalList();
  int currentIndex = 0;
  List<Widget> pageBucketIsLogged = [
    MedicalList(),
    Empty(),
    Empty(),
    HomeHeader()
  ];

  Future<void> onBarChanged(int index) async {
    currentIndex = index;
    currentPage = pageBucketIsLogged[index];
    notifyListeners();
  }
}
