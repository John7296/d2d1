import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_d2d/connection/network_manager.dart';
import 'package:project_d2d/model/base_response.dart';
import 'package:project_d2d/model/canceljob.dart';
import 'package:project_d2d/screens/home_detail_screen.dart';
import 'package:project_d2d/screens/home_screen.dart';
import 'package:project_d2d/screens/job_cancelled_successful_screen.dart';
import 'package:project_d2d/utils/constants.dart';
import 'package:project_d2d/utils/sessions_manager.dart';
import 'package:project_d2d/widgets/top_banner_widget.dart';

class JobCancelScreen extends StatefulWidget {
  const JobCancelScreen({super.key});

  @override
  State<JobCancelScreen> createState() => _JobCancelScreenState();
}

class _JobCancelScreenState extends State<JobCancelScreen> {
  final formKey = GlobalKey<FormState>();
  final _reasonController = TextEditingController();

  void onCancelButtonTapped() {
    NetworkManager.shared.cancelJob(NetworkManager.shared.userToken!, <String, dynamic>{
      "sp": "cancelJob",
      "clientId": 13,
      "jobId": 17,
      "reason": _reasonController.text
    }).then((BaseResponse<CancelJob> response) {
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => JobCancelledSuccessfulScreen()));
    }).catchError((e) {
      // print(e.toString());
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
            TopBannerWidget(),
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
}
