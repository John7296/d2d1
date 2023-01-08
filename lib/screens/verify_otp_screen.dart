import 'package:project_d2d/base/base_stateful_state.dart';
import 'package:project_d2d/connection/network_manager.dart';
import 'package:project_d2d/model/base_response.dart';
import 'package:project_d2d/model/forgot_password.dart';
import 'package:project_d2d/model/otp.dart';
import 'package:project_d2d/screens/login_screen.dart';
import 'package:project_d2d/screens/reset_password_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatefulWidget {

 int id;
 VerifyOtpScreen(this.id);
  
  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends BaseStatefulState<VerifyOtpScreen> {


  
    final _otpController = TextEditingController();
     bool emailSent = false;

     List<Otp> otp =[];

   void verifyOTP() {

    showLoader();

     print(NetworkManager.shared.userId);
     print("..................");
    NetworkManager.shared.verifyOTP(<String, dynamic>{

   "sp":"verifyOTP",
    "userId":widget.id,
    "OTP":_otpController.text

    }).then((BaseResponse<List<Otp>> response) {

       showFlashMsg("OTP has verified successfully");

        hideLoader();
      // print(_emailController.text);
      setState(() {
        emailSent = true;
         otp.clear();
        otp.addAll(response.data!);
      });
       Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                      builder: (context) =>
                      ResetPasswordScreen(widget.id, otp.first.token.toString())));
     
    }).catchError((e) {
       hideLoader();
      showFlashMsg(e.toString());
      print(e);
      showFlashMsg("Invalid OTP");
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
              padding: const EdgeInsets.only(top: 70),
              child: Text("Verify OTP",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w700)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:20),
            child: Center(
              child: Text("Enter your verification code from your email ",
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xffAFB0B6),
                  )),
            ),
          ),
          Center(
            child: Text("or phone number that we've sent",
                maxLines: 1,
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xffAFB0B6),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100, left: 29, right: 29),
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
                inactiveColor: Color(0xffAFB0B6),
                fieldHeight: 60,
                fieldWidth: 45,
                activeFillColor: Colors.white,
              ),
              controller: _otpController,
                    validator: (val) {
                      if (!emailSent) return null;
                      if (val!.isEmpty) {
                        return "Enter the OTP";
                      }
                      return null;
                    }
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

                  verifyOTP();
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => ResetPasswordScreen()));
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
