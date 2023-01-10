import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:project_d2d/base/base_stateful_state.dart';
import 'package:project_d2d/connection/network_manager.dart';
import 'package:project_d2d/model/base_response.dart';
import 'package:project_d2d/model/payment.dart';
import 'package:project_d2d/model/staff_profile.dart';
import 'package:project_d2d/screens/edit_profile.dart';
import 'package:project_d2d/screens/settings_screen.dart';
import 'package:project_d2d/screens/support_screen.dart';
import 'package:project_d2d/utils/constants.dart';

class ProfileSummaryScreen extends StatefulWidget {
  // String? staffname;
  // String? catName;
  // double? earings;

  ProfileSummaryScreen();

  @override
  State<ProfileSummaryScreen> createState() => _ProfileSummaryScreenState();
}

class _ProfileSummaryScreenState
    extends BaseStatefulState<ProfileSummaryScreen> {
  List<StaffProfile> profile = [];
  List<Payment> payment = [];



  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
     staffProfile();
      paymentHistory();

      // _updateDeviceToken();
    });
  }

  void staffProfile() {
    showLoader();
    NetworkManager.shared
        .staffProfile(NetworkManager.shared.userToken ?? '',
            "getStaffProfilebyid", NetworkManager.shared.staffId ?? 0)
        .then((BaseResponse<List<StaffProfile>> response) {
      hideLoader();
      // var profile = response.data!;
      //   print(profile.first.staffName);
      //   print("...................");
      // print(_emailController.text);
      print(response.data?.first.staffName);
      print("...................");
      setState(() {
        profile.clear();
        profile.addAll(response.data!);

        //   emailSent = true;
      });
      paymentHistory();
      //  Navigator.pushReplacement(
      //                 context,
      //                 MaterialPageRoute(
      //                 builder: (context) =>
      //                 VerifyOtpScreen()));
    }).catchError((e) {
      hideLoader();
      //showFlashMsg(e.toString());
      print(e);
      showFlashMsg(e.Message!);
    });
  }

  void paymentHistory() {
    NetworkManager.shared
        .paymentHistory(NetworkManager.shared.userToken ?? '',
            "getPaymentHistory", NetworkManager.shared.userId ?? 0)
        .then((BaseResponse<List<Payment>> response) {
      //  hideLoader();
      setState(() {
        payment.clear();
        payment.addAll(response.data!);

        //   emailSent = true;
      });
    }).catchError((e) {
      hideLoader();
      //showFlashMsg(e.toString());
      showFlashMsg(e.message);
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
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
                  Spacer(),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfile()));
                      },
                      child: Text("Edit",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Color(0xffAFB0B6),
                              fontSize: 13)))
                ],
              ),
            ),
            CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xffF3B7BF),
              child: CircleAvatar(
                radius: 35,
                child: CachedNetworkImage(
                                    imageUrl:

                                    profile.isNotEmpty?
                                        "https://wpr.intertoons.net/d2dwebadmin/${profile.first.profilePhoto}": ""),
                // Image(
                //   image: AssetImage("assets/images/profile_img.png"),
                // ),
              ),
            ),

            Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                // widget.staffname.toString(),
                profile.isNotEmpty
                    ?
                    //    "Mary James",

                    profile[0].staffName ?? ''
                    : "",
                // "Mary James",
                // profile.first.staffName.toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
            )),

            Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                //widget.catName.toString(),
               profile.isNotEmpty ? profile[0].catName ?? '' : "",
                // "Theatre practitioner",
                //  profile.first.catName.toString(),
                style: TextStyle(color: Color(0xff95969D), fontSize: 14),
              ),
            )),

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(10),
                color: Color(0xff95969D),
                strokeWidth: 2, //thickness of dash/dots
                dashPattern: [3, 3],
                child: Container(
                  height: 80,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffA7F0B3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      children: [
                        Icon(Icons.currency_pound_outlined,
                            color: Color(0xff07701E), size: 30),
                        Text(
                         // widget.earings.toString(),
                          profile.isNotEmpty
                              ? profile[0].totalEarnings.toString()
                              : "",
                          // "\$ 3425.00",
                          //profile.first.totalEarnings.toString(),
                          style: TextStyle(
                              color: Color(0xff07701E),
                              fontSize: 25,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Row(
                children: [
                  Text("Payment History",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16))
                ],
              ),
            ),
            SizedBox(height: 20),
             
           
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 0),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    topLeft: Radius.circular(5)),
                                color: Colors.pink.shade100),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("Date", style: TextStyle(fontSize: 12)),
                                  SizedBox(width: 100),
                                  Expanded(
                                    child: Text("Mode of Payment",
                                        style: TextStyle(fontSize: 12)),
                                  ),
                                  Text("Status",
                                      style: TextStyle(fontSize: 12)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.grey.shade900,
                        ),
                      ],
                    ),
                    if(payment.isNotEmpty)
                    
                      ListView.separated(
                          shrinkWrap: true,
                          itemCount: payment.length,
                          itemBuilder: (BuildContext context, int index) {
                            return  Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                      //  color: Colors.pink.shade100,
                                        // height: 50,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: 
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                  payment.isNotEmpty
                                                      ? payment[index].createdOn.toString()
                                                      : "",
                                                  // payment[index].paidOn
                                                  //       ??
                                                  //  '',
                                                  style: TextStyle(fontSize: 12)),
                                              SizedBox(width: 60),
                                              Expanded(
                                                child: Text(
                                                    payment.isNotEmpty
                                                        ? payment[index]
                                                            .paymentMode
                                                            .toString()
                                                        : '',
                                                    // payment[index]
                                                    //        .paymentMode.toString(),

                                                    style: TextStyle(fontSize: 12)),
                                              ),
                                              Container(
                                                height: 25,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                  color: Color(0xffC8F8B8),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Center(
                                                    child: Text(
                                                  payment.isNotEmpty
                                                      ? payment[index]
                                                          .paymentStatus
                                                          .toString()
                                                      : "",
                                                  // "Credited",
                                                  // payment.first.paymentStatus.toString(),
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: Color(0xff666666)),
                                                )),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return
                             Divider(
                              height: 1,
                              color: Colors.grey,
                            );
                          }),

                         if(payment.isEmpty)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              
                               Container(child: Center(
                                 child: Text(
                                  "No Payment history Found",
                                 ),
                               ),)
                            ],),
                          )
                  ],
                ),
              ),
            ),

            // Padding(
            //     padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            //     child: Container(
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(5),
            //         border: Border.all(
            //           color: Color(0xffCECCDD),
            //         ),
            //       ),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Row(
            //             children: [
            //               Expanded(
            //                 child: Container(
            //                   height: 45,
            //                   decoration: BoxDecoration(
            //                     color: Color(0xffF3B7BF),
            //                     //  borderRadius: BorderRadius.only(
            //                     //   topLeft: Radius.circular(5),
            //                     //   topRight: Radius.circular(5)
            //                     //  )
            //                   ),
            //                   child: Padding(
            //                     padding: const EdgeInsets.all(8.0),
            //                     child: Row(
            //                       mainAxisAlignment:
            //                           MainAxisAlignment.spaceBetween,
            //                       children: [
            //                         Text(
            //                           "Date",
            //                           style: TextStyle(
            //                               color: Color(0xff4A4646), fontSize: 14),
            //                         ),
            //                         SizedBox(width: 10),
            //                         Expanded(
            //                           child: Text(
            //                             "Mode of Payment",
            //                             textAlign: TextAlign.center,
            //                             style: TextStyle(
            //                                 color: Color(0xff4A4646),
            //                                 fontSize: 14),
            //                           ),
            //                         ),
            //                         Text(
            //                           "Status",
            //                           style: TextStyle(
            //                               color: Color(0xff4A4646), fontSize: 14),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //               Divider(
            //                 height: 1,
            //                 color: Colors.grey.shade900,
            //               )
            //             ],
            //           ),

            //           ListView.separated(
            //             shrinkWrap: true,
            //               itemCount: payment.length,
            //               itemBuilder: (BuildContext context, int index) {
            //                 return Row(
            //                   children: [
            //                     Expanded(
            //                       child: Container(
            //                           height: 50,
            //                           color: Colors.yellow,
            //                           child: Padding(
            //                             padding: const EdgeInsets.all(8.0),
            //                             child: Row(
            //                               children: [
            //                                 Text(
            //                                   payment.first.paidOn.toString(),
            //                                   style: TextStyle(
            //                                       fontSize: 13,
            //                                       color: Color(0xff666666)),
            //                                 ),

            //                                 SizedBox(width: 50),

            //                                  Expanded(
            //                                    child: Text(
            //                                     payment.first.paymentMode.toString(),
            //                                     style: TextStyle(
            //                                         fontSize: 13,
            //                                         color: Color(0xff666666)),
            //                                                                          ),
            //                                  ),

            //                                    Container(
            //                               height: 25,
            //                               width: 80,
            //                               decoration: BoxDecoration(
            //                                 color: Color(0xffC8F8B8),
            //                                 borderRadius: BorderRadius.circular(10),
            //                               ),
            //                               child: Center(
            //                                   child: Text(
            //                                 // "Credited",
            //                                  payment.first.paymentStatus.toString(),
            //                                 style: TextStyle(
            //                                     fontSize: 13, color: Color(0xff666666)),
            //                               )),
            //                             ),
            //                               ],
            //                             ),
            //                           )),
            //                     ),
            //                   ],
            //                 );
            //               },
            //               separatorBuilder: (BuildContext context, int index) {
            //                 return Divider(
            //                   height: 1,
            //                   color: Colors.grey,
            //                 );
            //               }),

            // Container(
            //   height: 80,
            //   child: Expanded(
            //     child: ListView.builder(
            //       itemCount: payment.length,
            //       itemBuilder: (BuildContext context, int index){
            //              return Container(
            //     // height: 30,
            //          decoration: BoxDecoration(
            //         border: Border.all(
            //             color: Color(0xffCECCDD),
            //           ),
            //           color: Colors.grey
            //         ),
            //         child: Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.start,
            //             children: [
            //           Text(
            //                 // "25-Aug-2022",
            //                  payment.first.paidOn.toString(),
            //                 style: TextStyle(
            //                     fontSize: 13, color: Color(0xff666666)),
            //               ),

            //             Expanded(
            //               child: Text(
            //                 // "Bank Transfer",
            //                 payment.first.paymentMode.toString(),
            //              textAlign: TextAlign.center,

            //                       style: TextStyle(
            //                           color: Color(0xff4A4646),
            //                           fontSize: 13)),
            //             ),

            //                         Container(
            //                   height: 25,
            //                   width: 80,
            //                   decoration: BoxDecoration(
            //                     color: Color(0xffC8F8B8),
            //                     borderRadius: BorderRadius.circular(10),
            //                   ),
            //                   child: Center(
            //                       child: Text(
            //                     // "Credited",
            //                      payment.first.paymentStatus.toString(),
            //                     style: TextStyle(
            //                         fontSize: 13, color: Color(0xff666666)),
            //                   )),
            //                 ),

            //               ],),
            //             ),
            //           );
            //           }
            //         ),
            //   ),
            //     ),

            //  Container(
            //    decoration: BoxDecoration(
            //   border: Border.all(
            //       color: Color(0xffCECCDD),
            //     )
            //   ),
            //    child: Padding(
            //      padding: const EdgeInsets.all(8.0),
            //      child: Row(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            // Text(
            //           "28-Apr-2022",
            //           style: TextStyle(
            //               fontSize: 13, color: Color(0xff666666)),
            //         ),

            //       Expanded(
            //         child: Text("Bank Transfer",
            //           textAlign: TextAlign.center,
            //                 style: TextStyle(
            //                     color: Color(0xff4A4646),
            //                     fontSize: 13)),
            //       ),

            //                   Container(
            //             height: 25,
            //             width: 80,
            //             decoration: BoxDecoration(
            //               color: Color(0xffC8F8B8),
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //             child: Center(
            //                 child: Text(
            //               "Credited",
            //               style: TextStyle(
            //                   fontSize: 13, color: Color(0xff666666)),
            //             )),
            //           ),

            // ],),
            //    ),
            //  ),

            //     ],
            //   ),
            // )

            // ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 200, bottom: 20),
            //   child: Container(
            //     height: 50,
            //     width: 160,
            //     child: ElevatedButton(
            //       style: ElevatedButton.styleFrom(
            //         backgroundColor: Color(0xffFD425B),
            //       ),
            //       onPressed: () {
            //         Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //                 builder: (context) => SettingsScreen()));
            //       },
            //       child: Center(
            //           child: Text(
            //         "Contact Us",
            //         style: TextStyle(
            //             fontSize: 20,
            //             fontWeight: FontWeight.w500,
            //             color: Colors.white),
            //       )),
            //     ),
            //   ),
            // ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              height: 50,
              width: 160,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffFD425B),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SupportScreen()));
                },
                child: Center(
                    child: Text(
                  "Contact Us",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                )),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  @override
  bool isAuthenticationRequired() {
    // TODO: implement isAuthenticationRequired
    throw UnimplementedError();
  }
}
