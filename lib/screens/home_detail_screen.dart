import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
                                          fontSize: 15,
                                          color: Colors.grey.shade600),
                                    ),
                                    Text(
                                      'Mary James 👋 ',
                                      style: TextStyle(
                                        fontFamily: kFontFamily,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 90),
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 20),
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage(
                                            'assets/images/profile.png'),
                                        radius: 30,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 5),
                            InkWell(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => SearchScreen()));
                              },
                              child: Container(
                                height: 50,
                                width: 350,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade300),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Icon(Icons.search_rounded,
                                            size: 25,
                                            color: Colors.grey.shade700),
                                      ),
                                      SizedBox(
                                        child: Text(
                                          "Search available jobs",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey.shade700,
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
                              fontSize: 20,
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
                              'See all ',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 160,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        // shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Container(
                              width: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/green_bg.png"),
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
                                              // crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Dialysis specialist',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16,
                                                    )),
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons.add_task_rounded,
                                                      color: Colors.white,
                                                    ))
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 2.h),
                                            child: Text(
                                              'Agate House',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                              ),
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
                                            color:
                                                Colors.white.withOpacity(0.1),

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
                                        width: 20,
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
                                            color:
                                                Colors.white.withOpacity(0.1),
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
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.location_pin,
                                                  color: Colors.white,
                                                  size: 20,
                                                ),
                                                Text(
                                                  'Agate-East',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20, top: 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          '🗓 15 NOV 2022',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 80,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '£ 25.00/hr',
                                              style: TextStyle(
                                                color: Colors.white,
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
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Timesheets",
                            style: TextStyle(
                              fontSize: 20,
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
                              'See all ',
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
                      padding: EdgeInsets.only(left: 5),
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
                                    child: Center(
                                        child: Text(
                                      '78',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ))),
                                Text(
                                  "Pending",
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
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
                                        child: Text(
                                      '78',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ))),
                                Text(
                                  "Pending",
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
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
                                    child: Center(
                                        child: Text(
                                      '78',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ))),
                                Text(
                                  "Pending",
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
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
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Alerts",
                            style: TextStyle(
                              fontSize: 20,
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
                                    height: 50,
                                    width: 350,
                                    padding: EdgeInsets.all(16),
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
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          'Exp on:15 Jul 2023',
                                          style: TextStyle(
                                            fontSize: 12,
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
                                    height: 50,
                                    width: 350,
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.redAccent, width: 5),
                                      ),
                                    ),
                                    child: Text(
                                      '13 jobs cancelled so far',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
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
                                    height: 50,
                                    width: 350,
                                    padding: EdgeInsets.all(16),
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
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          'Agoda house',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 12),
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
