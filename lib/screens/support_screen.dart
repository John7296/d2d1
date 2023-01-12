import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_d2d/base/base_stateful_state.dart';
import 'package:project_d2d/connection/network_manager.dart';
import 'package:project_d2d/model/base_response.dart';
import 'package:project_d2d/model/settings.dart';
import 'package:project_d2d/model/staff_profile.dart';

class SupportScreen extends StatefulWidget {
  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends BaseStatefulState<SupportScreen> {
  List<Settings> support = [];

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _titleController = TextEditingController();
  final _messageController = TextEditingController();

  List<StaffProfile> profile =[];

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {
     
    });
  }



  // void staffProfile() {
  //   showLoader();
  //   NetworkManager.shared
  //       .staffProfile(NetworkManager.shared.userToken ?? '',
  //           "getStaffProfilebyid", NetworkManager.shared.staffId ?? 0)
  //       .then((BaseResponse<List<StaffProfile>> response) {
  //     hideLoader();
     
  //     print(response.data?.first.staffName);
  //     print("...................");
  //     setState(() {
  //       profile.clear();
  //       profile.addAll(response.data!);

  //     });

  //     _emailController.text= profile.first.email.toString();
  //     _phoneController.text = profile.first.phoneHome.toString();
      
  //   }).catchError((e) {
  //     hideLoader();
  //     //showFlashMsg(e.toString());
  //     print(e);
  //     showFlashMsg(e.Message!);
  //   });
  // }

  void onSendButtonTapped() {

    if (!_form.currentState!.validate()) {
      return;
    }

  Map<String, dynamic> map = {

      "sp": "insSupportRequest",
      "userId": NetworkManager.shared.userId,
     'emailId' : _emailController.text,
     'phoneNo' : _phoneController.text,
     'title' : _titleController.text,
      'messageBody' :_messageController.text,
  };
    NetworkManager.shared.supportRequest(NetworkManager.shared.userToken??'', map).then((BaseResponse response) {
  
       _emailController.text = "";
      _phoneController.text  = "";
      _titleController.text = "";
      _messageController.text = "";

   

      showFlashMsg("Message Send Successfully");
      
    }).catchError((e) {

      //showFlashMsg(e.toString());
      print(e);
      showFlashMsg(e.Message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Connect To Us"),
        titleTextStyle: TextStyle(
            fontSize: 18,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w700,
            color: Colors.black),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _form,
            child: Column(
              children: [
              Padding(
                padding: const EdgeInsets.only(top:40),
                child:
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                                  "Email ID*",
                                  style: TextStyle(
                                      color: Color(0xff747474),fontWeight: FontWeight.w500, fontSize: 14),
                                ),
                ),),
                  
                 Padding(
                   padding: const EdgeInsets.only(top:10),
                   child: Container(
                    // height: 40,
                    child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffb0b0b0)),
                          ),
                          // 
                        ),
                        controller: _emailController,
                        validator: (val) {
                          if (val!.isEmpty) return "Enter your Email";
                          if (val != _emailController.text) {
                            return "Enter a valid Email";
                          }
                        }),
                ),
                 ),
              
                  
               Padding(
                 padding: const EdgeInsets.only(top:20),
                 child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                                    "Phone*",
                                    style: TextStyle(
                                        color: Color(0xff747474),fontWeight: FontWeight.w500, fontSize: 14),
                                  ),
                  ),
               ),
                  
              Padding(
                padding: const EdgeInsets.only(top:10),
                child: Container(
                  // height: 40,
                  child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffb0b0b0)),
                        ),
                     
                      ),
                      controller: _phoneController,
                      validator: (val) {
                        if (val!.isEmpty) return "Enter your Phone Number";
                        if (val != _phoneController.text) {
                          return "Enter a valid Phone Number";
                        }
                      }),
                ),
              ),
                  
              Padding(
                 padding: const EdgeInsets.only(top:20),
                 child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                                    "Title*",
                                    style: TextStyle(
                                        color: Color(0xff747474),fontWeight: FontWeight.w500, fontSize: 14),
                                  ),
                  ),
               ),
                  
              
              Padding(
                padding: const EdgeInsets.only(top:10),
                child: Container(
                  // height: 40,
                  child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffb0b0b0)),
                        ),
                       
                      ),
                      controller: _titleController,
                      validator: (val) {
                        if (val!.isEmpty) return "Enter Title";
                        
                      }),
                ),
              ),
                  
              Padding(
                 padding: const EdgeInsets.only(top:20),
                 child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                                    "Message*",
                                    style: TextStyle(
                                        color: Color(0xff747474),fontWeight: FontWeight.w500, fontSize: 14),
                                  ),
                  ),
               ),
                  
                  
              Padding(
                padding: const EdgeInsets.only(top:10),
                child: Container(
                  // height: 40,
                  child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffb0b0b0)),
                        ),
                       
                      ),
                      controller: _messageController,
                      validator: (val) {
                        if (val!.isEmpty) return "Enter Message";
                        
                      },
                      maxLines: 5,
                      ),
                ),
              ),
          
          
              Align(
            alignment: Alignment.bottomCenter,
             child: Padding(
               padding: const EdgeInsets.only(top: 80, bottom: 8),
               child: Container(
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffFD425B),
                        ),
                        onPressed: () {
          
                         onSendButtonTapped();
                         
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //     builder: (context) =>
                          //     ForgotPasswordScreen()));
          
                
                        },
                        child: Center(
                            child: Text(
                          "Send Message",
                          style: TextStyle(fontSize: 20,color: Colors.white),
                        )),
                      ),
                    ),
             ),
                   ),
            ]),
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
