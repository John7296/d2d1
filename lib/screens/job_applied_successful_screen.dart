import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_d2d/screens/home_detail_screen.dart';
import 'package:project_d2d/screens/home_screen.dart';
import 'package:project_d2d/utils/constants.dart';
import 'package:project_d2d/widgets/top_banner_widget.dart';

class JobAppliedSuccessfulScreen extends StatefulWidget {
  const JobAppliedSuccessfulScreen({super.key});

  @override
  State<JobAppliedSuccessfulScreen> createState() =>
      _JobAppliedSuccessfulScreenState();
}

class _JobAppliedSuccessfulScreenState
    extends State<JobAppliedSuccessfulScreen> {
      String? requestedText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopBannerWidget(
              
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
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Container(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                      builder: (BuildContext context) {
                        return HomeScreen();
                      },
                    ), (route) => false);
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
            ),
          ],
        ),
      ),
    );
  }
}
