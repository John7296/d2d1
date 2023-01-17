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

class SliderBannerHomeWidget extends StatefulWidget {
  const SliderBannerHomeWidget({super.key});

  @override
  State<SliderBannerHomeWidget> createState() => _SliderBannerHomeWidgetState();
}

class _SliderBannerHomeWidgetState
    extends BaseWidgetStatefulState<SliderBannerHomeWidget> {
  List<Job> jobList = [];
  List<Job> jobListTwo = [];
  List<Job> jobListThree = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getJobDetails();
  }

  void getJobDetails() {
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
        jobList.clear();
        jobList.addAll(response.data!);
        getJobDetailsTwo();
      });
    }).catchError((e) {
      print(e.toString());
    });
  }

  void getJobDetailsTwo() {
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
        jobListTwo.clear();
        jobListTwo.addAll(response.data!);
        jobListThree = jobList + jobListTwo;
      });
    }).catchError((e) {
      print(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Padding(
        padding: const EdgeInsets.only(right: 2),
        child: (jobListThree.isNotEmpty)
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: jobListThree.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                SessionsManager.saveJobId(
                                    jobListThree[index].jobId ?? 0);

                                NetworkManager.shared.jobId =
                                    jobListThree[index].jobId ?? 0;

                                NetworkManager.shared.refreshTokens();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => JobDetailsScreen(
                                        jobListThree[index].jobCatName ?? '',
                                        jobListThree[index].hourlyRate ?? 0,
                                        jobListThree[index].clientName ?? '',
                                        jobListThree[index].jobLocation ?? '',
                                        jobListThree[index].startDateTime ?? '',
                                        jobListThree[index].shiftName ?? '',
                                        jobListThree[index].isRequsted!,
                                        jobListThree[index].jobNumber??'',
                                        context),
                                  ),
                                );
                              },
                              child: Container(
                                
                                width: getWidthByPercentage(80),
                                decoration: BoxDecoration(
                                
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                  border: Border.all(
                                      color: (jobListThree[index].jobStatus ==
                                              "Applied")
                                          ? Colors.black12
                                          : Colors.transparent,
                                      width: 3),
                                          //  boxShadow: [
                                                // BoxShadow(
                                                  // color: Colors.black ,
                                                  // offset: Offset(0.0, 2.0), //(x,y)
                                                  // blurRadius: 3.0,
                                                // ),
                                              // ],

                                  // Color(0xff2DAC60)

                                  image: DecorationImage(
                                    image: (jobListThree[index].isRequsted == 1)
                                        ? AssetImage(
                                            "assets/images/green_bg.png")
                                        : AssetImage(
                                            "assets/images/red_bg.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                // height: 200,
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
                                                                jobListThree[
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
                                                            if (jobListThree[
                                                                        index]
                                                                    .jobStatus ==
                                                                "Applied")
                                                              InkWell(
                                                                onTap: () {},
                                                                child:
                                                                    ImageIcon(
                                                                  AssetImage(
                                                                      "assets/images/ic_tick.png"),
                                                                  size: 25,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              jobListThree[
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
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
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
                                                      jobListThree[index]
                                                              .shiftName ??
                                                          "",
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontSize: 11,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10),
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
                                                      jobListThree[index]
                                                              .jobLocation ??
                                                          "",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_today_outlined,
                                            color: Colors.white,
                                            size: 14,
                                          ),
                                          SizedBox(width: 2),
                                          Text(
                                            jobListThree[index].startDateTime ??
                                                "",
                                            style: TextStyle(
                                              fontWeight: kFontWeight_M,
                                              fontSize: 13,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            '£ ${jobListThree[index].hourlyRate ?? ""}/hour',
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
                                ),
                              ),
                            ),
                            if (jobListThree[index].isRequsted == 1)
                              Image(
                                  image: AssetImage(
                                      "assets/images/redlabel_tail.png")),
                          ],
                        ),
                        if (jobListThree[index].isRequsted == 1)
                          Positioned(
                            top: 65,
                            right: 0,
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
              )
            : Center(child: Text("No Available Jobs")),
      ),
    );
  }

  @override
  bool isAuthenticationRequired() {
    // TODO: implement isAuthenticationRequired
    throw UnimplementedError();
  }
}
