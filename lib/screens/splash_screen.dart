

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_d2d/connection/network_manager.dart';
import 'package:project_d2d/screens/home_screen.dart';
import 'package:project_d2d/screens/login_screen.dart';
import 'package:project_d2d/screens/onboarding.dart';
import 'package:project_d2d/screens/onboarding_screens.dart';
import 'package:project_d2d/utils/sessions_manager.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';

class SplashScreen extends StatefulWidget{

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
     NetworkManager.shared.refreshTokens();
   
    Timer(
      Duration(seconds: 3),
      () => {
     //  _checkTokenAndNavigate(),
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Onboarding()))
      },
    );
    super.initState();
  }


   void _checkTokenAndNavigate() {
    

    SessionsManager.getUserToken().then((value) {
      
      print(value);

      if ((value ?? "").isNotEmpty) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
      else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Onboarding()));
      }
    });

  
  }
  @override
  
  Widget build(BuildContext context) {
     double screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: Color(0xffFD425B),
        body: SingleChildScrollView(
          child: Container(
           child: Column(
             children: [
               Stack(
                 children:[ 
                   Padding(
                    padding: const EdgeInsets.only(left:340, top:350),
                    child: Container(
                      height: 200,
                      width:10,
                       decoration: BoxDecoration(
                            color: Color.fromARGB(255, 243, 161, 178),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(5)
                            )
                          ),

                    ),
                  ),
                  
                  ClipPath(
                   clipper: 
                           //      ProsteBezierCurve(
                           //   position: ClipPosition.top,
                           //   list: [
                           //    BezierCurveSection(
                           //       start: Offset(0, screenWidth),
                           //       top: Offset(screenWidth / 2, 200),
                           //        end: Offset( screenWidth/2, 100),
                           //     ),
                           //   ],
                           // ),
                   
                   
                   ProsteThirdOrderBezierCurve(
                     position: ClipPosition.bottom,
                     list: [
                  ThirdOrderBezierCurveSection(
                   p1:Offset(0, 1300),
                  // p1: Offset(0, 100),
                  //   p2: Offset(0, 210),
                   p2: Offset(50, 300),
                    p3: Offset(MediaQuery.of(context).size.width, 550),
                    p4: Offset(MediaQuery.of(context).size.width, 350),
                  ),
                     ],
                     ),
                     child: Container(
                            height: 450,
                     decoration: BoxDecoration(
                           color: Color(0xffFD425B)
                          
                     ),
                     ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 200),
                    child: Center(
                      child: Container(
                        
                        height:450,
                        width:250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        ),
                      
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left:35, top:170),
                    child: Container(
                      height: 450,
                      width: 290,
                      child: Image(image: AssetImage("assets/images/logo.png"),
                      fit: BoxFit.contain,
                       ),
                      ),
                    
                  ),
                 ]
               ),
           
                
             ]
           ),
          ),
      ),
      ),
    );
  }
}