import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_d2d/screens/available_jobs_screen.dart';
import 'package:project_d2d/screens/job_details_screen.dart';
import 'package:project_d2d/screens/profile_screen.dart';
import 'package:project_d2d/screens/timesheet_screen.dart';
import 'package:project_d2d/utils/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeDetailScreen extends StatefulWidget {
  const HomeDetailScreen({super.key});

  @override
  State<HomeDetailScreen> createState() => _HomeDetailScreenState();
}

class _HomeDetailScreenState extends State<HomeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              // color: Colors.grey.shade100,
              height: 140,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Welcome Back!',
                                      style: TextStyle(
                                          fontFamily: kFontFamily,
                                          fontWeight: kFontWeight_M,
                                          fontSize: kFontSize_14,
                                          color: Color(0xFF95969D)),
                                    ),
                                    Text(
                                      'Mary James 👋 ',
                                      style: TextStyle(
                                          fontFamily: kFontFamily,
                                          fontSize: 22,
                                          fontWeight: kFontWeight_M,
                                          color: Color(0xFFFD425B)),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 125),
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 20),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ProfileScreen(),
                                            ),
                                          );
                                        },
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/profile.png'),
                                          radius: 25,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 5),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AvailableJobsScreen()));
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Active Jobs",
                            style: TextStyle(
                              fontSize: kFontSize_16,
                              fontWeight: kFontWeight_SB,
                            ),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             FeaturedProductsScreen()));
                            },
                            child: Text(
                              'See all ',
                              style: TextStyle(
                                color: Color(0xFF95969D),
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 160,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
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
                                            builder: (context) =>
                                                JobDetailsScreen()));
                                  },
                                  child: Container(
                                    width: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30),
                                      ),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/green_bg.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    // height: 200,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        width:
                                            MediaQuery.of(context).size.width,
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
                                                    borderRadius:
                                                        BorderRadius.all(
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
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
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
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
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
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        kFontSize_14,
                                                                    fontWeight:
                                                                        kFontWeight_M),
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
                                                              Icons
                                                                  .edit_note_outlined,
                                                              color:
                                                                  Colors.white,
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
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(2.h),
                                                    ),
                                                    color: Colors.white
                                                        .withOpacity(0.1),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 15),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .alarm_add_outlined,
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
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(15),
                                                    ),
                                                    color: Colors.white
                                                        .withOpacity(0.1),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
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
                                                              color:
                                                                  Colors.white,
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
                                                  '🗓 15 Nov 2022',
                                                  style: TextStyle(
                                                    fontWeight: kFontWeight_M,
                                                    fontSize: 13,
                                                    color: Colors.white,
                                                  ),
                                                ),
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
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: -25,
                                  left: 167,
                                  child: Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/redlabel.png"),
                                        // fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Timesheets",
                            style: TextStyle(
                              fontSize: kFontSize_16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TimeSheetScreen()));
                            },
                            child: Text(
                              'See all ',
                              style: TextStyle(
                                color: Color(0xFF95969D),
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 120,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              // color: Colors.redAccent,
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.pink.shade300,
                                    Colors.pink.shade100
                                  ]),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(25, 5, 15, 5),
                                      child: Image.asset(
                                        'assets/images/time.png',
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    color: Colors.redAccent,
                                  ),
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(25),
                                      ),
                                      color: Colors.redAccent,
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(3),
                                        child: Text(
                                          '78',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: kFontWeight_SB,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  "Pending",
                                  style: TextStyle(
                                      fontSize: 12, fontWeight: kFontWeight_M),
                                ),
                                Text(
                                  "current job",
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 120,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              // color: Colors.redAccent,
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.green,
                                    Colors.green.shade100
                                  ]),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(25, 5, 15, 5),
                                      child: Image.asset(
                                        'assets/images/time.png',
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                      color: Colors.redAccent,
                                    ),
                                    child: Center(
                                        child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: Text(
                                        '78',
                                        style: TextStyle(
                                          fontWeight: kFontWeight_SB,
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ))),
                                Text(
                                  "Approved",
                                  style: TextStyle(
                                      fontSize: 12, fontWeight: kFontWeight_M),
                                ),
                                Text(
                                  "current job",
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 120,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              // color: Colors.redAccent,
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.yellow,
                                    Colors.yellow.shade100
                                  ]),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(25, 5, 15, 5),
                                      child: Image.asset(
                                        'assets/images/time.png',
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    color: Colors.redAccent,
                                  ),
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                      color: Colors.redAccent,
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: Text(
                                          '78',
                                          style: TextStyle(
                                            fontWeight: kFontWeight_SB,
                                            color: Colors.white,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  "Completed",
                                  style: TextStyle(
                                      fontSize: 12, fontWeight: kFontWeight_M),
                                ),
                                Text(
                                  "current job",
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Alerts",
                            style: TextStyle(
                              fontSize: kFontSize_16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             FeaturedProductsScreen()));
                            },
                            child: Text(
                              '',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 20),
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: Radius.circular(20),
                        dashPattern: [10, 10],
                        color: Colors.blueGrey,
                        strokeWidth: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Card(
                                child: ClipPath(
                                  child: Container(
                                    height: 40,
                                    width: 350,
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.redAccent, width: 5),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Gen Nurse Certificate',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: kFontWeight_M,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          'Exp on:15 Jul 2023',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: kFontWeight_M,
                                            color: Colors.red,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  clipper: ShapeBorderClipper(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(3))),
                                ),
                              ),
                              Card(
                                child: ClipPath(
                                  child: Container(
                                    height: 40,
                                    width: 350,
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.greenAccent,
                                            width: 5),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          '13 jobs cancelled so far',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: kFontWeight_M,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          '',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 10,
                                              fontWeight: kFontWeight_M),
                                        )
                                      ],
                                    ),
                                  ),
                                  clipper: ShapeBorderClipper(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(3))),
                                ),
                              ),
                              Card(
                                child: ClipPath(
                                  child: Container(
                                    height: 40,
                                    width: 350,
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.greenAccent,
                                            width: 5),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          'You have got a 5 star rating',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: kFontWeight_M,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          'Agoda house',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 10,
                                              fontWeight: kFontWeight_M),
                                        )
                                      ],
                                    ),
                                  ),
                                  clipper: ShapeBorderClipper(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(3))),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
