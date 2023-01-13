import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_d2d/base/base_stateful_state.dart';
import 'package:project_d2d/connection/network_manager.dart';
import 'package:project_d2d/model/applyjob.dart';
import 'package:project_d2d/model/base_response.dart';
import 'package:project_d2d/model/jobdetails.dart';
import 'package:project_d2d/screens/available_jobs_screen.dart';
import 'package:project_d2d/screens/job_applied_successful_screen.dart';
import 'package:project_d2d/screens/job_cancel_screen.dart';
import 'package:project_d2d/utils/constants.dart';
import 'package:project_d2d/utils/sessions_manager.dart';
import 'package:project_d2d/widgets/top_banner_widget.dart';

class JobDetailsScreen extends StatefulWidget {
  // final JobDetails _jobDetails;

  JobDetailsScreen(
      this.jobCatName,
      this.hourlyRate,
      this.clientName,
      this.shiftName,
      this.startDateTime,
      this.jobLocation,
      this.isRequested,
      this.context);
  String jobCatName;
  double hourlyRate;
  String clientName;
  String jobLocation;

  String startDateTime;
  String shiftName;
  int isRequested;
  BuildContext context;

  @override
  _JobDetailsScreenState createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends BaseStatefulState<JobDetailsScreen> {
  List<JobDetails> jobDetailsList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      getJobDetails();
    });
  }

  void getJobDetails() {
    showLoader();
    NetworkManager.shared
        .getJobDetails(
      NetworkManager.shared.userToken!,
      "getJobDetailsByJobIdStaffId",
      NetworkManager.shared.staffId!,
      NetworkManager.shared.jobId!,
    )
        .then((BaseResponse<List<JobDetails>> response) {
      hideLoader();
      setState(() {
        jobDetailsList.clear();

// if (response.data!.result1!.isNotEmpty) {
//           timeSheetDetailsList.add(response.data!);
//           timesheetlist = timeSheetDetailsList;
//         }
        if (response.data!.isNotEmpty) {
          jobDetailsList.addAll(response.data!);
        }
      });
    }).catchError((e) {
      hideLoader();
      print(e.toString());
    });
  }

  void onApplyButtonTapped() {
    showLoader();
    NetworkManager.shared
        .applyJob(NetworkManager.shared.userToken!, <String, dynamic>{
      "sp": "insApplyJob",
      "staffId": NetworkManager.shared.staffId,
      "jobId": NetworkManager.shared.jobId,
    }).then((BaseResponse<ApplyJob> response) {
      hideLoader();

      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => JobAppliedSuccessfulScreen(
      //             widget.jobCatName,
      //             // jobList[index].hourlyRate,
      //             widget.clientName,
      //             widget.jobLocation,
      //             widget.startDateTime,
      //             widget.shiftName,
      //             context)));
    }).catchError((e) {
      hideLoader();
      // showFlashMsg(e.toString());
      print(e.toString());
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
                  height: getHeightByPercentage(35),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(0),
                    ),
                    image: DecorationImage(
                      image: AssetImage("assets/images/red_bg.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        // color: Colors.green,
                        height: getHeightByPercentage(25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            CircleAvatar(
                              radius: 35,
                              child: Image(
                                image: AssetImage("assets/images/care.png"),
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
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 135),
                              child: Container(
                                height: 30,
                                // width: 120,
                                // color: Colors.white,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  color: Colors.white.withOpacity(0.1),
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
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          // color: Colors.green,
                          height: getHeightByPercentage(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "£${widget.hourlyRate.toString()}/hour",
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
                      ),
                    ],
                  ),
                ),
                if (widget.isRequested==1)
                  Positioned(
                    top: 160,
                    right: 0,
                    child: Container(
                      height: 30,
                      width: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15)),
                        color: kButtonColorR,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Requested',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                      ),
                    ),
                  ),
                IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => AvailableJobsScreen(),
                    //     ),
                    //   );
                  },
                ),
              ],
            ),

            // Row(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Container(
            //         child: Text(
            //           "Details",
            //           style: TextStyle(fontSize: 20, fontWeight: kFontWeight_M),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: jobDetailsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Text("Job Description",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: kFontWeight_M)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            (jobDetailsList[index].jobDescription != "")
                                ? jobDetailsList[index].jobDescription ?? ''
                                : "Not Available",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Rate",
                            style: TextStyle(
                                fontSize: 18, fontWeight: kFontWeight_M)),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            "£${jobDetailsList[index].hourlyRate}/hour",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Job Location",
                            style: TextStyle(
                                fontSize: 18, fontWeight: kFontWeight_M)),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            jobDetailsList[index].jobLocation ?? '',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Info",
                            style: TextStyle(
                                fontSize: 18, fontWeight: kFontWeight_M)),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            jobDetailsList[index].info == null ||
                                    jobDetailsList[index].info == ""
                                ? "No info available"
                                : jobDetailsList[index].info ?? '',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 2, vertical: 5),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.end,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              (jobDetailsList[index].jobStatus != "Applied")
                                  ? Expanded(
                                      child: Container(
                                        // width: 150,
                                        height: 50,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // getJobDetails();
                                            onApplyButtonTapped();
                                            showFlashMsg(
                                                "Job Applied Successful..!");
                                            Navigator.pushAndRemoveUntil(
                                                context, MaterialPageRoute(
                                              builder: (BuildContext context) {
                                                return JobAppliedSuccessfulScreen(
                                                    widget.jobCatName,
                                                    widget.hourlyRate
                                                        .toDouble(),
                                                    widget.clientName,
                                                    widget.jobLocation,
                                                    widget.startDateTime,
                                                    widget.shiftName,
                                                    widget.isRequested,
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
                                                MaterialStateProperty.all(
                                                    Color(0xff12831D)),
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            )),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Expanded(
                                      child: Container(
                                        // width: 150,
                                        height: 50,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        JobCancelScreen(
                                                            widget.jobCatName,
                                                            widget.hourlyRate
                                                                .toDouble(),
                                                            widget.clientName,
                                                            widget.jobLocation,
                                                            widget
                                                                .startDateTime,
                                                            widget.shiftName,
                                                            widget.isRequested,
                                                            context)));
                                          },
                                          child: Text(
                                            'Cancel',
                                            style: TextStyle(
                                                fontSize: kFontSize_16,
                                                fontWeight: kFontWeight_M),
                                          ),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Color(0xffF41937)),
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            )),
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Spacer(),

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

  @override
  bool isAuthenticationRequired() {
    // TODO: implement isAuthenticationRequired
    throw UnimplementedError();
  }
}
