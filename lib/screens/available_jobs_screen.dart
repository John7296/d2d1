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
import 'package:project_d2d/utils/sessions_manager.dart';
import 'package:project_d2d/widgets/available_job_widget.dart';

class AvailableJobsScreen extends StatefulWidget {
  bool? fromSettings;

  AvailableJobsScreen({super.key, this.fromSettings = true});
  @override
  _AvailableJobsScreenState createState() => _AvailableJobsScreenState();
}

class _AvailableJobsScreenState extends BaseStatefulState<AvailableJobsScreen>
    with TickerProviderStateMixin {
  String _searchString = "";
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
      NetworkManager.shared.userToken!,
      "getJobsByStaffId",
      NetworkManager.shared.staffId!,
      _searchString,
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
                        (widget.fromSettings == true)
                            ? Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return HomeScreen();
                                },
                              ), (route) => false)
                            : Navigator.pop(context);
                        // getJobDetails();
                      },
                    ),
                  ),
                  height: 45,
                  width: 45,
                ),
                SizedBox(
                  width: getWidthByPercentage(25),
                ),
                Text("All Jobs",
                    style: TextStyle(
                        fontSize: kFontSize_16, fontWeight: kFontWeight_SB),
                    textAlign: TextAlign.center),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 15, bottom: 15),
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 50,
                    // width: 360,
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
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: TextField(
                                autofocus: false,
                                textInputAction: TextInputAction.search,
                                onChanged: (value) {
                                  _searchString = value;
                                },
                                onSubmitted: (value) {
                                  getJobDetails();
                                },
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Search Available Jobs",
                                    hintStyle: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontFamily: "Intro",
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey)),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                                "Available",
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
                              child: Text("Requested",
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
                  (jobList.isNotEmpty)
                      ? ListView.builder(
                          // physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: jobList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Stack(
                                children: [
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          SessionsManager.saveJobId(
                                              jobList[index].jobId ?? 0);

                                          NetworkManager.shared.jobId =
                                              jobList[index].jobId ?? 0;

                                          NetworkManager.shared.refreshTokens();
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  JobDetailsScreen(
                                                      jobList[
                                                                  index]
                                                              .jobCatName ??
                                                          '',
                                                      jobList[
                                                              index]
                                                          .hourlyRate!
                                                          .toDouble(),
                                                      jobList[
                                                                  index]
                                                              .clientName ??
                                                          '',
                                                      jobList[
                                                                  index]
                                                              .jobLocation ??
                                                          '',
                                                      jobList[
                                                                  index]
                                                              .startDateTime ??
                                                          '',
                                                      jobList[index]
                                                              .shiftName ??
                                                          '',
                                                      jobList[index]
                                                          .isRequsted!,
                                                      context),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width: getWidthByPercentage(92),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                            image: DecorationImage(
                                              image: (jobList[index]
                                                      .isRequsted!)
                                                  ? AssetImage(
                                                      "assets/images/green_bg.png")
                                                  : AssetImage(
                                                      "assets/images/red_bg.png"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          height: 155,
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
                                                        borderRadius:
                                                            BorderRadius.all(
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
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 10),
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          jobList[index].jobCatName ??
                                                                              '',
                                                                          maxLines:
                                                                              2,
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight:
                                                                                kFontWeight_SB,
                                                                            fontSize:
                                                                                kFontSize_16,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      // InkWell(
                                                                      //   onTap: () {},
                                                                      //   child:
                                                                      //       ImageIcon(
                                                                      //     AssetImage(
                                                                      //         "assets/images/ic_edit_task.png"),
                                                                      //     size: 25,
                                                                      //     color: Colors
                                                                      //         .white,
                                                                      //   ),
                                                                      // ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        jobList[index].clientName ??
                                                                            '',
                                                                        maxLines:
                                                                            1,
                                                                        style: TextStyle(
                                                                            color: Colors.white.withOpacity(
                                                                                0.8),
                                                                            fontSize:
                                                                                kFontSize_14,
                                                                            fontWeight:
                                                                                kFontWeight_M),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    if (jobList[index]
                                                            .jobStatus ==
                                                        "Applied")
                                                      InkWell(
                                                        onTap: () {},
                                                        child: ImageIcon(
                                                          AssetImage(
                                                              "assets/images/ic_tick.png"),
                                                          size: 25,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    // Icon(
                                                    //   Icons.calendar_today_outlined,
                                                    //   color: Colors.white,
                                                    //   size: 14,
                                                    // ),
                                                    // SizedBox(width: 2),
                                                    // Text(
                                                    //   jobList[index].startDateTime ?? "",
                                                    //   style: TextStyle(
                                                    //     fontWeight: kFontWeight_M,
                                                    //     fontSize: 13,
                                                    //     color: Colors.white,
                                                    //   ),
                                                    // ),
                                                    Spacer(),
                                                    Text(
                                                      '£ ${jobList[index].hourlyRate ?? ""}/hour',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            kFontWeight_M,
                                                        fontSize: 13,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Spacer(),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Container(
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(20),
                                                        ),
                                                        color: Colors.white
                                                            .withOpacity(0.15),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 15),
                                                        child: Row(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right: 2),
                                                              child: ImageIcon(
                                                                AssetImage(
                                                                    "assets/images/ic_alarm.png"),
                                                                size: 15,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 60,
                                                              child: Text(
                                                                jobList[index]
                                                                        .shiftName ??
                                                                    "",
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 11,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(15),
                                                        ),
                                                        color: Colors.white
                                                            .withOpacity(0.15),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10),
                                                        child: Row(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right: 2),
                                                              child: ImageIcon(
                                                                AssetImage(
                                                                    "assets/images/ic_location.png"),
                                                                size: 15,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 60,
                                                              child: Text(
                                                                jobList[index]
                                                                        .jobLocation ??
                                                                    "",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        11),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .calendar_today_outlined,
                                                          color: Colors.white,
                                                          size: 14,
                                                        ),
                                                        SizedBox(width: 2),
                                                        Text(
                                                          jobList[index]
                                                                  .startDateTime ??
                                                              "",
                                                          style: TextStyle(
                                                            fontWeight:
                                                                kFontWeight_M,
                                                            fontSize: 13,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (jobList[index].isRequsted == "1")
                                        Image(
                                            image: AssetImage(
                                                "assets/images/redlabel_tail.png")),
                                    ],
                                  ),
                                  if (jobList[index].isRequsted!)
                                    Positioned(
                                      top: 58,
                                      right: 3,
                                      child: Stack(
                                        children: [
                                          Image(
                                              image: AssetImage(
                                                  "assets/images/redlabel.png")),
                                          Positioned(
                                            right: 0,
                                            left: 0,
                                            bottom: 0,
                                            top: 0,
                                            child: Container(
                                              // color: Colors.yellow,
                                              child: Center(
                                                child: Text(
                                                  "Requested",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          kFontWeight_M),
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
                        )
                      : Center(
                          child: Container(child: Text("No Jobs Available"))),
// ==================================================================================================================================
                  AvailableJobWidget(),
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
