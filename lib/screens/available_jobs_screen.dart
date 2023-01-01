import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_d2d/base/base_stateful_state.dart';
import 'package:project_d2d/connection/network_manager.dart';
import 'package:project_d2d/model/active_job.dart';
import 'package:project_d2d/model/base_response.dart';
import 'package:project_d2d/model/job.dart';
import 'package:project_d2d/screens/home_detail_screen.dart';
import 'package:project_d2d/screens/home_screen.dart';
import 'package:project_d2d/screens/job_details_screen.dart';
import 'package:project_d2d/utils/constants.dart';
import 'package:project_d2d/widgets/available_job_widget.dart';

class AvailableJobsScreen extends StatefulWidget {
  @override
  _AvailableJobsScreenState createState() => _AvailableJobsScreenState();
}

class _AvailableJobsScreenState extends BaseStatefulState<AvailableJobsScreen>
    with TickerProviderStateMixin {
  List<Job> jobList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      getJobDetails();

      // _updateDeviceToken();
    });
  }

  void getJobDetails() {
    showLoader();
    NetworkManager.shared
        .getJob(
      "TKN3533328453",
      "getJobsByStaffId",
      13,
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

  List<StaffDetails> staffDetails = [
    StaffDetails(
        staffName: 'Catherine',
        jobName: 'Dialysis Specialyst',
        jobLocation: 'London',
        shiftType: 'Sunday',
        startDate: '10 Nov 2022',
        requested: true,
        hourlyRate: 25.00),
    StaffDetails(
        staffName: 'Mary',
        jobName: 'General Nurse',
        jobLocation: 'Agate East',
        shiftType: 'Full-Time',
        startDate: '15 DEC 2022',
        requested: false,
        hourlyRate: 30.00),
    StaffDetails(
        staffName: 'Sara',
        jobName: 'Mental Health Nurse',
        jobLocation: 'Coventry',
        shiftType: 'Saturday',
        requested: true,
        startDate: '12 Jan 2023',
        hourlyRate: 20.00),
    StaffDetails(
        staffName: 'Sandra',
        jobName: 'Laundry Assistant',
        jobLocation: 'Agate East',
        shiftType: 'Full-Time',
        startDate: '15 DEC 2022',
        requested: false,
        hourlyRate: 20.00),
  ];
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      },
                    ),
                  ),
                  height: 45,
                  width: 45,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 90),
                  child: Text("All Jobs",
                      style: TextStyle(
                          fontSize: kFontSize_16, fontWeight: kFontWeight_SB),
                      textAlign: TextAlign.center),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 20,
                    child: Text(
                      "All Available Jobs",
                      style: TextStyle(
                          fontSize: kFontSize_16, fontWeight: kFontWeight_SB),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 10),
              child: InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => SearchScreen()));
                },
                child: Container(
                  height: 50,
                  width: 360,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFE5E5E5)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Container(
                          child: Icon(Icons.search_rounded,
                              size: 25, color: Color(0xFF95969D)),
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TabBar(
                      unselectedLabelColor: Colors.grey,
                      indicatorSize: TabBarIndicatorSize.label,
                      controller: tabController,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.redAccent),
                      isScrollable: true,
                      indicatorColor: Colors.transparent,
                      tabs: [
                        Tab(
                          child: Container(
                            height: 40,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.grey, width: 1),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Requested",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: kFontWeight_M),
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            height: 40,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(color: Colors.grey, width: 1)),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text("Available",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: kFontWeight_M)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  AvailableJobWidget(),
// ==================================================================================================================================
                  ListView.builder(
                    // physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: staffDetails.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: Stack(
                          clipBehavior: Clip.none,
                          fit: StackFit.loose,
                          children: [
                            InkWell(
                              onTap: (() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => JobDetailsScreen(
                                            jobList[index].jobCatName ?? '',
                                            // jobList[index].hourlyRate ?? '',
                                            jobList[index].clientName ?? '',
                                            jobList[index].jobLocation ?? '',
                                            jobList[index].startDateTime ?? '',
                                            jobList[index].shiftName ?? '',
                                            context)));
                              }),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  image: DecorationImage(
                                    image: (staffDetails[index].requested!)
                                        ? AssetImage(
                                            "assets/images/green_bg.png")
                                        : AssetImage(
                                            "assets/images/red_bg.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                height: 150,
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 50,
                                            // color: Colors.white,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                              color: Colors.white,
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/care.png"),
                                                fit: BoxFit.cover,
                                              ),
                                              // boxShadow: [
                                              //   BoxShadow(
                                              //     color: Colors.grey,
                                              //     offset: Offset(0.0, 1.0), //(x,y)
                                              //     blurRadius: 3.0,
                                              //   ),
                                              // ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                staffDetails[
                                                                            index]
                                                                        .jobName ??
                                                                    '',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      kFontWeight_SB,
                                                                  fontSize:
                                                                      kFontSize_16,
                                                                ),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              onTap: () {},
                                                              child: ImageIcon(
                                                                AssetImage(
                                                                    "assets/images/ic_edit_task.png"),
                                                                size: 25,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          staffDetails[index]
                                                                  .staffName ??
                                                              '',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize:
                                                                  kFontSize_14,
                                                              fontWeight:
                                                                  kFontWeight_M),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            '£ ${staffDetails[index].hourlyRate ?? ''}/hour',
                                            style: TextStyle(
                                              fontWeight: kFontWeight_M,
                                              fontSize: 13,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 30,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(20),
                                              ),
                                              color:
                                                  Colors.white.withOpacity(0.1),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.alarm_add_outlined,
                                                    color: Colors.white,
                                                    size: 15,
                                                  ),
                                                  Text(
                                                    staffDetails[index]
                                                            .shiftType ??
                                                        '',
                                                    style: TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.white,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 30,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(15),
                                              ),
                                              color:
                                                  Colors.white.withOpacity(0.1),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_pin,
                                                    color: Colors.white,
                                                    size: 15,
                                                  ),
                                                  Text(
                                                    staffDetails[index]
                                                            .jobLocation ??
                                                        '',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 11),
                                                  ),
                                                ],
                                              ),
                                            ),
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
                                                staffDetails[index].startDate ??
                                                    '',
                                                style: TextStyle(
                                                  fontWeight: kFontWeight_M,
                                                  fontSize: 13,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            (staffDetails[index].requested!)
                                ? Positioned(
                                    top: -1.5,
                                    left: 220,
                                    child: Container(
                                      height: 200,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/redlabel.png"),
                                          // fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Align(
                                          child: Text(
                                        "Requested",
                                        style: TextStyle(
                                            fontSize: 8,
                                            color: Colors.white,
                                            fontWeight: kFontWeight_M),
                                      )),
                                    ),
                                  )
                                : SizedBox(),
                          ],
                        ),
                      );
                    },
                  ),
                ],
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
