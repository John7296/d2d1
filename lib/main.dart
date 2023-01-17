// @dart=2.9

import 'package:flutter/material.dart';
import 'package:project_d2d/connection/network_manager.dart';
import 'package:project_d2d/screens/splash_screen.dart';
import 'package:project_d2d/utils/constants.dart';


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
