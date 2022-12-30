import 'package:flutter/material.dart';
  
   const bool kDedebug = true;


//FONT BOLD
const dynamic kFontWeight_M =  FontWeight.w500;
const dynamic kFontWeight_SB =  FontWeight.w700;
const dynamic kFontWeight_B =  FontWeight.w900;


//FONT SIZES
const double kFontSize_16 = 16;
const double kFontSize_14 = 14;

//FONT FAMILY
const String kFontFamily = "Poppins";

// COLOUR
const kPrimaryColor = Color(0xffFFFFFF);
const kAccentColor = Color(0xffFD425B);
const kBackgroundColor = Color(0xffFFFFFF);
const kButtonColorR = Color(0xffF41937); 
const kGreenprogressColor = Color(0xff099B29);
const kGreenColor = Color(0xff179F0B);
const kGreyColor = Color(0xffD9D9D9);
const kGreyColorTxt = Color(0xff95969D);
const kSearchfieldColor = Color(0xffF2F2F3);



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
