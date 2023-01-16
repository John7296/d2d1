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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getJob();
  }

  void getJob() {
    NetworkManager.shared
        .getJob(
      NetworkManager.shared.userToken!,
      "getJobsByStaffId",
      NetworkManager.shared.staffId!,
      "",
      "Upcoming",
    )
        .then((BaseResponse<List<Job>> response) {
      getJobOne();
      setState(() {
        reqJobList.clear();
        for (var element in response.data!) {
          if (element.isRequsted == 1) {
            reqJobList.add(element);
            print(element);
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
      "Active",
    )
        .then((BaseResponse<List<Job>> response) {
      setState(() {
        reqJobListOne.clear();
        for (var element in response.data!) {
          if (element.isRequsted == 1) {
            reqJobListOne.add(element);
            print(element);

            reqJobListTwo = reqJobList + reqJobListOne;
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
        (reqJobList.isNotEmpty)
            ? Expanded(
                child: ListView.builder(
                  // physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: reqJobList.length,
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
                                      reqJobList[index].jobId ?? 0);

                                  NetworkManager.shared.jobId =
                                      reqJobList[index].jobId ?? 0;

                                  NetworkManager.shared.refreshTokens();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              JobDetailsScreen(
                                                  reqJobList[index]
                                                          .jobCatName ??
                                                      '',
                                                  reqJobList[index]
                                                      .hourlyRate!
                                                      .toDouble(),
                                                  reqJobList[index]
                                                          .clientName ??
                                                      '',
                                                  reqJobList[index]
                                                          .jobLocation ??
                                                      '',
                                                  reqJobList[
                                                              index]
                                                          .startDateTime ??
                                                      '',
                                                  reqJobList[index].shiftName ??
                                                      '',
                                                  reqJobList[index].isRequsted!,
                                                  context)));
                                },
                                child: Container(
                                  width: getWidthByPercentage(92),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    image: DecorationImage(
                                      image:
                                          // (reqJobList[index].requested!)
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
                                                                  reqJobList[index]
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
                                                                reqJobList[index]
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
                                            if (reqJobList[index].jobStatus ==
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
                                            //   reqJobList[index].startDateTime ?? "",
                                            //   style: TextStyle(
                                            //     fontWeight: kFontWeight_M,
                                            //     fontSize: 13,
                                            //     color: Colors.white,
                                            //   ),
                                            // ),
                                            Spacer(),
                                            Text(
                                              '£ ${reqJobList[index].hourlyRate ?? ""}/hour',
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
                                                        reqJobList[index]
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
                                                        reqJobList[index]
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
                                                  reqJobList[index]
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
                              if (reqJobList[index].isRequsted == 1)
                                Image(
                                    image: AssetImage(
                                        "assets/images/redlabel_tail.png")),
                            ],
                          ),
                          if (reqJobList[index].isRequsted == 1)
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
