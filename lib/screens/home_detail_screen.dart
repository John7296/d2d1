import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_d2d/base/base_stateful_state.dart';
import 'package:project_d2d/connection/network_manager.dart';
import 'package:project_d2d/model/active_job.dart';
import 'package:project_d2d/model/alert.dart';
import 'package:project_d2d/model/alert_messages.dart';
import 'package:project_d2d/model/base_response.dart';
import 'package:project_d2d/model/job.dart';
import 'package:project_d2d/model/timesheet.dart';
import 'package:project_d2d/screens/available_jobs_screen.dart';
import 'package:project_d2d/screens/job_details_screen.dart';
import 'package:project_d2d/screens/profile_screen.dart';
import 'package:project_d2d/screens/profile_summary_screen.dart';
import 'package:project_d2d/screens/settings_screen.dart';
import 'package:project_d2d/screens/timesheet_screen.dart';
import 'package:project_d2d/utils/constants.dart';
import 'package:project_d2d/utils/sessions_manager.dart';
import 'package:project_d2d/widgets/alert_card_widget.dart';
import 'package:project_d2d/widgets/slider_banner.dart';

class HomeDetailScreen extends StatefulWidget {
  const HomeDetailScreen({super.key});

  @override
  State<HomeDetailScreen> createState() => _HomeDetailScreenState();
}

class _HomeDetailScreenState extends BaseStatefulState<HomeDetailScreen> {
  List<Job> jobList = [];
  List<TimeSheet> timeSheetList = [];
  int? jobApproved;
  int? jobPending;
  int? jobCompleted;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      getJob();

      // _updateDeviceToken();
    });
    getTimeSheet();

    print("StaffId ${SessionsManager.staffId}");
    print("TokenId ${SessionsManager.userToken}");
  }

  void getJob() {
    showLoader();
    NetworkManager.shared
        .getJob(
      NetworkManager.shared.userToken!,
      "getJobsByStaffId",
      NetworkManager.shared.staffId!,
      "",
      "Active",
    )
        .then((BaseResponse<List<Job>> response) {
      hideLoader();
      setState(() {
        jobList.clear();
        jobList.addAll(response.data!);
      });
    }).catchError((e) {
      hideLoader();
      print(e.toString());
    });
  }

  void getTimeSheet() {
    // showLoader();
    NetworkManager.shared
        .timeSheet(
      NetworkManager.shared.userToken!,
      "getStaffTimesheetBannerById",
      NetworkManager.shared.staffId!,
    )
        .then((BaseResponse<List<TimeSheet>> response) {
      // hideLoader();
      setState(() {
        timeSheetList.clear();
        timeSheetList.addAll(response.data!);
      });
    }).catchError((e) {
      print(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome Back!',
                              style: TextStyle(
                                  fontFamily: kFontFamily,
                                  fontWeight: kFontWeight_M,
                                  fontSize: kFontSize_14,
                                  color: kGreyColorTxt),
                            ),
                            Text(
                              'Mary James 👋 ',
                              style: TextStyle(
                                  fontFamily: kFontFamily,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                  color: kAccentColor),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfileScreen(),
                                ),
                              );
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/profile.png'),
                              radius: 25,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AvailableJobsScreen()));
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kSearchfieldColor),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          children: [
                            ImageIcon(
                              AssetImage("assets/images/ic_search.png"),
                              size: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              child: Text(
                                "Search available jobs",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF95969D),
                                ),
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            "Active Jobs",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              // getJob();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AvailableJobsScreen()));
                            },
                            child: Text(
                              'See all ',
                              style: TextStyle(
                                color: kGreyColorTxt,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SliderBannerHomeWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Timesheets",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TimeSheetScreen()));
                            },
                            child: Text(
                              'See all ',
                              style: TextStyle(
                                color: Color(0xFF95969D),
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Container(
                              height: 120,
                              // width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                // color: Colors.redAccent,
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.pink.shade200,
                                    Colors.pink.shade50
                                  ],
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/ic_time_1.png',
                                        // width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                      color: Colors.redAccent,
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: Text(
                                          timeSheetList.first.jobPending
                                              .toString(),
                                          // "",
                                          style: TextStyle(
                                            fontWeight: kFontWeight_SB,
                                            color: Colors.white,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Pending",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: kFontWeight_M),
                                  ),
                                  Text(
                                    timeSheetList.first.currentJob.toString(),
                                    // "",
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              height: 120,
                              // width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                // color: Colors.redAccent,
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [Colors.green, Colors.green.shade50],
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/ic_time_2.png',
                                        // width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                      color: Colors.redAccent,
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: Text(
                                          timeSheetList.first.jobApproved
                                              .toString(),
                                          // "",
                                          style: TextStyle(
                                            fontWeight: kFontWeight_SB,
                                            color: Colors.white,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Approved",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: kFontWeight_M),
                                  ),
                                  Text(
                                    timeSheetList.first.currentJob ?? '',
                                    // "",
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              height: 120,
                              // width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                // color: Colors.redAccent,
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.yellow,
                                    Colors.yellow.shade100
                                  ],
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/ic_time_3.png',
                                        // width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                      color: Colors.redAccent,
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: Text(
                                          timeSheetList.first.jobApproved
                                              .toString(),
                                          // "",
                                          style: TextStyle(
                                            fontWeight: kFontWeight_SB,
                                            color: Colors.white,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Completed",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: kFontWeight_M),
                                  ),
                                  Text(
                                    timeSheetList.first.currentJob ?? '',
                                    // "",
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Alerts",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          // Spacer(),
                          // TextButton(
                          //   onPressed: () {
                          //     // getAlertDetails();
                          //     // Navigator.push(
                          //     //     context,
                          //     //     MaterialPageRoute(
                          //     //         builder: (context) =>
                          //     //             FeaturedProductsScreen()));
                          //   },
                          //   child: Text(
                          //     '',
                          //     style: TextStyle(
                          //       color: Colors.grey,
                          //       fontSize: 15,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: Radius.circular(20),
                        dashPattern: [10, 10],
                        color: Colors.blueGrey,
                        strokeWidth: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: SizedBox(
                              height: 150,
                              width: 350,
                              child: AlertCardWidget()),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
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
