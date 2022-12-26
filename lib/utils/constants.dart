import 'package:flutter/material.dart';

//FONT FAMILY
const String kFontFamily = "Poppins";

// COLOUR
const kPrimaryColor = Color(0xFFFFFFFF);
const kAccentColor = Color(0xffFD425B);
const kBackgroundColor = Color(0xFFFFFFFF);
const kGreenprogressColor = Color(0xff099B29);
const kGreenColor = Color(0xff179F0B);
const kgreyColor = Color(0xffD9D9D9);

Map<int, Color> accentColor = {
  50: Color.fromRGBO(253, 66, 91, .1),
  100: Color.fromRGBO(253, 66, 91, .2),
  200: Color.fromRGBO(253, 66, 91, .3),
  300: Color.fromRGBO(253, 66, 91, .4),
  400: Color.fromRGBO(253, 66, 91, .5),
  500: Color.fromRGBO(253, 66, 91, .6),
  600: Color.fromRGBO(253, 66, 91, .7),
  700: Color.fromRGBO(253, 66, 91, .8),
  800: Color.fromRGBO(253, 66, 91, .9),
  900: Color.fromRGBO(253, 66, 91, 1),
};

MaterialColor kAccentMaterialColor = MaterialColor(0xffFD425B, accentColor);


