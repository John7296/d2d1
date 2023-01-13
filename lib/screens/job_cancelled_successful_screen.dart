import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_d2d/base/base_stateful_state.dart';
import 'package:project_d2d/screens/home_screen.dart';
import 'package:project_d2d/utils/constants.dart';
import 'package:project_d2d/widgets/top_banner_widget.dart';

class JobCancelledSuccessfulScreen extends StatefulWidget {

  
   JobCancelledSuccessfulScreen(   this.jobCatName,
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
  State<JobCancelledSuccessfulScreen> createState() =>
      _JobCancelledSuccessfulScreenState();
}

class _JobCancelledSuccessfulScreenState
    extends BaseStatefulState<JobCancelledSuccessfulScreen> {
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
           
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(0),
                ),
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage("assets/images/job_cancelled.png"),
                  fit: BoxFit.contain,
                ),
                // color: Colors.green.shade400,
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.grey,
                //     offset: Offset(0.0, 1.0), //(x,y)
                //     blurRadius: 3.0,
                //   ),
                // ],
              ),
            ),
            Container(
              // color: Colors.white,
              width: 200,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Your Job Application has been cancelled",
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Container(
                // width: 250,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    //   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    //   builder: (BuildContext context) {
                    //     return HomeScreen();
                    //   },
                    // ), (route) => false);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Text(
                    'Back to Dashboard',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kButtonColorR),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
                  ),
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
