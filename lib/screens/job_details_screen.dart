import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_d2d/screens/job_applied_successful_screen.dart';
import 'package:project_d2d/screens/job_cancel_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class JobDetailsScreen extends StatefulWidget {
  @override
  _JobDetailsScreenState createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
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
                  child: Expanded(
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
                                      icon: Icon(Icons.arrow_back_ios,
                                          color: Colors.white),
                                      onPressed: () {},
                                    ),
                                  ),
                                  height: 45,
                                  width: 45,
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
                                      image: AssetImage(
                                          "assets/images/care.png"),
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
                                ),
                                Text(
                                  'Theatre Practitioner',
                                  style: TextStyle(
                                      fontSize: 20,
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
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 120,
                                ),
                                Container(
                                  height: 30,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        bottomLeft: Radius.circular(15)),
                                    color: Colors.red,

                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color: Colors.grey,
                                    //     offset: Offset(0.0, 1.0), //(x,y)
                                    //     blurRadius: 3.0,
                                    //   ),
                                    // ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Requested",
                                      style: TextStyle(color: Colors.white),
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
                                    color: Colors.white,  ),
                              ),
                              Text(
                                '🗓 15 NOV 2022',
                                style: TextStyle(
                                    color: Colors.white,  ),
                              ),
                              Text(
                                'Agate House',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                     ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50,
                    // width: MediaQuery.of(context).size.width,
                    child: TabBar(
                      unselectedLabelColor: Colors.grey,
                      controller: tabController,
                      isScrollable: true,
                      indicatorColor: Colors.black,
                      tabs: [
                        Tab(
                          child: SizedBox(
                            width: 70,
                            child: Center(
                              child: Text(
                                "Description",
                                style: TextStyle(
                                     
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: SizedBox(
                            width: 70,
                            child: Center(
                              child: Text(
                                "Location",
                                style: TextStyle(
                                     
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: SizedBox(
                            width: 70,
                            child: Center(
                              child: Text(
                                "Rates",
                                style: TextStyle(
                                     
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: SizedBox(
                            width: 70,
                            child: Center(
                              child: Text(
                                "Info",
                                style: TextStyle(
                                     
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
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
                  SingleChildScrollView(
                      child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        child: Text(
                          "The Dropdown widget in Flutter is one of the most used widgets. It allows users to select an item from the list of options—for example, gender selection. And the DropdownButtonFormField widget is a convenience widget that wraps the Dropdown widget and allows you to change the visual aesthetic and add validations on the dropdown button. So in this tutorial, we will see how to add and customize the Dropdown or DropdownButtonFormField border in Flutter.The Dropdown widget in Flutter is one of the most used widgets. It allows users to select an item from the list of options—for example, gender selection. And the DropdownButtonFormField widget is a convenience widget that wraps the Dropdown widget and allows you to change the visual aesthetic and add validations on the dropdown button. So in this tutorial, we will see how to add and customize the Dropdown or DropdownButtonFormField border in Flutter.The Dropdown widget in Flutter is one of the most used widgets. It allows users to select an item from the list of options—for example, gender selection. And the DropdownButtonFormField widget is a convenience widget that wraps the Dropdown widget and allows you to change the visual aesthetic and add validations on the dropdown button. So in this tutorial, we will see how to add and customize the Dropdown or DropdownButtonFormField border in Flutter.The Dropdown widget in Flutter is one of the most used widgets. It allows users to select an item from the list of options—for example, gender selection. And the DropdownButtonFormField widget is a convenience widget that wraps the Dropdown widget and allows you to change the visual aesthetic and add validations on the dropdown button. So in this tutorial, we will see how to add and customize the Dropdown or DropdownButtonFormField border in Flutter.",
                          style: TextStyle( ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 150,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              JobAppliedSuccessfulScreen()));
                                },
                                child: Text(
                                  'Apply',
                                  style: TextStyle(
                                      fontSize: 20,  ),
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.green),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  )),
                                ),
                              ),
                            ),
                            Container(
                              width: 150,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              JobCancelScreen()));
                                },
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                      fontSize: 20,  ),
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.red),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
// ==================================================================================================================================
                  Container(
                    color: Colors.yellow,
                  ),
// ==================================================================================================================================
                  Container(
                    color: Colors.blue,
                  ),
// ==================================================================================================================================
                  Container(
                    color: Colors.orange,
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
