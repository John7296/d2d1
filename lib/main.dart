import 'package:flutter/material.dart';
import 'package:project_d2d/screens/home_detail_screen.dart';
import 'package:project_d2d/screens/home_screen.dart';
import 'package:project_d2d/screens/login_screen.dart';
import 'package:project_d2d/utils/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(ResponsiveSizer(
    builder: (context, orientation, screenType) {
      return MaterialApp(
        theme: ThemeData(
            primarySwatch: kAccentMaterialColor, fontFamily: kFontFamily),
        debugShowCheckedModeBanner: false,
        home: HomeDetailScreen(),
      );
    },
  ));
}
