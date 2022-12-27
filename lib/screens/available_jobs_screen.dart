import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_d2d/screens/job_details_screen.dart';
import 'package:project_d2d/utils/constants.dart';
import 'package:project_d2d/widgets/available_job_widget.dart';


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
                          fontSize: kFontSize_16, fontWeight: kFontWeight_SB),
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
                          fontSize: kFontSize_16, fontWeight: kFontWeight_SB),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 10),
              child: InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => SearchScreen()));
                },
                child: Container(
                  height: 50,
                  width: 360,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFE5E5E5)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Container(
                          child: Icon(Icons.search_rounded,
                              size: 25, color: Color(0xFF95969D)),
                        ),
                        SizedBox(
                          child: Text(
                            "Search available jobs",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF95969D),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
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
                            height: 40,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border:
                                  Border.all(color: Colors.redAccent, width: 1),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Requested",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: kFontWeight_M),
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            height: 40,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                    color: Colors.redAccent, width: 1)),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text("Available",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: kFontWeight_M)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: AvailableJobWidgetGreen(),
                        
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: Stack(
                          clipBehavior: Clip.none,
                          fit: StackFit.loose,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                image: DecorationImage(
                                  image: AssetImage("assets/images/red_bg.png"),
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
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
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
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Dialysis specialist',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                kFontWeight_SB,
                                                            fontSize:
                                                                kFontSize_16,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Agate House',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize:
                                                                  kFontSize_14,
                                                              fontWeight:
                                                                  kFontWeight_M),
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
                                                        Icons
                                                            .edit_note_outlined,
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
                                              color:
                                                  Colors.white.withOpacity(0.1),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15),
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
                                              color:
                                                  Colors.white.withOpacity(0.1),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
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
                                                        color: Colors.white,
                                                        fontSize: 11),
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
                            // Positioned(
                            //   top: -1.5,
                            //   left: 220,
                            //   child: Container(
                            //     height: 200,
                            //     width: 200,
                            //     decoration: BoxDecoration(
                            //       image: DecorationImage(
                            //         image: AssetImage(
                            //             "assets/images/redlabel.png"),
                            //         // fit: BoxFit.cover,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
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
