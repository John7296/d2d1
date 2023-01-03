import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:project_d2d/connection/network_manager.dart';
import 'package:project_d2d/model/base_response.dart';
import 'package:project_d2d/model/job_request.dart';
import 'package:project_d2d/model/staff_profile.dart';
import 'package:project_d2d/model/timesheet_banner.dart';
import 'package:project_d2d/model/training_status.dart';

import 'package:project_d2d/screens/profile_summary_screen.dart';
import 'package:project_d2d/utils/constants.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  List<StaffProfile> profile = [];
   List<TrainingStatus> training = [];
     List<JobRequest> jobs = [];
     List<TimesheetBanner> banner= [];
  @override
  void initState() {
    super.initState();

      Future.delayed(const Duration(milliseconds: 500), () {
       staffProfile();
    trainingStatus();
    recentJobRequest();
    timeSheetBanner();

      // _updateDeviceToken();
    });
  
  }

  void staffProfile() {
    
    NetworkManager.shared
        .staffProfile(NetworkManager.shared.userToken??'', "getStaffProfilebyid", NetworkManager.shared.staffId??0)
        .then((BaseResponse<List<StaffProfile>> response) {
      //  hideLoader();
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
      //  Navigator.pushReplacement(
      //                 context,
      //                 MaterialPageRoute(
      //                 builder: (context) =>
      //                 VerifyOtpScreen()));
    }).catchError((e) {
      //  hideLoader();
      // showFlashMsg(e.toString());
      // print(e);
      // showFlashMsg(e.Message!);
    });
  }

  void trainingStatus() {
    NetworkManager.shared
        .trainingStatus(NetworkManager.shared.userToken!, "getTrainingStatus",NetworkManager.shared.staffId!)
        .then((BaseResponse<List<TrainingStatus>> response) {
      //  hideLoader();
      setState(() {
      training.clear();
      training.addAll(response.data!);
     
      //   emailSent = true;
      });
      //  Navigator.pushReplacement(
      //                 context,
      //                 MaterialPageRoute(
      //                 builder: (context) =>
      //                 VerifyOtpScreen()));
    }).catchError((e) {
      //  hideLoader();
      // showFlashMsg(e.toString());
      // print(e);
      // showFlashMsg(e.Message!);
    });
  }

  void recentJobRequest() {
    NetworkManager.shared
        .recentJobRequest(NetworkManager.shared.userToken??'', "getRecentRequstedJobs",NetworkManager.shared.staffId??0)
        .then((BaseResponse<List<JobRequest>> response) {
      //  hideLoader();
      setState(() {
      jobs.clear();
      jobs.addAll(response.data!);

       print(response.data?.first.allocatedOn);
      print("...................");
     
      //   emailSent = true;
      });
     
    }).catchError((e) {
      //  hideLoader();
      // showFlashMsg(e.toString());
      // print(e);
      // showFlashMsg(e.Message!);
    });
  }

   void timeSheetBanner() {
    NetworkManager.shared
        .timeSheetBanner(NetworkManager.shared.userToken??'', "getStaffTimesheetBannerById", NetworkManager.shared.staffId??0)
        .then((BaseResponse<List<TimesheetBanner>> response) {
      //  hideLoader();
      setState(() {
      banner.clear();
      banner.addAll(response.data!);
     
      //   emailSent = true;
      });
     
    }).catchError((e) {
      //  hideLoader();
      // showFlashMsg(e.toString());
      // print(e);
      // showFlashMsg(e.Message!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
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
                    onPressed: () {},
                    child: Text("Edit",
                        style:
                            TextStyle(color: Color(0xffAFB0B6), fontSize: 15)))
              ],
            ),
          ),
          CircleAvatar(
            radius: 50,
            backgroundColor: Color(0xffF3B7BF),
            child: CircleAvatar(
              radius: 35,
              child: Image(
                image: AssetImage("assets/images/profile_img.png"),
              ),
            ),
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 10),
             child: Text(
            //    "Mary James",
               profile.first.staffName.toString(),
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 22),
            ),
          )),
          Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              // "Theatre practitioner",
              profile.first.address.toString(),
              style: TextStyle(color: Color(0xff95969D), fontSize: 13),
            ),
          )),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "27",
                  // profile.first.jobsCount.toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 13),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60),
                  child: Text(
                    "89",
                    // profile.first.timeSheetCount.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 13),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Text(
                    // "13 Nov 2024",
                    profile.first.timeSheetDate.toString(),
                    maxLines: 2,
                    style: TextStyle(
                        color: Color(0xffF41937),
                        fontWeight: FontWeight.w700,
                        fontSize: 13),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileSummaryScreen()));
                    },
                    child: Text(
                      "\$3435.00",
                      // "\$ ${profile.first.totalEarnings.toString()}",
                      style: TextStyle(
                          color: kGreenColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 13),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Jobs",
                  style: TextStyle(
                      color: Color(0xff95969D),
                      fontWeight: FontWeight.w500,
                      fontSize: 11),
                ),
                SizedBox(
                  width: 32,
                ),
                Text(
                  "Time sheets",
                  style: TextStyle(
                      color: Color(0xff95969D),
                      fontWeight: FontWeight.w500,
                      fontSize: 11),
                ),
                SizedBox(
                  width: 32,
                ),
                Text(
                  "Time sheets",
                  style: TextStyle(
                      color: Color(0xff95969D),
                      fontWeight: FontWeight.w500,
                      fontSize: 11),
                ),
                SizedBox(
                  width: 32,
                ),
                Text(
                  "Total Earnings",
                  style: TextStyle(
                      color: Color(0xff95969D),
                      fontWeight: FontWeight.w500,
                      fontSize: 11),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Row(
              children: [
                Text("Recent Job Request",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                Spacer(),
                Text("See all",
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xffAFB0B6),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white70
                    // color: Colors.yellow,
                    ),
                height: 90,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 25),
                          child: Column(
                            children: [
                              Center(
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  child: Image(
                                    image: AssetImage(
                                        "assets/images/homecare_logo.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "Dialysis Specialist",
                                  // jobs.first.profession.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  )),
                              Text(
                                "Agate House",
                                // jobs.first.clientName.toString(),
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff000000))),
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 10, top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.add_location_outlined,
                                    color: Color(0xff413E3E),
                                  ),
                                  Text(
                                    "Agate East",
                                    // jobs.first.staffLocation.toString(),
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_month_outlined,
                                    color: Color(0xffAFB0B6),
                                  ),
                                  Text(
                                    // "11 Nov 2022",
                                    jobs.first.allocatedOn.toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Color(0xff0D0D26),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 15,
                      width: 110,
                      decoration: BoxDecoration(
                        color: Color(0xffD00000),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                        ),
                      ),
                      child: Center(
                          child: Text(
                        "Requested",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      )),
                    )
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Row(
              children: [
                Text("Time Sheets",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                Spacer(),
                Text("See all",
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xffAFB0B6),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Row(
              children: [
                Container(
                  height: 70,
                  width: 180,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    //color: Colors.green,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Color(0xffFDD9DE),
                              child: Container(
                                width: 50,
                                height: 40,
                                child: Image(
                                  image: AssetImage(
                                    "assets/images/time.png",
                                  ),
                                  fit: BoxFit.fill,
                                  //    width:50,
                                  // height:50
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 13),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              // "7 Pending",
                             " ${banner.first.jobPending.toString()} Pending",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xffFD425B))),
                            Padding(
                              padding: const EdgeInsets.only(left:3),
                              child: Text(
                                // "Agate House",
                                banner.first.clientName.toString(),
                                  style: TextStyle(
                                      fontSize: 12, color: Color(0xffAFB0B6))),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 11),
                Container(
                  height: 70,
                  width: 180,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    // color: Colors.green,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Color(0xffFDD9DE),
                              child: Container(
                                width: 50,
                                height: 40,
                                child: Image(
                                  image: AssetImage(
                                    "assets/images/time.png",
                                  ),
                                  fit: BoxFit.fill,
                                  //    width:50,
                                  // height:50
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(width: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 13),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              // "85 Approved",
                               " ${banner.first.jobApproved.toString()} Approved",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xffFD425B))),
                            Padding(
                              padding: const EdgeInsets.only(left:3),
                              child: Text(
                                // "Agate House",
                                banner.first.clientName.toString(),
                                  style: TextStyle(
                                      fontSize: 12, color: Color(0xffAFB0B6))),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Row(
              children: [
                Text("Training Status",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [

                              // if(training.isEmpty)
                              Text("Manual Handling",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black)),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text("Food Hygiene",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                          SizedBox(height: 10),
                          Text("Fire Awareness",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                          SizedBox(height: 10),
                          Text("Health and Safety",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                          SizedBox(height: 10),
                          Text("Infection Control",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 150),
                          child: Text("38%"),
                        ),
                        LinearPercentIndicator(
                          lineHeight: 12,
                          width: 200,
                          progressColor: kGreenprogressColor,
                          backgroundColor: Color(0xffD9D9D9),
                          percent: 0.38,
                          barRadius: Radius.circular(5),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 150),
                          child: Text(
                            // "93%"
                            "${training.first.completionRate.toString()}%",
                            
                            ),
                        ),
                        LinearPercentIndicator(
                          lineHeight: 12,
                          width: 200,
                          progressColor: kGreenprogressColor,
                          backgroundColor: Color(0xffD9D9D9),
                          percent: 0.30,
                          barRadius: Radius.circular(5),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 150),
                          child: Text("68%"),
                        ),
                        LinearPercentIndicator(
                          lineHeight: 12,
                          width: 200,
                          progressColor: kGreenprogressColor,
                          backgroundColor: Color(0xffD9D9D9),
                          percent: 0.68,
                          barRadius: Radius.circular(5),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 150),
                          child: Text("24%"),
                        ),
                        LinearPercentIndicator(
                          lineHeight: 12,
                          width: 200,
                          progressColor: kGreenprogressColor,
                          backgroundColor: Color(0xffD9D9D9),
                          percent: 0.24,
                          barRadius: Radius.circular(5),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 150),
                          child: Text("89%"),
                        ),
                        LinearPercentIndicator(
                          lineHeight: 12,
                          width: 200,
                          progressColor: kGreenprogressColor,
                          backgroundColor: Color(0xffD9D9D9),
                          percent: 0.89,
                          barRadius: Radius.circular(5),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
