import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_d2d/utils/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AvailableJobsScreen extends StatefulWidget {
  @override
  _AvailableJobsScreenState createState() => _AvailableJobsScreenState();
}

class _AvailableJobsScreenState extends State<AvailableJobsScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                      onPressed: () {},
                    ),
                  ),
                  height: 45,
                  width: 45,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 90),
                  child: Text("All Jobs",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 20,
                    child: Text(
                      "All Available Jobs",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 35,
                    child: TabBar(
                      unselectedLabelColor: Colors.redAccent,
                      indicatorSize: TabBarIndicatorSize.label,
                      controller: tabController,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.redAccent),
                      isScrollable: true,
                      indicatorColor: Colors.transparent,
                      tabs: [
                        Tab(
                          child: Container(
                            height: 35,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                    color: Colors.redAccent, width: 1)),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text("Requested"),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            height: 35,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                    color: Colors.redAccent, width: 1)),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text("Available"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  ListView.builder(
                    // physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Container(
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            image: DecorationImage(
                              image: AssetImage("assets/images/green_bg.png"),
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
                          // height: 200,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Container(
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
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //     color: Colors.grey,
                                        //     offset: Offset(0.0, 1.0), //(x,y)
                                        //     blurRadius: 3.0,
                                        //   ),
                                        // ],
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 1.h),
                                        child: Row(
                                          children: [
                                            Text('Dialysis specialist',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                )),
                                            SizedBox(width: 50),
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.edit,
                                                  color: Colors.white,
                                                ))
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 2.h),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Agate House',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                              ),
                                            ),
                                            SizedBox(width: 70),
                                            Text(
                                              '£ 25.00/hour',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 2.h),
                                    child: Container(
                                      height: 30,
                                      width: 100,
                                      // color: Colors.white,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(2.h),
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
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.alarm_add_outlined,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            'Full-Time',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(2),
                                    child: Container(
                                      height: 30,
                                      width: 100,
                                      // color: Colors.white,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
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
                                        padding: EdgeInsets.all(0.2.h),
                                        child: Row(children: [
                                          Icon(
                                            Icons.location_pin,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                          Text(
                                            'Agate-East',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ]),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '🗓 15 NOV 2022',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
// ==================================================================================================================================
                  ListView.builder(
                    // physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Container(
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
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
                          // height: 200,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Container(
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
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //     color: Colors.grey,
                                        //     offset: Offset(0.0, 1.0), //(x,y)
                                        //     blurRadius: 3.0,
                                        //   ),
                                        // ],
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 1.h),
                                        child: Row(
                                          children: [
                                            Text('Dialysis specialist',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                )),
                                            SizedBox(width: 50),
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.edit,
                                                  color: Colors.white,
                                                ))
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 2.h),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Agate House',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                              ),
                                            ),
                                            SizedBox(width: 70),
                                            Text(
                                              '£ 25.00/hour',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 2.h),
                                    child: Container(
                                      height: 30,
                                      width: 100,
                                      // color: Colors.white,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(2.h),
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
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.alarm_add_outlined,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            'Full-Time',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(2),
                                    child: Container(
                                      height: 30,
                                      width: 100,
                                      // color: Colors.white,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
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
                                        padding: EdgeInsets.all(0.2.h),
                                        child: Row(children: [
                                          Icon(
                                            Icons.location_pin,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                          Text(
                                            'Agate-East',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ]),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '🗓 15 NOV 2022',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
