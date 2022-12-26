import 'package:cupertino_tabbar/cupertino_tabbar.dart' as CupertinoTabBar;
import 'package:project_d2d/screens/verify_otp_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  int cupertinoTabBarIIValue = 1;
  int cupertinoTabBarIIValueGetter() => cupertinoTabBarIIValue;

  int index = 0;

  static Widget textField(String text) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.
            //only(left:10, top:5, bottom:5),
            symmetric(vertical: 20, horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xffb0b0b0)),
        ),
        labelText: "   $text",
        labelStyle: TextStyle(color: Color(0xffAFB0B6), fontFamily: "Poppins"),
      ),
    );
  }

  List text = [textField("Email"), textField("Mobile Number")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_new)),
              ],
            ),
          ),
          Container(
            height: 80,
            width: 210,
            child: Image(
              image: AssetImage("assets/images/logo-d2d.png"),
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Text("Forgot Password",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 27,
                      fontWeight: FontWeight.w700)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
            child: Center(
              child: Text("Enter your email or phone number, we will ",
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
              child: Text("send you a verification code ",
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffAFB0B6),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
            
          ),
          Container(
            height: 50,
            width: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xfff9d7de)
            ),
            child: CupertinoSegmentedControl(
              unselectedColor: Color(0xfff9d7de),
              selectedColor: Color(0xfff9d7de),
              borderColor: Color(0xfff9d7de),
                children: {
                  0: Container(
                  margin: EdgeInsets.only(top:5, bottom:5, right:10),
                   height: 40,
                   width: 130,
                  decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                    child: Center(child: Text("E-mail", style: TextStyle(color: Colors.black),))),

                    
                  1: Container(
                      height: 40,
                      width: 130,
                     decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                     ),
                       child: Center(child: Text("Mobile Number", style: TextStyle(color: Colors.black),))),
                },
                groupValue: index,
                onValueChanged: (value) {
                  setState(() {
                    this.index = value;
                  });
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 60, right: 20),
            child: text[index],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 70),
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
                          builder: (context) => VerifyOtpScreen()));
                },
                child: Center(
                    child: Text(
                  "Send OTP",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                )),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
