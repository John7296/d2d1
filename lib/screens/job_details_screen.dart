import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_d2d/screens/job_applied_successful_screen.dart';
import 'package:project_d2d/screens/job_cancel_screen.dart';
import 'package:project_d2d/utils/constants.dart';
import 'package:project_d2d/widgets/top_banner_widget.dart';

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
                TopBannerWidget(
                 
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TabBar(
                  unselectedLabelColor: Colors.grey,
                  controller: tabController,
                  isScrollable: true,
                  indicatorColor: Colors.black,
                  tabs: [
                    Tab(
                      child: Center(
                        child: Text(
                          "Description",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: kFontWeight_M),
                        ),
                      ),
                    ),
                    Tab(
                      child: Center(
                        child: Text(
                          "Location",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: kFontWeight_M),
                        ),
                      ),
                    ),
                    Tab(
                      child: Center(
                        child: Text(
                          "Rates",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: kFontWeight_M),
                        ),
                      ),
                    ),
                    Tab(
                      child: Center(
                        child: Text(
                          "Info",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: kFontWeight_M),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            "The Dropdown widget in Flutter is one of the most used widgets. It allows users to select an item from the list of options—for example, gender selection. And the DropdownButtonFormField widget is a convenience widget that wraps the Dropdown widget and allows you to change the visual aesthetic and add validations on the dropdown button. So in this tutorial, we will see how to add and customize the Dropdown or DropdownButtonFormField border in Flutter.The Dropdown widget in Flutter is one of the most used widgets. It allows users to select an item from the list of options—for example, gender selection. And the DropdownButtonFormField widget is a convenience widget that wraps the Dropdown widget and allows you to change the visual aesthetic and add validations on the dropdown button. So in this tutorial, we will see how to add and customize the Dropdown or DropdownButtonFormField border in Flutter.The Dropdown widget in Flutter is one of the most used widgets. It allows users to select an item from the list of options—for example, gender selection. And the DropdownButtonFormField widget is a convenience widget that wraps the Dropdown widget and allows you to change the visual aesthetic and add validations on the dropdown button. So in this tutorial, we will see how to add and customize the Dropdown or DropdownButtonFormField border in Flutter.The Dropdown widget in Flutter is one of the most used widgets. It allows users to select an item from the list of options—for example, gender selection. And the DropdownButtonFormField widget is a convenience widget that wraps the Dropdown widget and allows you to change the visual aesthetic and add validations on the dropdown button. So in this tutorial, we will see how to add and customize the Dropdown or DropdownButtonFormField border in Flutter.",
                            style: TextStyle(),
                          ),
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
                                      fontSize: kFontSize_16,
                                      fontWeight: kFontWeight_M),
                                ),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xff12831D)),
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
                                      fontSize: kFontSize_16,
                                      fontWeight: kFontWeight_M),
                                ),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xffF41937)),
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
                  ),
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
