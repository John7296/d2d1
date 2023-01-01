import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_d2d/base/base_stateful_state.dart';
import 'package:project_d2d/connection/network_manager.dart';
import 'package:project_d2d/model/active_job.dart';
import 'package:project_d2d/model/base_response.dart';
import 'package:project_d2d/model/jobdetails.dart';
import 'package:project_d2d/utils/constants.dart';

class TopBannerWidget extends StatefulWidget {
  TopBannerWidget({
    super.key,
  });

  @override
  State<TopBannerWidget> createState() => _TopBannerWidgetState();
}

class _TopBannerWidgetState extends BaseStatefulState<TopBannerWidget> {

   List<JobDetails> jobDetailsList = [];

    void getJobDetails() {
      // showLoader();
      NetworkManager.shared
          .getJobDetails(
        "TKN3533328453",
        "getJobDetailsByJobIdStaff",
        13,
        2,
      )
          .then((BaseResponse<List<JobDetails>> response) {
        // hideLoader();
        setState(() {
          jobDetailsList.clear();
          jobDetailsList.addAll(response.data!);
        });
      }).catchError((e) {
        // hideLoader();
        print(e.toString());
      });
    }



  @override
  Widget build(BuildContext context) {
    return Stack(
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
                            icon:
                                Icon(Icons.arrow_back_ios, color: Colors.white),
                            onPressed: () {
                              Navigator.pop(context);
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
                        'Theatre Practitioner',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: kFontWeight_M,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Agate House',
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
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Icon(
                                Icons.alarm_add_outlined,
                                color: Colors.white,
                                size: 15,
                              ),
                              Text(
                                'Full-Time',
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
                      '£ 25.00/hour',
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
                          "15 Nov 2022",
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
                          'Agate House',
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
    );
  
  }

  @override
  bool isAuthenticationRequired() {
    // TODO: implement isAuthenticationRequired
    throw UnimplementedError();
  }
}
