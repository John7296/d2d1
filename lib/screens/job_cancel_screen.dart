import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_d2d/screens/home_detail_screen.dart';
import 'package:project_d2d/screens/home_screen.dart';
import 'package:project_d2d/screens/job_cancelled_successful_screen.dart';
import 'package:project_d2d/utils/constants.dart';
import 'package:project_d2d/widgets/top_banner_widget.dart';

class JobCancelScreen extends StatefulWidget {
  const JobCancelScreen({super.key});

  @override
  State<JobCancelScreen> createState() => _JobCancelScreenState();
}

class _JobCancelScreenState extends State<JobCancelScreen> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
           TopBannerWidget(
            
           ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Card(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                          ),
                          Text("Cancel Job",
                              style:
                                  TextStyle(fontSize: kFontSize_16, color: Colors.red)),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Provide a reason for cancellation",
                        style: TextStyle(fontSize: kFontSize_16),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        textAlign: TextAlign.left,
                        enabled: true,
                        maxLines: 5,
                        // controller: _instructionController,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade50),),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          width: 150,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => JobCancelledSuccessfulScreen()));
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
}
