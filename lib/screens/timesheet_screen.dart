import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_d2d/screens/home_detail_screen.dart';
import 'package:project_d2d/utils/constants.dart';
import 'package:project_d2d/widgets/top_banner_widget.dart';
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
    // exportBackgroundColor: Colors.blue,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
          TopBannerWidget(),
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
                    DataCell(SizedBox(
                        width: 50,
                        child: Text('Sunday 15 Oct 2022',
                            style: TextStyle(fontSize: 9)))),
                    DataCell(SizedBox(
                        width: 40,
                        child: Text('10:00', style: TextStyle(fontSize: 9)))),
                    DataCell(SizedBox(
                        width: 40,
                        child: Text('10:00', style: TextStyle(fontSize: 9)))),
                    DataCell(SizedBox(
                        width: 50,
                        child: Text('10:00' + ' - ' + '10:30',
                            style: TextStyle(fontSize: 9)))),
                    DataCell(
                      Container(
                        height: 30,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Color(0xffC8F8B8),
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
                              color: Color(0xff1F752C),
                              fontSize: 9,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(SizedBox(
                        width: 50,
                        child: Text('Sunday 15 Oct 2022',
                            style: TextStyle(fontSize: 9)))),
                    DataCell(SizedBox(
                        width: 40,
                        child: Text('10:00', style: TextStyle(fontSize: 9)))),
                    DataCell(SizedBox(
                        width: 40,
                        child: Text('10:00', style: TextStyle(fontSize: 9)))),
                    DataCell(SizedBox(
                        width: 50,
                        child: Text('10:00' + ' - ' + '10:30',
                            style: TextStyle(fontSize: 9)))),
                    DataCell(
                      Container(
                        height: 30,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: kButtonColor_R,
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
                              fontSize: 9,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(SizedBox(
                        width: 50,
                        child: Text('Sunday 15 Oct 2022',
                            style: TextStyle(fontSize: 9)))),
                    DataCell(SizedBox(
                        width: 40,
                        child: Text('10:00', style: TextStyle(fontSize: 9)))),
                    DataCell(SizedBox(
                        width: 40,
                        child: Text('10:00', style: TextStyle(fontSize: 9)))),
                    DataCell(SizedBox(
                        width: 50,
                        child: Text('10:00' + ' - ' + '10:30',
                            style: TextStyle(fontSize: 9)))),
                    DataCell(
                      Container(
                        height: 30,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: kButtonColor_R,
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
                                                      fontSize: 12,
                                                      fontWeight:
                                                          kFontWeight_M),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.cases_rounded,
                                                    size: 20),
                                                Text(
                                                  "Theatre Practioner",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          kFontWeight_M),
                                                ),
                                                Icon(Icons.location_pin,
                                                    size: 20),
                                                Text(
                                                  "Agate House",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          kFontWeight_M),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.calendar_today,
                                                    size: 20),
                                                Text(
                                                  "Sunday",
                                                  style: TextStyle(fontSize: 9),
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
                                                Icon(
                                                  Icons.alarm_add_outlined,
                                                  size: 20,
                                                ),
                                                Text(
                                                  "Start Time  7:30",
                                                  style: TextStyle(fontSize: 9),
                                                ),
                                                Icon(Icons.alarm_add_outlined,
                                                    size: 20),
                                                Text(
                                                  "Finish Time  7:30",
                                                  style: TextStyle(fontSize: 9),
                                                ),
                                                Icon(Icons.alarm_add_outlined,
                                                    size: 20),
                                                Text(
                                                  "Break Time  7:30",
                                                  style: TextStyle(fontSize: 9),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.edit,
                                                  size: 20,
                                                ),
                                                Text(
                                                  "Sign Here",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                            Row(
                                              children: [
                                                Container(
                                                  height: 150,
                                                  width: 300,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                  ),
                                                  child: Signature(
                                                      controller: _controller),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 20),
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
                                            SizedBox(height: 10),
                                            Row(
                                              children: [
                                                Container(
                                                  height: 50,
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
                                                              .all(
                                                                  kButtonColor_R),
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
