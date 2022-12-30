import 'package:flutter/material.dart';
import 'package:project_d2d/connection/network_manager.dart';
import 'package:project_d2d/screens/home_detail_screen.dart';
import 'package:project_d2d/screens/home_screen.dart';
import 'package:project_d2d/screens/login_screen.dart';
import 'package:project_d2d/screens/splash_screen.dart';
import 'package:project_d2d/utils/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(MaterialApp(
        theme: ThemeData(
            primarySwatch: kAccentMaterialColor, fontFamily: kFontFamily),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ), 
  );
  NetworkManager.shared.init();
}
