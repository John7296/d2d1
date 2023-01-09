import 'package:flutter/material.dart';
import 'package:project_d2d/base/base_stateful_state.dart';
import 'package:project_d2d/connection/network_manager.dart';
import 'package:project_d2d/model/base_response.dart';
import 'package:project_d2d/screens/home_screen.dart';
import 'package:project_d2d/screens/login_screen.dart';
import 'package:project_d2d/utils/sessions_manager.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends BaseStatefulState<RegisterScreen> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

  bool _obscureText = true;
    bool _obscureText1 = true;


  void onRegisterButtonTapped() {
    if (!_form.currentState!.validate()) {
      return;
    }

    Map<String, dynamic> map = {
      "sp": "insertusers",
      "Fullname": _usernameController.text,
      "Email": _emailController.text,
      "PhoneNo": _phoneController.text,
      "Password": _passwordController.text,
      "roleId": 8,
      "Status": 1
    };

    print(_usernameController);
    showLoader();
    NetworkManager.shared.newRegister(map).then((BaseResponse response) {
      hideLoader();
      showFlashMsg('Successfully Registered');
      // SessionsManager.saveUserId(response.data?. ?? 0);

      print(response.data);
      print("////////////////////////////");
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (BuildContext context) {
          return LoginScreen();
        },
      ), (route) => false);
    }).catchError((e) {
      hideLoader();
      showFlashMsg(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Poppins"),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.only(top: 50),
              //   child: Row(
              //     children: [
              //       IconButton(
              //           onPressed: () {
              //             Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                     builder: (context) => LoginScreen()));
              //           },
              //           icon: Icon(Icons.arrow_back_ios_new)),
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Container(
                  height: 70,
                  width: 180,
                  child: Image(
                    image: AssetImage("assets/images/logo.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Row(
                  children: [
                    Text(
                      "Registration  👍🏻",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Row(
                  children: [
                    Text(
                      "Let's Register. More features ahead!",
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
                          const EdgeInsets.only(left: 20, top: 40, right: 20),
                      child: TextFormField(
                          controller: _usernameController,
                          validator: (val) {
                            if (val!.isEmpty)
                              return "Enter your full name";
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
                            labelText: "  Full Name",
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
                          controller: _emailController,
                          validator: (val) {
                            if (val!.isEmpty)
                              return "Enter your E-mail ";
                              if(!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(val)){
                                return "Invalid Email";
                              }
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
                            labelText: "  E-mail",
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
                          controller: _phoneController,
                          validator: (val) {
                            if (val!.isEmpty)
                              return "Enter your Phone Number";
                              if(!RegExp( r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$').hasMatch(val)){
                                return "Enter valid Number";
                              }
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
                            labelText: "  Phone Number",
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
                              padding: const EdgeInsets.only(right: 20),
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
                             if (val.length < 8) {
                        return 'Must be 8 character';
                      }
                            return null;
                          }),
                    ),
                    Padding(
              padding: const EdgeInsets.only( left:20, right:20,top: 20),
              child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.
                          //only(left:10, top:5, bottom:5),
                          symmetric(vertical: 20, horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color(0xffb0b0b0)),
                      ),
                      labelText: "   Confirm New Password",
                      labelStyle: TextStyle(color: Color(0xffAFB0B6), fontSize: 15),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: IconButton(
                         onPressed: () {
                              setState(() {
                              _obscureText1=!_obscureText1;
                            });
                            },
                            icon: Icon(
                                  _obscureText1?
                                  Icons.visibility
                              : Icons.visibility_off,
                            color: Color(0xffCACBCE),
                          ),
                        ),
                      )),
                      
                      obscureText:_obscureText1,
                        controller: _confirmpasswordController,
                        validator: (val) {
                         if (val!.isEmpty) {
                        return "Re-type password";
                      }
                      if (val != _passwordController.text) {
                        return "Password should be same";
                      }
                      // if (val.length < 8) {
                      //   return 'Must be more than 8 character';
                      // }
                      return null;
                        }
                      ),
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
                            onRegisterButtonTapped();
                            // Navigator.pushAndRemoveUntil(context,
                            //     MaterialPageRoute(
                            //   builder: (BuildContext context) {
                            //     return LoginScreen();
                            //   },
                            // ), (route) => false);
                          },
                          child: Center(
                              child: Text(
                            "Register",
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
                      padding: const EdgeInsets.only(top: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Have an account?",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffAFB0B6)),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return LoginScreen();
                                  },
                                ), (route) => false);
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffFD425B)),
                              ))
                        ],
                      ),
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool isAuthenticationRequired() {
    // TODO: implement isAuthenticationRequired
    throw UnimplementedError();
  }
}
