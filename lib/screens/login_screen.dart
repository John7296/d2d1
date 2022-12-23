import 'package:project_d2d/screens/forgot_password_screen.dart';
import 'package:project_d2d/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   leading: IconButton(icon: Icon(Icons.arrow_back),
        //   onPressed: () {
        //   },
        //   ),
        //  ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new)),
              ],
            ),
          ),
          Container(
            height: 80,
            width: 210,
            
            child:
             Image(image: AssetImage("assets/images/logo-d2d.png"),
             fit: BoxFit.fill,
             ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Row(
              children: [
                Text(
                  "Welcome Back",
                  style: TextStyle(
                     
                      fontSize: 27,
                      fontWeight: FontWeight.w700),
                ),
               Container(
                height: 40,
                width:50,
                child: Image(image: AssetImage("assets/images/handwave.jpg"),
                fit: BoxFit.fill,)
               )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Row(
              children: [
                Text(
                  "Lets Log in",
                  style: TextStyle(
                     
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffAFB0B6)),
                ),
              ],
            ),
          ),
          Form(
            key: _form,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
                  child: TextFormField(
                      decoration: InputDecoration(
                    contentPadding: EdgeInsets.
                        //only(left:10, top:5, bottom:5),
                        symmetric(vertical: 20, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xffb0b0b0)),
                    ),
                    labelText: "   Email/Phone Number",
                    labelStyle: TextStyle(
                        color: Color(0xffAFB0B6), fontFamily: "Poppins"),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                  child: TextFormField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.
                              //only(left:10, top:5, bottom:5),
                              symmetric(vertical: 20, horizontal: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Color(0xffb0b0b0)),
                          ),
                          labelText: "   Password",
                          labelStyle: TextStyle(
                             color: Color(0xffAFB0B6)),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Icon(
                              Icons.visibility,
                              color: Color(0xffCACBCE),
                            ),
                          ))),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
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
                                  ProfileScreen()));
                      },
                      child: Center(
                          child: Text(
                        "Log in",
                        style: TextStyle(
                            fontSize: 20,
                     
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      )),
                    ),
                  ),
                ),
                Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top:30),
                      child: TextButton(
                          onPressed: () {
                           Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ForgotPasswordScreen()));

                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                               
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffFD425B)),
                          )),
                    ))
              ],
            ),
          )
        ]),
      ),
    );
  }
}
