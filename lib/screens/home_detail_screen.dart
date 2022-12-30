import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_d2d/connection/network_manager.dart';
import 'package:project_d2d/model/active_job.dart';
import 'package:project_d2d/model/base_response.dart';
import 'package:project_d2d/model/job_details.dart';
import 'package:project_d2d/screens/available_jobs_screen.dart';
import 'package:project_d2d/screens/job_details_screen.dart';
import 'package:project_d2d/screens/profile_screen.dart';
import 'package:project_d2d/screens/timesheet_screen.dart';
import 'package:project_d2d/utils/constants.dart';
import 'package:project_d2d/widgets/alert_card_widget.dart';
import 'package:project_d2d/widgets/slider_banner.dart';

class HomeDetailScreen extends StatefulWidget {
  const HomeDetailScreen({super.key});

  @override
  State<HomeDetailScreen> createState() => _HomeDetailScreenState();
}

class _HomeDetailScreenState extends State<HomeDetailScreen> {
  List<JobDetails> jobList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getJobDetails();
  }

  void getJobDetails() {
    NetworkManager.shared
        .getJobDetails(
      "TKN3561228453",
      "getJobsByStaffId",
      13,
      
      "",
      "Active",
    )
        .then((BaseResponse<List<JobDetails>> response) {
      setState(() {
        jobList.clear();
        jobList.addAll(response.data!);
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
                              getJobDetails();
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             AvailableJobsScreen()));
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
                      padding: EdgeInsets.only(left: 5, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 120,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              // color: Colors.redAccent,
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.pink.shade300,
                                  Colors.pink.shade100
                                ],
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 25,vertical: 5),
                                      child: Image.asset(
                                        'assets/images/ic_time_1.png',
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      ),
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
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(25),
                                      ),
                                      color: Colors.redAccent,
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(3),
                                        child: Text(
                                          '78',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: kFontWeight_SB,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  "Pending",
                                  style: TextStyle(
                                      fontSize: 12, fontWeight: kFontWeight_M),
                                ),
                                Text(
                                  "current job",
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 120,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              // color: Colors.redAccent,
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Colors.green, Colors.green.shade100],
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal:15,vertical: 5),
                                      child: Image.asset(
                                        'assets/images/ic_time_2.png',
                                        // width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      ),
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
                                        '78',
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
                                      fontSize: 12, fontWeight: kFontWeight_M),
                                ),
                                Text(
                                  "current job",
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 120,
                            width: 100,
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
                                  ]),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 25,vertical: 5),
                                      child: Image.asset(
                                        'assets/images/ic_time_3.png',
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      ),
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
                                  child: Container(
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
                                          '78',
                                          style: TextStyle(
                                            fontWeight: kFontWeight_SB,
                                            color: Colors.white,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  "Completed",
                                  style: TextStyle(
                                      fontSize: 12, fontWeight: kFontWeight_M),
                                ),
                                Text(
                                  "current job",
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                          Spacer(),
                          TextButton(
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             FeaturedProductsScreen()));
                            },
                            child: Text(
                              '',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            ),
                          ),
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
}
