import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_d2d/connection/network_manager.dart';
import 'package:project_d2d/model/applyjob.dart';
import 'package:project_d2d/model/base_response.dart';
import 'package:project_d2d/model/jobdetails.dart';
import 'package:project_d2d/screens/job_applied_successful_screen.dart';
import 'package:project_d2d/screens/job_cancel_screen.dart';
import 'package:project_d2d/utils/constants.dart';
import 'package:project_d2d/widgets/top_banner_widget.dart';

class JobDetailsScreen extends StatefulWidget {
  // final JobDetails _jobDetails;

  JobDetailsScreen(this.jobCatName, this.clientName, this.shiftName,
      this.startDateTime, this.jobLocation, this.context);
  String jobCatName;
  String clientName;
  String jobLocation;

  // double hourlyRate;
  String startDateTime;
  String shiftName;
  BuildContext context;

  @override
  _JobDetailsScreenState createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  List<JobDetails> jobDetailsList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getJobDetails();
  }

  void getJobDetails() {
    // showLoader();
    NetworkManager.shared
        .getJobDetails(
      "TKN3533328453",
      "getJobDetailsByJobIdStaff",
      13,
      2,
    )
        .then((BaseResponse<List<JobDetails>> response) {
      // hideLoader();
      setState(() {
        jobDetailsList.clear();
        jobDetailsList.addAll(response.data!);
      });
    }).catchError((e) {
      // hideLoader();
      print(e.toString());
    });
  }

  void onApplyButtonTapped() {
    NetworkManager.shared.applyJob("TKN3533328453", <String, dynamic>{
      "sp": "insApplyJob",
      "staffId": "13",
      "jobId": "1"
    }).then((BaseResponse<ApplyJob> response) {
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => JobAppliedSuccessfulScreen()));
    }).catchError((e) {
      // print(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(0),
                    ),
                    image: DecorationImage(
                      image: AssetImage("assets/images/red_bg.png"),
                      fit: BoxFit.cover,
                    ),
                    // color: Colors.green.shade400,
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey,
                    //     offset: Offset(0.0, 1.0), //(x,y)
                    //     blurRadius: 3.0,
                    //   ),
                    // ],
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        //  mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: IconButton(
                                    icon: Icon(Icons.arrow_back_ios,
                                        color: Colors.white),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                                height: 40,
                                width: 40,
                              ),
                              SizedBox(
                                height: 150,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(40),
                                  ),
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/care.png"),
                                    fit: BoxFit.contain,
                                  ),
                                  // color: Colors.green.shade400,
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //     color: Colors.grey,
                                  //     offset: Offset(0.0, 1.0), //(x,y)
                                  //     blurRadius: 3.0,
                                  //   ),
                                  // ],
                                ),
                              ),
                              Text(
                                widget.jobCatName,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: kFontWeight_M,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                widget.clientName,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                height: 30,
                                // width: 100,
                                // color: Colors.white,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  color: Colors.white.withOpacity(0.1),

                                  // boxShadow: [
                                  //   BoxShadow(
                                  //     color: Colors.grey,
                                  //     offset: Offset(0.0, 1.0), //(x,y)
                                  //     blurRadius: 3.0,
                                  //   ),
                                  // ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.alarm_add_outlined,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                      Text(
                                        widget.jobLocation,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 11),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '£ 25.00/hour',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: kFontWeight_SB,
                                  fontSize: kFontSize_14),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_today_outlined,
                                  color: Colors.white,
                                  size: 14,
                                ),
                                SizedBox(width: 2),
                                Text(
                                  widget.startDateTime,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: kFontWeight_SB,
                                      fontSize: kFontSize_14),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                ImageIcon(
                                  AssetImage("assets/images/ic_location.png"),
                                  size: 20,
                                  color: Colors.white,
                                ),
                                Text(
                                  widget.shiftName,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: kFontWeight_SB,
                                    fontSize: kFontSize_14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 150),
                //   child: Align(
                //     alignment: Alignment.centerRight,
                //     child: Container(
                //       height: 30,
                //       width: 72,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.only(
                //             topLeft: Radius.circular(15),
                //             bottomLeft: Radius.circular(15)),
                //         color: kButtonColorR,

                //         // boxShadow: [
                //         //   BoxShadow(
                //         //     color: Colors.grey,
                //         //     offset: Offset(0.0, 1.0), //(x,y)
                //         //     blurRadius: 3.0,
                //         //   ),
                //         // ],
                //       ),
                //       child: Center(
                //         child: Padding(
                //           padding: const EdgeInsets.only(left: 10),
                //           child: Text(
                //             'Requested',
                //             style: TextStyle(color: Colors.white, fontSize: 11),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text(
                  "Details",
                  style: TextStyle(fontSize: 18, fontWeight: kFontWeight_M),
                ),
              ),
            ),
            Container(
              // color: Colors.white,

              height: 350,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: jobDetailsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Hourly Rate ${jobDetailsList[index].hourlyRate}",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                // width: 250,
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        // width: 150,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            onApplyButtonTapped();
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(
                              builder: (BuildContext context) {
                                return JobAppliedSuccessfulScreen(
                                    widget.jobCatName ?? '',
                                    // jobList[index].hourlyRate ?? '',
                                    widget.clientName ?? '',
                                    widget.jobLocation ?? '',
                                    widget.startDateTime ?? '',
                                    widget.shiftName ?? '',
                                    context);
                              },
                            ), (route) => false);
                          },
                          child: Text(
                            'Apply',
                            style: TextStyle(
                                fontSize: kFontSize_16,
                                fontWeight: kFontWeight_M),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff12831D)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )),
                          ),
                        ),
                      ),
                    ),
                    // Container(
                    //   // width: 150,
                    //   height: 50,
                    //   child: ElevatedButton(
                    //     onPressed: () {
                    //       Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) =>
                    //                   JobCancelScreen()));
                    //     },
                    //     child: Text(
                    //       'Cancel',
                    //       style: TextStyle(
                    //           fontSize: kFontSize_16,
                    //           fontWeight: kFontWeight_M),
                    //     ),
                    //     style: ButtonStyle(
                    //       backgroundColor: MaterialStateProperty.all(
                    //           Color(0xffF41937)),
                    //       shape: MaterialStateProperty.all(
                    //           RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(5),
                    //       )),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10)

            // Padding(
            //   padding: const EdgeInsets.all(10),
            //   child: Row(
            //     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     // crossAxisAlignment: CrossAxisAlignment.stretch,
            //     children: [
            //       Text(
            //         "Details",
            //         style: TextStyle(
            //             fontSize: kFontSize_16, fontWeight: kFontWeight_M),
            //       ),
            //     ],
            //   ),
            // ),
            // Column(
            //   children: [
            //     ListView.builder(
            //         // shrinkWrap: true,
            //         itemCount: 50,
            //         itemBuilder: (BuildContext context, index) {
            //           return Column(children: [
            //             Expanded(
            //               child: ListView.builder(
            //                 itemBuilder: (BuildContext context, int index) {
            //                   return Text("1151112");
            //                 },
            //               ),
            //             ),
            //             ElevatedButton(onPressed: () {  },
            //             child: Text("data"),
            //                 // fill in required params
            //                 )
            //           ]);
            //         }),

            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
