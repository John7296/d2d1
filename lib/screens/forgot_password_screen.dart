
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

                    }, icon: Icon(Icons.arrow_back_ios_new)),
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
            child: Container(
              
              //  width: 170,
              //          height: 60,
             // constraints: const BoxConstraints.expand(height:20, width: 50)
              // ?expand(height: 60.0, width:170),
              ),
          ),
            Container(
                width: 350,
                       height: 70,
                       decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                       ),
              child: CupertinoTabBar.CupertinoTabBar(
                  Color(0xffF3B7BF),
                  Colors.white,
                  
              //  const Color(0xffE5D9D),
               // Color.fromARGB(255, 246, 206, 206),
                [
                  const Text(
                    "E-mail",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18.75,
                      fontWeight: FontWeight.w400,
                     
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    "Mobile Number",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18.75,
                      fontWeight: FontWeight.w400,
                     
                    ),
                    textAlign: TextAlign.center,
                  ),
                  // const Text(
                  //   "Option C",
                  //   style: const TextStyle(
                  //     color: Colors.white,
                  //     fontSize: 18.75,
                  //     fontWeight: FontWeight.w400,
                  //     fontFamily: "SFProRounded",
                  //   ),
                  //   textAlign: TextAlign.center,
                  // ),
                ],
           
                cupertinoTabBarIIValueGetter,
                (int index) {
                  setState(() {
                    cupertinoTabBarIIValue = index;
                  });
                },
                useSeparators: false,
                
              ),
            ),

          // Padding(
          //   padding: EdgeInsets.only(top: 70, left: 30, right: 30),
          //   child: Container(
          //     height: 70,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(25),
          //       border: Border.all(
          //         color: Color(0xffE5D9D9),
          //       ),
          //       color: Color.fromARGB(255, 248, 207, 212),
          //     ),
          //     child: 
              
          //     Row(children: [
          //       Padding(
          //         padding: const EdgeInsets.only(left: 10),
          //         child: Container(
          //           width: 170,
          //           height: 50,
          //           child: ElevatedButton(
          //             style: ButtonStyle(
          //                 backgroundColor:
          //                     MaterialStateProperty.all<Color>(Colors.white),
          //                 shape:
          //                     MaterialStateProperty.all<RoundedRectangleBorder>(
          //                   RoundedRectangleBorder(
          //                     borderRadius: BorderRadius.circular(25),
          //                   ),
          //                 )),
          //             onPressed: () {},
          //             child: Center(
          //                 child: Text(
          //               "E-mail",
          //               style: TextStyle(
          //                   fontSize: 20,
          //                   fontFamily: 'Poppins',
          //                   fontWeight: FontWeight.w400,
          //                   color: Colors.black),
          //             )),
          //           ),
          //         ),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.only(left: 8),
          //         child: Container(
          //           width: 170,
          //           height: 50,
          //           child: ElevatedButton(
          //             style: ButtonStyle(
          //               backgroundColor:
          //                   MaterialStateProperty.all<Color>(Colors.white),
          //               shape:
          //                   MaterialStateProperty.all<RoundedRectangleBorder>(
          //                 RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(25),
          //                 ),
          //               ),
          //             ),
          //             onPressed: () {},
          //             child: Center(
          //                 child: Text(
          //               "Mobile Number",
          //               style: TextStyle(
          //                   fontSize: 20,
          //                   fontFamily: 'Poppins',
          //                   fontWeight: FontWeight.w400,
          //                   color: Colors.black),
          //             )),
          //           ),
          //         ),
          //       ),
          //     ]),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 60, right: 20),
            child: TextFormField(
             
                decoration: InputDecoration(
              contentPadding: EdgeInsets.
                  //only(left:10, top:5, bottom:5),
                  symmetric(vertical: 20, horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Color(0xffb0b0b0)),
              ),
              labelText: "   E-mail",
              labelStyle:
                  TextStyle(color: Color(0xffAFB0B6), fontFamily: "Poppins"),
            ),
            ),
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
                              builder: (context) =>
                                  VerifyOtpScreen()));

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
