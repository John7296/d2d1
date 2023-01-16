import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
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
        SingleChildScrollView(

          child: Column(
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
                    // Spacer(),
                    // TextButton(
                    //     onPressed: () {
                    //       Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) => EditProfile()));
                    //     },
                    //     child: Text("Edit",
                    //         style: TextStyle(
                    //             fontWeight: FontWeight.w900,
                    //             color: Color(0xffAFB0B6),
                    //             fontSize: 13)))
                  ],
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xffF3B7BF),
                child: profile.isNotEmpty? profile.first.profilePhoto!=null
                
               ? CircleAvatar(
                  radius: 35,
                  child: CachedNetworkImage(
                      imageUrl: profile.isNotEmpty
                          ? "https://wpr.intertoons.net/d2dwebadmin/${profile.first.profilePhoto}"
                          : ""),
                  // Image(
                  //   image: AssetImage("assets/images/profile_img.png"),
                  // ),
                )
                : CircleAvatar(
          radius: 35,
          child:  
          Image(
            image: AssetImage("assets/images/profile_img.png"),
          ),
        )
     :     CircleAvatar(
          radius: 35,
          child:  
          Image(
            image: AssetImage("assets/images/profile_img.png"),
          ),
        ) 
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
                  profile.isNotEmpty ? profile[0].catName ?? '' : "",                
                  style: TextStyle(color: Color(0xff95969D), fontSize: 14),
                ),
              )),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                //child: 
                // DottedBorder(
                //   borderType: BorderType.RRect,
                //   radius: Radius.circular(10),
                //   color: Color(0xff95969D),
                //   strokeWidth: 2, //thickness of dash/dots
                //   dashPattern: [3, 3],
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
                            profile.isNotEmpty
                                ? profile.first.totalEarnings==null?
                               
                                "0":   profile[0].totalEarnings.toString():"",
                            style: TextStyle(
                                color: Color(0xff07701E),
                                fontSize: 25,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                //),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Row(
                  children: [
                    Text("Payment History",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16))
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                    
                  decoration: BoxDecoration(
                     // color:Colors.yellow,
                
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey, width: 0),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(5),
                                      topLeft: Radius.circular(5)),
                                  color: Colors.pink.shade100),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Date",
                                        style: TextStyle(fontSize: 12)),
                                    // SizedBox(width: 100),
                                    Text("Mode of Payment",
                                        style: TextStyle(fontSize: 12)),
                                    Text("Status",
                                        style: TextStyle(fontSize: 12)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // Divider(
                          //   height: 1,
                          //   color: Colors.grey.shade900,
                          // ),
                        ],
                      ),
                      (payment.isNotEmpty)
                          ? ListView.separated(
                              shrinkWrap: true,
                              itemCount: payment.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: Row(
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    //  mainAxisAlignment:
                                    //      MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                          payment.isNotEmpty
                                              ? payment[index]
                                                  .createdOn
                                                  .toString()
                                              : "",
                                          // payment[index].paidOn
                                          //       ??
                                          //  '',
                                          style: TextStyle(fontSize: 12)),
                                      SizedBox(width: 62),
                                      Expanded(
                                        child: Text(
                                            (payment[index].paymentMode == null)
                                                ? "Unpaid"
                                                : payment[index]
                                                    .paymentMode
                                                    .toString(),
                                            // payment[index]
                                            //        .paymentMode.toString(),
                                  
                                            style: TextStyle(fontSize: 12)),
                                      ),
                                      if (payment[index].paymentStatus == 1)
                                        InkWell(
                                            onTap: () {
                                              openFile(
                                                // url:
                                                // 'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
                                                url:
                                                    'https://wpr.intertoons.net/d2dwebadmin/${payment[index].invoicePath}',
                                                fileName: 'file.pdf',
                                              );
                                            },
                                            child: Icon(Icons.download)),
                                      Container(
                                        height: 25,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          color:
                                              (payment[index].paymentStatus ==
                                                      0)
                                                  ? Color(0xffFD425B)
                                                  : Color(0xffC8F8B8),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                            child: Text(
                                          payment.isNotEmpty
                                              ? payment[index].paymentStatus ==
                                                      1
                                                  ? "Credited"
                                                  : "Pending"
                                              : "",
                                          // "Credited",
                                          // payment.first.paymentStatus.toString(),
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        )),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return Divider(
                                  height: 2,
                                  color: Colors.grey,
                                );
                              })
                
                          //  if(payment.isEmpty)
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Center(
                                      child: Text(
                                        "No Payment history Found",
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                    ],
                  ),
                ),
              ),
            ],
          ),
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

  Future openFile({required String url, String? fileName}) async {
    final file = await downloadFile(url, fileName!);
    if (file == null) return;

    print('Path:${file.path}');

    OpenFile.open(file.path);
  }

  Future<File?> downloadFile(String url, String name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name');
    try {
      final response = await Dio().get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: 0,
        ),
      );
      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();

      return file;
    } catch (e) {
      print(e.toString());
      showFlashMsg("No invoice available..!");
      return null;
    }
  }

  @override
  bool isAuthenticationRequired() {
    // TODO: implement isAuthenticationRequired
    throw UnimplementedError();
  }
}
