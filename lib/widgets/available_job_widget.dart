import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_d2d/screens/job_details_screen.dart';
import 'package:project_d2d/utils/constants.dart';

class AvailableJobWidgetGreen extends StatefulWidget {
  const AvailableJobWidgetGreen({super.key});

  @override
  State<AvailableJobWidgetGreen> createState() =>
      _AvailableJobWidgetGreenState();
}

class _AvailableJobWidgetGreenState extends State<AvailableJobWidgetGreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.loose,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => JobDetailsScreen()));
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              image: DecorationImage(
                image: AssetImage("assets/images/green_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            height: 150,
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
                              image: AssetImage("assets/images/care.png"),
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Dialysis specialist',
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
                                        'Agate House',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: kFontSize_14,
                                            fontWeight: kFontWeight_M),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(width: 55),
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
                    // SizedBox(
                    //   height: 5,
                    // ),
                    Row(
                      children: [
                        Spacer(),
                        Text(
                          '£ 25.00/hr',
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
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                Text(
                                  'Agate-East',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 11),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          '🗓 15 Nov 2022',
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
        Positioned(
          top: -1.5,
          left: 238,
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/redlabel.png"),
                // fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
