import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_d2d/base/base_stateful_state.dart';
import 'package:project_d2d/base/base_widget_stateful_state.dart';
import 'package:project_d2d/connection/network_manager.dart';
import 'package:project_d2d/model/active_job.dart';
import 'package:project_d2d/model/base_response.dart';
import 'package:project_d2d/model/job.dart';
import 'package:project_d2d/screens/job_details_screen.dart';
import 'package:project_d2d/utils/constants.dart';
import 'package:project_d2d/utils/sessions_manager.dart';

class AvailableJobWidget extends StatefulWidget {
  const AvailableJobWidget({super.key});

  @override
  State<AvailableJobWidget> createState() => _AvailableJobWidgetState();
}

class _AvailableJobWidgetState
    extends BaseWidgetStatefulState<AvailableJobWidget> {
  // List<Job> jobList = [];
  List<Job> reqJobList = [];
  List<Job> reqJobListOne = [];
  List<Job> reqJobListTwo = [];
  List<Job> reqJobListThree = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getJob();
    getJobOne();
    getJobTwo();
  }

  void getJob() {
    NetworkManager.shared
        .getJob(
      NetworkManager.shared.userToken!,
      "getJobsByStaffId",
      NetworkManager.shared.staffId!,
      "",
      "Active",
    )
        .then((BaseResponse<List<Job>> response) {
      setState(() {
        reqJobList.clear();
        for (var element in response.data!) {
          if (element.isRequsted == 1) {
            reqJobList.add(element);
            print("ActiveList ${element.jobLocation}");
          }
          // else
          // if(element.isRequsted == false){
          //   print(element.jobLocation);
          // }
        }
      });
    }).catchError((e) {
      print(e.toString());
    });
  }

  void getJobOne() {
    NetworkManager.shared
        .getJob(
      NetworkManager.shared.userToken!,
      "getJobsByStaffId",
      NetworkManager.shared.staffId!,
      "",
      "Upcoming",
    )
        .then((BaseResponse<List<Job>> response) {
      setState(() {
        for (var element in response.data!) {
          if (element.isRequsted == 1) {
            reqJobListOne.clear();
            reqJobListOne.add(element);
            print("UpcomingList ${element.jobLocation}");
          }
          // else
          // if(element.isRequsted == false){
          //   print(element.jobLocation);
          // }
        }
      });
    }).catchError((e) {
      print(e.toString());
    });
  }

  void getJobTwo() {
    NetworkManager.shared
        .getJob(
      NetworkManager.shared.userToken!,
      "getJobsByStaffId",
      NetworkManager.shared.staffId!,
      "",
      "Requested",
    )
        .then((BaseResponse<List<Job>> response) {
      setState(() {
        for (var element in response.data!) {
          if (element.isRequsted == 1) {
            reqJobListTwo.clear();
            reqJobListTwo.add(element);
            // print("RequestedList ${.jobLocation}");
            reqJobListThree.add(element);
            // reqJobListThree = reqJobList + reqJobListOne + reqJobListTwo;
            print("FinalList ${reqJobListThree}");
          }
          // else
          // if(element.isRequsted == false){
          //   print(element.jobLocation);
          // }
        }
      });
    }).catchError((e) {
      print(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (reqJobListTwo.isNotEmpty)
            ? Expanded(
                child: ListView.builder(
                  // physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: reqJobListThree.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  SessionsManager.saveJobId(
                                      reqJobListThree[index].jobId ?? 0);

                                  NetworkManager.shared.jobId =
                                      reqJobListThree[index].jobId ?? 0;

                                  NetworkManager.shared.refreshTokens();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => JobDetailsScreen(
                                              reqJobListThree[index]
                                                      .jobCatName ??
                                                  '',
                                              reqJobListThree[index]
                                                  .hourlyRate!
                                                  .toDouble(),
                                              reqJobListThree[index]
                                                      .clientName ??
                                                  '',
                                              reqJobListThree[index]
                                                      .jobLocation ??
                                                  '',
                                              reqJobListThree[index]
                                                      .startDateTime ??
                                                  '',
                                              reqJobListThree[index].shiftName ??
                                                  '',
                                              reqJobListThree[index]
                                                  .isRequsted!,
                                              reqJobListThree[index]
                                                      .jobNumber ??
                                                  '',
                                              context)));
                                },
                                child: Container(
                                  width: getWidthByPercentage(92),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    // border: Border.all(color:(reqJobListThree[index].jobStatus =="Applied")?Color.fromARGB(103, 51, 50, 50):Colors.transparent,width: 3),
                                    image: DecorationImage(
                                      image:
                                          // (reqJobListThree[index].requested!)
                                          // ?
                                          AssetImage(
                                              "assets/images/green_bg.png"),
                                      // : AssetImage("assets/images/red_bg.png"),
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
                                                                child: Text(
                                                                  reqJobListThree[
                                                                              index]
                                                                          .jobCatName ??
                                                                      '',
                                                                  maxLines: 2,
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
                                                              // InkWell(
                                                              //   onTap: () {},
                                                              //   child: ImageIcon(
                                                              //     AssetImage(
                                                              //         "assets/images/ic_edit_task.png"),
                                                              //     size: 25,
                                                              //     color: Colors.white,
                                                              //   ),
                                                              // ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                reqJobListThree[
                                                                            index]
                                                                        .clientName ??
                                                                    '',
                                                                maxLines: 1,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white
                                                                        .withOpacity(
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
                                            if (reqJobListThree[index]
                                                    .jobStatus ==
                                                "Applied")
                                              InkWell(
                                                onTap: () {},
                                                child: ImageIcon(
                                                  AssetImage(
                                                      "assets/images/ic_tick.png"),
                                                  size: 25,
                                                  color: Colors.black,
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
                                            //   reqJobListThree[index].startDateTime ?? "",
                                            //   style: TextStyle(
                                            //     fontWeight: kFontWeight_M,
                                            //     fontSize: 13,
                                            //     color: Colors.white,
                                            //   ),
                                            // ),
                                            Spacer(),
                                            Text(
                                              '£ ${reqJobListThree[index].hourlyRate ?? ""}/hour',
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
                                                color: Colors.white
                                                    .withOpacity(0.15),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 2),
                                                      child: ImageIcon(
                                                        AssetImage(
                                                            "assets/images/ic_alarm.png"),
                                                        size: 15,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 60,
                                                      child: Text(
                                                        reqJobListThree[index]
                                                                .shiftName ??
                                                            "",
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                          fontSize: 11,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
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
                                                color: Colors.white
                                                    .withOpacity(0.15),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 2),
                                                      child: ImageIcon(
                                                        AssetImage(
                                                            "assets/images/ic_location.png"),
                                                        size: 15,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 60,
                                                      child: Text(
                                                        reqJobListThree[index]
                                                                .jobLocation ??
                                                            "",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 11),
                                                      ),
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
                                                  reqJobListThree[index]
                                                          .startDateTime ??
                                                      "",
                                                  style: TextStyle(
                                                    fontWeight: kFontWeight_M,
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
                              if (reqJobListThree[index].isRequsted == 1)
                                Image(
                                    image: AssetImage(
                                        "assets/images/redlabel_tail.png")),
                            ],
                          ),
                          if (reqJobListThree[index].isRequsted == 1)
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
                                              fontWeight: kFontWeight_M),
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
              )
            : Center(
                child: Container(
                  child: Text("No Jobs Available"),
                ),
              ),
      ],
    );
  }

  @override
  bool isAuthenticationRequired() {
    // TODO: implement isAuthenticationRequired
    throw UnimplementedError();
  }
}
