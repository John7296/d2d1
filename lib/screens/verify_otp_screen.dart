import 'package:project_d2d/screens/reset_password_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatefulWidget{
  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
      
                          Navigator.pop(context);
                      }, icon: Icon(Icons.arrow_back_ios_new)),
                ],
              ),
            ),
            Container(
             height: 80,
              width: 210,
              
              child:
               Image(image: AssetImage("assets/images/logo-d2d.png"),
               fit: BoxFit.fill,),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Text("Verify OTP",
                    style: TextStyle(
                        color: Colors.black,
                       
                        fontSize: 27,
                        fontWeight: FontWeight.w700)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
              child: Center(
                child: Text("Enter your verification code from your email ",
                    maxLines: 1,
                    style: TextStyle(
                    
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffAFB0B6),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Center(
                child: Text("or phone number that we've sent",
                    maxLines: 1,
                    style: TextStyle(
                  
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffAFB0B6),
                    )),
              ),
            ),
      
             Padding(
               padding: const EdgeInsets.only(top:100, left:29, right:29),
               child: PinCodeTextField(
                        appContext: context,
                        pastedTextStyle: TextStyle(
                          color: Color(0xff474747),
                          fontWeight: FontWeight.bold,
                        ),
                        onChanged: (value) {},
                        length: 6,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(10),
                          selectedColor: Color(0xffAFB0B6),
                          activeColor: Color(0xffFD425B),
                          inactiveColor: Color(0xffFD425B),
                          fieldHeight: 60,
                           fieldWidth: 45,
                          activeFillColor: Colors.white,
                        ),
                     ),
             ),
      
              Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 100),
              child: Container(
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffFD425B),
                  ),
                  onPressed: () {
                      
                             Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ResetPasswordScreen()));
      
                  },
                  child: Center(
                      child: Text(
                    "Verify",
                    style: TextStyle(
                        fontSize: 20,
                   
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  )),
                ),
              ),
            ),
          
        ],),
      )
    );
  }
}