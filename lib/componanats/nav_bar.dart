import 'package:flutter/material.dart';
import 'package:medicin_app/componanats/constatnts.dart';

BottomNavigationBar HomeBottomNav(
    {required Function(int) onChange, required curIndex}) {
  return BottomNavigationBar(
      onTap: (value) {
        onChange(value);
      },
      backgroundColor: Constants.primaryColor,
      selectedItemColor: Constants.secondaryGold,
      unselectedItemColor: Colors.white,
      currentIndex: curIndex,
      items: [
        BottomNavigationBarItem(
            backgroundColor: Constants.primaryColor,
            icon: Icon(Icons.home),
            label: "Home"),
        BottomNavigationBarItem(
            backgroundColor: Constants.primaryColor,
            icon: Icon(Icons.bookmark_border),
            label: ""),
        BottomNavigationBarItem(
            backgroundColor: Constants.primaryColor,
            icon: Icon(Icons.note_alt_outlined),
            label: ""),
        BottomNavigationBarItem(
            backgroundColor: Constants.primaryColor,
            icon: Icon(Icons.admin_panel_settings),
            label: "admin panel setting"),
      ]);
}
