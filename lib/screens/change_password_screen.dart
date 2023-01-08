import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_d2d/base/base_stateful_state.dart';
import 'package:project_d2d/connection/network_manager.dart';
import 'package:project_d2d/model/base_response.dart';
import 'package:project_d2d/screens/password_confirmation_screen.dart';
import 'package:project_d2d/screens/settings_screen.dart';

class ChangePasswordScreen extends StatefulWidget{
  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends BaseStatefulState<ChangePasswordScreen> {

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  final _passwordController = TextEditingController();
   final _newpasswordController = TextEditingController();
  final _confirmpwdController = TextEditingController();

  bool _obscureText= true;
  bool  _obscureText1= true;
   bool  _obscureText2= true;

   void changePassword() {

      if (!_form.currentState!.validate()) {
      return;
    }

    showLoader();
    NetworkManager.shared.resetPassword(NetworkManager.shared.userToken??'', <String, dynamic>{

    // "token": NetworkManager.shared.userToken,
    "sp":"changePassword",
    "userId":NetworkManager.shared.userId,
     "currentPassword":_passwordController.text,
    "newPassword":_newpasswordController.text

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
                            builder: (context) => SettingsScreen()));
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
              child: Text("Change Password",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w700)),
            ),
          ),
        
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 120, right: 20),
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
                        labelText: "   Current Password",
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
                              return "Please enter current password";
                            }
                            return null;
                          }
                        
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top:20),
                          child: TextFormField(
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
                            controller: _newpasswordController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please enter new password";
                              }

                              if(val ==_passwordController.text){
                                return "Password should not be the same as current password";
                              }

                               if (val.length < 8) {
                            return 'Must 8 character';
                              }
                              return null;
                            }
                          
                          ),
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
                      labelText: "   Confirm Password",
                      labelStyle: TextStyle(color: Color(0xffAFB0B6), fontSize: 15),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: IconButton(
                         onPressed: () {
                              setState(() {
                              _obscureText2=!_obscureText2;
                            });
                            },
                            icon: Icon(
                                  _obscureText2?
                                  Icons.visibility
                              : Icons.visibility_off,
                            color: Color(0xffCACBCE),
                          ),
                        ),
                      )),
                      
                      obscureText:_obscureText2,
                        controller: _confirmpwdController,
                        validator: (val) {
                         if (val!.isEmpty) {
                        return "Re-type password";
                      }
                      if (val != _newpasswordController.text) {
                        return "Password should be same";
                      }
                      // if (val.length < 6) {
                      //   return 'Must be more than 6 character';
                      // }
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
                   changePassword();
                  
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => PasswordConfirmationScreen()));
                },
                child: Center(
                    child: Text(
                  "Change Password",
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