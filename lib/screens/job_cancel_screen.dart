import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_d2d/base/base_stateful_state.dart';
import 'package:project_d2d/connection/network_manager.dart';
import 'package:project_d2d/model/base_response.dart';
import 'package:project_d2d/model/canceljob.dart';
import 'package:project_d2d/model/job_request.dart';
import 'package:project_d2d/screens/home_detail_screen.dart';
import 'package:project_d2d/screens/home_screen.dart';
import 'package:project_d2d/screens/job_cancelled_successful_screen.dart';
import 'package:project_d2d/utils/constants.dart';
import 'package:project_d2d/utils/sessions_manager.dart';
import 'package:project_d2d/widgets/top_banner_widget.dart';

class JobCancelScreen extends StatefulWidget {
  JobCancelScreen(   this.jobCatName,
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
  bool isRequested;
  BuildContext context;
  

  @override
  State<JobCancelScreen> createState() => _JobCancelScreenState();
}

class _JobCancelScreenState extends BaseStatefulState<JobCancelScreen> {
  final formKey = GlobalKey<FormState>();
  final _reasonController = TextEditingController();
  List<JobRequest> jobs = [];

  void onCancelButtonTapped() {
    NetworkManager.shared
        .cancelJob(NetworkManager.shared.userToken!, <String, dynamic>{
      "sp": "cancelJob",
      "userId": NetworkManager.shared.userId,
      "jobId": NetworkManager.shared.jobId,
      "reason": _reasonController.text
    }).then((BaseResponse<CancelJob> response) {
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => JobCancelledSuccessfulScreen()));
    }).catchError((e) {
      // print(e.toString());
      showFlashMsg(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      resizeToAvoidBottomInset: false,
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
                if (widget.isRequested)
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
           
            Padding(
              padding: const EdgeInsets.all(20),
              child: Card(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                elevation: 0.5,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ImageIcon(
                            AssetImage("assets/images/ic_delete.png"),
                            size: 20,
                            color: Colors.red,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text("Cancel Job",
                                style: TextStyle(
                                    fontSize: kFontSize_16, color: Colors.red)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Provide a reason for cancellation",
                        style: TextStyle(fontSize: kFontSize_16),
                      ),
                      const SizedBox(height: 10),
                      Form(
                        key: formKey,
                        child: Container(
                          height: 150,
                          child: TextFormField(
                            // decoration: InputDecoration(
                            //     border: OutlineInputBorder(),
                            //     contentPadding: EdgeInsets.all(5)
                            //     // labelText: 'Mobile'
                            //     ),
                            decoration: InputDecoration(
                              hintText: 'Enter Reason',
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 25.0, horizontal: 10.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            controller: _reasonController,
                            validator: (value) {
                              if (value!.isEmpty) return "Enter Valid Reason";
                              return null;
                            },
                          ),
                        ),

                        // TextField(
                        //   textAlign: TextAlign.left,
                        //   enabled: true,
                        //   maxLines: 5,
                        //   controller: _reasonController,

                        //   decoration: InputDecoration(
                        //     contentPadding: const EdgeInsets.symmetric(
                        //         vertical: 15, horizontal: 15),
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(15),
                        //       borderSide:
                        //           BorderSide(color: Colors.grey.shade50),
                        //     ),

                        //     hintText: "Enter Reason",
                        //     hintStyle: TextStyle(color: Colors.grey),
                        //   ),
                        // ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          // width: 150,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                onCancelButtonTapped();

                                Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return JobCancelledSuccessfulScreen();
                                  },
                                ), (route) => false);
                              }
                            },
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                fontSize: kFontSize_16,
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(kButtonColorR),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
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
