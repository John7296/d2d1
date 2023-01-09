import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_d2d/screens/onboarding_screens.dart';

class Onboarding extends StatefulWidget{
  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          
              Container(
         decoration: BoxDecoration(
              image: DecorationImage(
         image: AssetImage("assets/images/backgroundonboard.png"),
                  fit: BoxFit.cover,
        ),
        ),
                ),
           
      
            Padding(
              padding: const EdgeInsets.only(top:200),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 140,
                  width: 305,
                   decoration: BoxDecoration(
                        image: DecorationImage(
                       image: AssetImage("assets/images/logo.png"),
                  fit: BoxFit.fill,
                      ),
                      ),
                ),
              ),
            ),
      
            InkWell(
              onTap: (){
               Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) {
        return OnboardingScreens();
      },),(route) => false);
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom:130),
                child: Container(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                       backgroundColor: Color(0xffFD425B),
                      radius: 30,
                      child: CircleAvatar(
                        backgroundColor: Color(0xffFD425B),
                        child: Icon(
                        Icons.arrow_forward, color: Colors.white,
                        ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
      
            Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text("Let's Go", style: TextStyle(fontSize: 26,color: Colors.white, fontWeight: FontWeight.w700),)),
            )
        
      
            
            
        ]
      ),

       


    );
   
  }
}