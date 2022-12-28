import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_d2d/model/active_job_model.dart';
import 'package:project_d2d/screens/job_details_screen.dart';
import 'package:project_d2d/utils/constants.dart';

class SliderBannerHome extends StatefulWidget {
  const SliderBannerHome({super.key});

  @override
  State<SliderBannerHome> createState() => _SliderBannerHomeState();
}

class _SliderBannerHomeState extends State<SliderBannerHome> {
  List<StaffDetails> staffDetails = [
    StaffDetails(
        staffName: 'Catherine',
        jobName: 'Dialysis Specialyst',
        jobLocation: 'London',
        shiftType: 'Sunday',
        startDate: '10-Nov-2022',
        requested: true,
        hourlyRate: 30),
    StaffDetails(
        staffName: 'Mary',
        jobName: 'General Nurse',
        jobLocation: 'Agate East',
        shiftType: 'Full-Time',
        startDate: '15-DEC-2022',
        requested: false,
        hourlyRate: 30),
    StaffDetails(
        staffName: 'Sara',
        jobName: 'Dialysis Specialyst',
        jobLocation: 'Coventry',
        shiftType: 'Saturday',
        requested: true,
        startDate: '12-Jan-2023',
        hourlyRate: 30),
    StaffDetails(
        staffName: 'Sandra',
        jobName: 'General Nurse',
        jobLocation: 'Agate East',
        shiftType: 'Full-Time',
        startDate: '15-DEC-2022',
        requested: false,
        hourlyRate: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: staffDetails.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 20),
            child: Stack(
              clipBehavior: Clip.none,
              fit: StackFit.loose,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => JobDetailsScreen()));
                  },
                  child: Container(
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      image: DecorationImage(
                        image: (staffDetails[index].requested!)
                            ? AssetImage("assets/images/green_bg.png")
                            : AssetImage("assets/images/red_bg.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        // color: Colors.grey,
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
                                      image:
                                          AssetImage("assets/images/care.png"),
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
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                staffDetails[index].jobName ??
                                                    '',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: kFontWeight_SB,
                                                  fontSize: kFontSize_16,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                staffDetails[index].staffName ??
                                                    '',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: kFontSize_14,
                                                    fontWeight: kFontWeight_M),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.edit_note_outlined,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 100,
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
                                          staffDetails[index].shiftType ?? '',
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  height: 30,
                                  width: 100,
                                  // color: Colors.white,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    color: Colors.white.withOpacity(0.1),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.location_pin,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                        Text(
                                          staffDetails[index].jobLocation ?? '',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11),
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
                                Text(
                                  '🗓 ${staffDetails[index].startDate ?? ""}',
                                  style: TextStyle(
                                    fontWeight: kFontWeight_M,
                                    fontSize: 13,
                                    color: Colors.white,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  '£ ${staffDetails[index].hourlyRate}/hour',
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
                ),
                (staffDetails[index].requested!)
                    ? Positioned(
                        top: -25,
                        left: 167,
                        child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/redlabel.png"),
                              // fit: BoxFit.cover,
                            ),
                          ),
                          child: Align(
                              child: Text(
                            "Requested",
                            style: TextStyle(
                                fontSize: 8,
                                color: Colors.white,
                                fontWeight: kFontWeight_M),
                          )),
                        ),
                      )
                    : SizedBox(),
              ],
            ),
          );
        },
      ),
    );
  }
}
