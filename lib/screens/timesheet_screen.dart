import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_d2d/screens/home_detail_screen.dart';
import 'package:signature/signature.dart';

class TimeSheetScreen extends StatefulWidget {
  const TimeSheetScreen({super.key});

  @override
  State<TimeSheetScreen> createState() => _TimeSheetScreenState();
}

class _TimeSheetScreenState extends State<TimeSheetScreen> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.red,
    exportBackgroundColor: Colors.blue,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                                  image: AssetImage("assets/images/care.png"),
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
                                  Radius.circular(5),
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
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '🗓 15 NOV 2022',
                            style: TextStyle(
                              color: Colors.white,
                            ),
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
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Row(
                children: [
                  Text(
                    "Time Sheet",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            DataTable(
              headingRowColor: MaterialStateColor.resolveWith(
                  (states) => Colors.redAccent.shade100.withOpacity(0.5)),
              horizontalMargin: 5,
              headingRowHeight: 50,
              columnSpacing: 20,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              columns: [
                DataColumn(
                    label: SizedBox(
                        width: 50,
                        child: Text('Date', style: TextStyle(fontSize: 12)))),
                DataColumn(
                    label: SizedBox(
                        width: 60,
                        child: Text('Start Time',
                            style: TextStyle(fontSize: 12)))),
                DataColumn(
                    label: SizedBox(
                        width: 60,
                        child: Text('Finish Time',
                            style: TextStyle(fontSize: 12)))),
                DataColumn(
                    label: SizedBox(
                        width: 50,
                        child: Text('Break', style: TextStyle(fontSize: 12)))),
                DataColumn(
                    label: SizedBox(
                        width: 50,
                        child: Text('Status', style: TextStyle(fontSize: 12)))),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(
                        SizedBox(width: 50, child: Text('Sunday 15 Oct 2022'))),
                    DataCell(SizedBox(width: 40, child: Text('10:00'))),
                    DataCell(SizedBox(width: 40, child: Text('10:00'))),
                    DataCell(SizedBox(
                        width: 50, child: Text('10:00' + ' - ' + '10:30'))),
                    DataCell(
                      Container(
                        height: 25,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.green,
                        ),
                        child: TextButton(
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             FeaturedProductsScreen()));
                          },
                          child: Text(
                            'Approved',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(
                        SizedBox(width: 50, child: Text('Sunday 15 Oct 2022'))),
                    DataCell(SizedBox(width: 40, child: Text('10:00'))),
                    DataCell(SizedBox(width: 40, child: Text('10:00'))),
                    DataCell(SizedBox(
                        width: 50, child: Text('10:00' + ' - ' + '10:30'))),
                    DataCell(
                      Container(
                        height: 25,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.red,
                        ),
                        child: TextButton(
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             FeaturedProductsScreen()));
                          },
                          child: Text(
                            'Approved',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(
                        SizedBox(width: 50, child: Text('Sunday 15 Oct 2022'))),
                    DataCell(SizedBox(width: 40, child: Text('10:00'))),
                    DataCell(SizedBox(width: 40, child: Text('10:00'))),
                    DataCell(SizedBox(
                        width: 50, child: Text('10:00' + ' - ' + '10:30'))),
                    DataCell(
                      Container(
                        height: 25,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.red,
                        ),
                        child: TextButton(
                          onPressed: () {
                            showModalBottomSheet(
                                // isScrollControlled: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 10),
                                    child: SingleChildScrollView(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Time Sheet",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.cases_rounded),
                                                Text(
                                                  "Theatre Practioner",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "Agate House",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.calendar_today),
                                                Text(
                                                  "Sunday",
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Icon(Icons.alarm_add_outlined),
                                                Text(
                                                  "Start Time  7:30",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                                Icon(Icons.alarm_add_outlined),
                                                Text(
                                                  "Finish Time  7:30",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                                Icon(Icons.alarm_add_outlined),
                                                Text(
                                                  "Break Time  7:30",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.edit),
                                                Text(
                                                  "Sign Here",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  height: 150,
                                                  width: 300,
                                                  child: TextField(
                                                    textAlign: TextAlign.left,
                                                    enabled: true,
                                                    maxLines: 5,
                                                    // controller: _instructionController,
                                                    decoration: InputDecoration(
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 15,
                                                                horizontal: 15),
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .grey
                                                                    .shade50))),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Signed By",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                    height: 50,
                                                    width: 300,
                                                    child: Signature(
                                                        controller: _controller)
                                                    // TextField(
                                                    //   textAlign: TextAlign.left,
                                                    //   enabled: true,
                                                    //   maxLines: 5,
                                                    //   // controller: _instructionController,
                                                    //   decoration: InputDecoration(
                                                    //       contentPadding:
                                                    //           const EdgeInsets
                                                    //                   .symmetric(
                                                    //               vertical: 15,
                                                    //               horizontal:
                                                    //                   15),
                                                    //       border: OutlineInputBorder(
                                                    //           borderRadius:
                                                    //               BorderRadius
                                                    //                   .circular(
                                                    //                       15),
                                                    //           borderSide: BorderSide(
                                                    //               color: Colors
                                                    //                   .grey
                                                    //                   .shade50))),
                                                    // ),
                                                    ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  width: 150,
                                                  height: 50,
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      // Navigator.push(
                                                      //     context,
                                                      //     MaterialPageRoute(
                                                      //         builder: (context) => JobCancelScreen()));
                                                    },
                                                    child: Text(
                                                      'Approve',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontFamily:
                                                              'Poppins'),
                                                    ),
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(Colors.red),
                                                      shape: MaterialStateProperty
                                                          .all(
                                                              RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      )),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ]),
                                    ),
                                  );
                                });
                          },
                          child: Text(
                            'Approved',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
