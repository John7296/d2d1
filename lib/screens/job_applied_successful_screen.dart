import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_d2d/screens/home_detail_screen.dart';
import 'package:project_d2d/screens/home_screen.dart';
import 'package:project_d2d/utils/constants.dart';
import 'package:project_d2d/widgets/top_banner_widget.dart';

class JobAppliedSuccessfulScreen extends StatefulWidget {
   JobAppliedSuccessfulScreen(this.jobCatName, this.clientName, this.shiftName,
      this.startDateTime, this.jobLocation, this.context);
     String jobCatName;
  String clientName;
  String jobLocation;

  // double hourlyRate;
  String startDateTime;
  String shiftName;
  BuildContext context;


  @override
  State<JobAppliedSuccessfulScreen> createState() =>
      _JobAppliedSuccessfulScreenState();
}

class _JobAppliedSuccessfulScreenState
    extends State<JobAppliedSuccessfulScreen> {

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
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(0),
                    ),
                    image: DecorationImage(
                      image: AssetImage("assets/images/red_bg.png"),
                      fit: BoxFit.cover,
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
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        //  mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: IconButton(
                                    icon: Icon(Icons.arrow_back_ios,
                                        color: Colors.white),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomeScreen()),
                                      );
                                    },
                                  ),
                                ),
                                height: 40,
                                width: 40,
                              ),
                              SizedBox(
                                height: 150,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(40),
                                  ),
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/care.png"),
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
                              SizedBox(height: 20),
                              Container(
                                height: 30,
                                // width: 100,
                                // color: Colors.white,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  color: Colors.white.withOpacity(0.1),

                                  // boxShadow: [
                                  //   BoxShadow(
                                  //     color: Colors.grey,
                                  //     offset: Offset(0.0, 1.0), //(x,y)
                                  //     blurRadius: 3.0,
                                  //   ),
                                  // ],
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
                                        widget.shiftName,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 11),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '',
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
                                  widget.jobLocation,
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
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 30,
                      width: 72,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15)),
                        color: kButtonColorR,

                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.grey,
                        //     offset: Offset(0.0, 1.0), //(x,y)
                        //     blurRadius: 3.0,
                        //   ),
                        // ],
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Requested',
                            style: TextStyle(color: Colors.white, fontSize: 11),
                          ),
                        ),
                      ),
                    ),
                  ),
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
                  image: AssetImage("assets/images/job_applied_successful.png"),
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
                    "Your Job Application has been submitted successfully",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              // width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));

                  // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                  //   builder: (BuildContext context) {
                  //     return HomeScreen();
                  //   },
                  // ), (route) => false);
                },
                child: Text(
                  'Back to Dashboard',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kButtonColorR),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
