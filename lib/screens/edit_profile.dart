import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_d2d/base/base_stateful_state.dart';
import 'package:project_d2d/connection/network_manager.dart';
import 'package:project_d2d/model/base_response.dart';
import 'package:project_d2d/model/staff_profile.dart';

class EditProfile extends StatefulWidget{
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends BaseStatefulState<EditProfile> {

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  final _staffNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _addressController = TextEditingController();

  List<StaffProfile>? staffProfile;

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(microseconds: 10), () {
      getProfile();
    });
  }


   void getProfile() {
    showLoader();

    NetworkManager.shared.staffProfile(
    NetworkManager.shared.userToken??'', "getStaffProfilebyid", NetworkManager.shared.staffId??0

    ).then((BaseResponse<List<StaffProfile>> response) {
      hideLoader();
      setState(() {
        staffProfile = response.data;
        _staffNameController.text = staffProfile?.first.staffName?? '';
      _emailController.text = staffProfile?.first.email??'';
      _mobileController.text = staffProfile?.first.phoneHome??'';
      _addressController.text= staffProfile?.first.address??'';
      });
    }).catchError((e) {
      hideLoader();
      showFlashMsg(e.toString());
      print(e.toString());
    });
  }

  void onUpdateButtonTapped() {
    // showLoader();
    NetworkManager.shared.updateProfile(NetworkManager.shared.userToken??'', <String, dynamic>{

  "sp":"updUserProfile",
    "userId":NetworkManager.shared.userId,
    "Fullname":_staffNameController.text,
    "Email":_emailController.text,
    "PhoneNo":_mobileController.text

    }).then((BaseResponse response) {
      // hideLoader();
      showFlashMsg("Profile Updated");
     
      getProfile();
    }).catchError((e) {
      // hideLoader();
      showFlashMsg(e.toString());
      print(e.toString());
    });
  }



  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            
            children: [
        
              Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios_new)),
                  Spacer(),
                  TextButton(
                      onPressed: () {
                             Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfile()));
        
                      },
                      child: Text("Edit",
                          style:
                              TextStyle(color: Color(0xffAFB0B6), fontSize: 15)))
                ],
              ),
            ),
              SingleChildScrollView(
                child: Form(
                  key: _form,
                  child: Padding(
                    padding: const EdgeInsets.only(top:100),
                    child: Column(
                      children: [
                        // SizedBox(height: 30),
                        Container(
                          height: 100,
                          width: 170,
                          child: Image(
                            image: AssetImage("assets/images/logo.png"),
                            fit: BoxFit.fill,
                          ),
                          
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              SizedBox(height: 80),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Text(
                                      'Staff Name*',
                                      style: TextStyle(
                                          color: Color(0xffAFB0B6),
                                         ),
                                    ),
                                  )),
                              Container(
                                height: 60,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.all(5)
                                      // labelText: 'Mobile'
                                      ),
                                  controller: _staffNameController,
                                  validator: (value) {
                                    if (value!.isEmpty) return "Enter UserNmae";
                                    return null;
                                  },
                                ),
                              ),
                              //   SizedBox(height: 5),
                              //  Align(
                              //     alignment: Alignment.topLeft,
                              //     child: Padding(
                              //       padding: const EdgeInsets.only(bottom: 10),
                              //       child: Text(
                              //         'Address',
                              //         style: TextStyle(
                              //             color: Color(0xffAFB0B6),
                              //            ),
                              //       ),
                              //     )),
                              // Container(
                              //   height: 60,
                              //   child: TextFormField(
                              //     decoration: InputDecoration(
                              //         border: OutlineInputBorder(),
                              //         contentPadding: EdgeInsets.all(5)
                              //         // labelText: 'Mobile'
                              //         ),
                              //     controller: _addressController,
                              //     validator: (value) {
                              //       if (value!.isEmpty) return "Enter address";
                              //       return null;
                              //     },
                              //   ),
                              // ),
                              SizedBox(height: 5),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Text('Email ID',
                                        style: TextStyle(
                                            color: Color(0xffAFB0B6),
                                            )),
                                  )),
                              Container(
                                height: 60,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.all(5)
                                      // labelText: 'Mobile'
                                      ),
                                  controller: _emailController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter Email";
                                      } if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                                        return 'Enter valid Email';
                                      }
                                    },
                                ),
                              ),
                              SizedBox(height: 5),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Text('Mobile',
                                        style: TextStyle(
                                            color: Color(0xffAFB0B6),
                                            )),
                                  )),
                              Container(
                                height: 60,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.all(5)
                                      // labelText: 'Mobile'
                                      ),
                                  controller: _mobileController,
                                    validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter Mobile Number';
                                    }
                                    if (value.length < 8) {
                                      return 'Enter valid phone number';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(height: 100),
                              // if(_userNameController.text.isNotEmpty)
                              Container(
                                width: 400,
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffFD425B),
                    ),
                    onPressed: () {
          
                      onUpdateButtonTapped();
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => PasswordConfirmationScreen()));
                    },
                    child: Center(
                        child: Text(
                      "Update Profile",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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