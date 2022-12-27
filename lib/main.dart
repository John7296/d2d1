import 'package:flutter/material.dart';
import 'package:project_d2d/screens/home_detail_screen.dart';
import 'package:project_d2d/screens/home_screen.dart';
import 'package:project_d2d/screens/login_screen.dart';
import 'package:project_d2d/utils/constants.dart';

void main() {
  runApp(MaterialApp(
    theme:
        ThemeData(primarySwatch: kAccentMaterialColor, fontFamily: kFontFamily),
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ),);
}
