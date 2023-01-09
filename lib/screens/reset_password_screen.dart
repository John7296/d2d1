import 'package:project_d2d/base/base_stateful_state.dart';
import 'package:project_d2d/connection/network_manager.dart';
import 'package:project_d2d/model/base_response.dart';
import 'package:project_d2d/screens/login_screen.dart';
import 'package:project_d2d/screens/password_confirmation_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  
  int id;
  String? token;
  ResetPasswordScreen(this.id, this.token);
  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends BaseStatefulState<ResetPasswordScreen> {

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  final _passwordController = TextEditingController();
  final _confirmpwdController = TextEditingController();

  bool _obscureText= true;
  bool  _obscureText1= true;


   void resetPassword() {

      if (!_form.currentState!.validate()) {
      return;
    }

    showLoader();
    NetworkManager.shared.resetPassword(widget.token.toString(), <String, dynamic>{

    // "token": NetworkManager.shared.userToken,
    "sp":"resetPassword",
    "userId":widget.id,
    "password":_passwordController.text

    }).then((BaseResponse response) {

       hideLoader();
        showFlashMsg("Password changed successfully");
      // print(_emailController.text);
      // setState(() {
      //   emailSent = true;
      // });
       Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                      builder: (context) =>
                      PasswordConfirmationScreen()));
     
    }).catchError((e) {
       hideLoader();
      showFlashMsg(e.toString());
      print(e);
      showFlashMsg(e.Message!);
    });
  }

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
                     Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                    },
                    icon: Icon(Icons.arrow_back_ios_new)),
              ],
            ),
          ),
          Container(
           height: 70,
          width: 180,
            child: Image(
              image: AssetImage("assets/images/logo.png"),
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 180),
              child: Text("Reset Password",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w700)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
              child: Text("Enter your new password and confirm the",
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xffAFB0B6),
                  )),
            ),
          ),
          Center(
            child: Text("new password to reset password",
                maxLines: 1,
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xffAFB0B6),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 60, right: 20),
            child: Form(
              key: _form,
              child: Column(
                children: [
                   TextFormField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.
                            //only(left:10, top:5, bottom:5),
                            symmetric(vertical: 20, horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Color(0xffb0b0b0)),
                        ),
                        labelText: "   New Password",
                        labelStyle: TextStyle(color: Color(0xffAFB0B6), fontSize: 15),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                              _obscureText=!_obscureText;
                            });
                            },
                            icon: Icon(
                                  _obscureText?
                                  Icons.visibility
                              : Icons.visibility_off,
                            color: Color(0xffCACBCE),
                          ),
                        
                          ),
                        )),
                        obscureText:_obscureText,
                          controller: _passwordController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please enter new password";
                            }
                            return null;
                          }
                        
                        ),
                
                      Padding(
              padding: const EdgeInsets.only( top: 20),
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
                        controller: _confirmpwdController,
                        validator: (val) {
                         if (val!.isEmpty) {
                        return "Re-type password";
                      }
                      if (val != _passwordController.text) {
                        return "Password should be same";
                      }
                      if (val.length < 8) {
                        return 'Must be more than 8 character';
                      }
                      return null;
                        }
                      ),
                      ),
                ]
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
            child: Container(
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffFD425B),
                ),
                onPressed: () {
        
                  resetPassword();
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => PasswordConfirmationScreen()));
                },
                child: Center(
                    child: Text(
                  "Reset Password",
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
  
  @override
  bool isAuthenticationRequired() {
    // TODO: implement isAuthenticationRequired
    throw UnimplementedError();
  }
}
