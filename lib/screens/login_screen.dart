import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:project_d2d/connection/network_manager.dart';
import 'package:project_d2d/connection/network_connection.dart';
import 'package:project_d2d/model/base_response.dart';
import 'package:project_d2d/model/user.dart';
import 'package:project_d2d/screens/forgot_password_screen.dart';
import 'package:project_d2d/screens/home_screen.dart';
import 'package:project_d2d/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscureText = true;

  var parser = EmojiParser();

  @override
  void initState() {
    super.initState();
    // onLoginButtonTapped();
  }

  void onLoginButtonTapped() {
    // if (!_form.currentState?.validate()) {
    //   return;
    // }

    // String username = _usernameController.text;
    // String password = _passwordController.text;
    // print(username);
    // print(password);

    NetworkManager.shared.userLogin(<String, dynamic>{
      "sp": "getAuthenticationApp",
      "logname": "hari@gmail.com",
      "passwd": "qwerty"
    }).then((BaseResponse<User> response) {
      print("/////////////////////");
    }).catchError((e) {
      // print(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Poppins"),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        //  Navigator.pop(context);
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
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Row(
                children: [
                  Text(
                    "Welcome Back 👋",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                  ),

                  // Container(
                  //     height: 40,
                  //     width: 50,
                  //     child: Image(
                  //       image: AssetImage("assets/images/handwave.jpg"),
                  //       fit: BoxFit.fill,
                  //     ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Row(
                children: [
                  Text(
                    "Let's Log in.",
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
                    padding:
                        const EdgeInsets.only(left: 20, top: 50, right: 20),
                    child: TextFormField(
                        controller: _usernameController,
                        validator: (val) {
                          if (val!.isEmpty)
                            return "Enter E-mail or Phone Number";
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.
                              //only(left:10, top:5, bottom:5),
                              symmetric(vertical: 20, horizontal: 10),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffAFB0B6),
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          labelText: "   E-mail / Phone Number",
                          labelStyle: TextStyle(
                              color: Color(0xffAFB0B6),
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        )),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 20, right: 20),
                    child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.
                              //only(left:10, top:5, bottom:5),
                              symmetric(vertical: 20, horizontal: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Color(0xffAFB0B6)),
                          ),
                          labelText: "  Password",
                          labelStyle: TextStyle(
                              color: Color(0xffAFB0B6),
                              fontWeight: FontWeight.w500,
                              fontSize: 15),

                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Color(0xffCACBCE),
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                          // suffixIcon: Padding(
                          //   padding: const EdgeInsets.only(right: 20),
                          //   child: Icon(
                          //     Icons.visibility,
                          //     color: Color(0xffCACBCE),
                          //   ),
                          // )
                        ),
                        obscureText: _obscureText,
                        controller: _passwordController,
                        validator: (val) {
                          if (val!.isEmpty) return "Enter your password";
                          return null;
                        }),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: Container(
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffFD425B),
                        ),
                        onPressed: () {
                          // onLoginButtonTapped();
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(
                            builder: (BuildContext context) {
                              return HomeScreen();
                            },
                          ), (route) => false);
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
                    padding: const EdgeInsets.only(top: 30),
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
      ),
    );
  }
}
