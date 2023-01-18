import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_d2d/base/base_stateful_state.dart';
import 'package:project_d2d/connection/network_manager.dart';
import 'package:project_d2d/model/approve_timesheet.dart';
import 'package:project_d2d/model/base_response.dart';
import 'package:project_d2d/model/job.dart';
import 'package:project_d2d/model/timesheetresponse.dart';
import 'package:project_d2d/model/timesheetresult1.dart';
import 'package:project_d2d/screens/home_detail_screen.dart';
import 'package:project_d2d/screens/home_screen.dart';
import 'package:project_d2d/utils/constants.dart';
import 'package:project_d2d/utils/sessions_manager.dart';
import 'package:project_d2d/widgets/top_banner_widget.dart';
import 'package:signature/signature.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class TimeSheetScreen extends StatefulWidget {
  const TimeSheetScreen({super.key});

  @override
  State<TimeSheetScreen> createState() => _TimeSheetScreenState();
}

class _TimeSheetScreenState extends BaseStatefulState<TimeSheetScreen> {
  final formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.red,
    // exportBackgroundColor: Colors.blue,
  );

  List<TimeSheetResponse> timeSheetDetailsList = [];

  List<Job> jobList = [];
  var dropDownList = [];
  // String? _chosenValue;
  Job? showSelectedJob;
  List<TimeSheetResponse> timesheetlist = [];
  // List<TimeSheetResponse> dropDownList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {
      getJob();
      
    });
    
  }

  // void getTimeSheetDetails() {
  //   showLoader();
  //   NetworkManager.shared
  //       .gettimeSheetDetails(
  //     NetworkManager.shared.userToken!,
  //     "getStaffTimesheetbyid",
  //     NetworkManager.shared.staffId!,
  //     NetworkManager.shared.jobId!,
  //     "multiple",
  //   )
  //       .then((BaseResponse<TimeSheetResponse> response) {
  //     // hideLoader();
  //     setState(() {
  //       timeSheetDetailsList.clear();
  //       timeSheetDetailsList.add(response.data!);
  //     });
  //   }).catchError((e) {
  //     // showFlashMsg(e.toString());
  //     // hideLoader();
  //     print(e.toString());
  //   });
  // }

  void getJob() {
    showLoader();
    NetworkManager.shared
        .getJob(
      NetworkManager.shared.userToken!,
      "getJobsByStaffId",
      NetworkManager.shared.staffId!,
      "",
      "Applied",
    )
        .then((BaseResponse<List<Job>> response) {
      hideLoader();
      setState(() {
        jobList.clear();
        jobList.addAll(response.data!);
      });
      // getTimeSheetDetails();
    }).catchError((e) {
      hideLoader();
      print(e.toString());
    });
  }

  void getDropdownDetails(int jobId) {
    showLoader();
    NetworkManager.shared
        .gettimeSheetDetails(
      NetworkManager.shared.userToken!,
      "getStaffTimesheetbyid",
      NetworkManager.shared.staffId!,
      jobId,
      "multiple",
    )
        .then((BaseResponse<TimeSheetResponse> response) {
      dropDownList.clear();
      dropDownList.addAll(response.data!.result2!);
      // for (var element in response.data!.result2!) {
      //   dropDownList.clear();
      //   dropDownList.add(element);
      //   log(dropDownList.toString());
      // }
      hideLoader();
      setState(() {
        timesheetlist.clear();
        if (response.data!.result1!.isNotEmpty) {
          timesheetlist.add(response.data!);
        }
      });
    }).catchError((e) {
      showFlashMsg(e.toString());
      hideLoader();
      print(e.toString());
    });
  }

  void onApproveButtonTapped() {
    // showLoader()
    NetworkManager.shared
        .approveTimeSheet(NetworkManager.shared.userToken!, <String, dynamic>{
      "sp": "updApproveTimeSheet",
      "staffId": NetworkManager.shared.staffId,
      "timesheetId": NetworkManager.shared.timesheetId,
    }).then((BaseResponse<ApproveTimeSheet> response) {
      // if (response.data!.Message == "Success") {
      //   // hideLoader();
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => TimeSheetScreen()));
      // }
      // Navigator.pop(context);
    }).catchError((e) {
      hideLoader();
      // showFlashMsg(e.toString());
      // print(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    // log("result ${timeSheetDetailsList.length}");
    // log(timesheetlist.length.toString());

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: getHeightByPercentage(30),
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
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(0)),
                          ),
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton<Job>(
                              hint: Text(
                                (jobList.isNotEmpty)
                                    ? "Select a Job"
                                    : "No Jobs",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              isExpanded: true,
                              dropdownColor: Color.fromARGB(255, 201, 105, 117),
                              elevation: 5,
                              value: showSelectedJob,
                              underline: Container(color: Colors.transparent),
                              icon: const Icon(
                                Icons.arrow_drop_down_outlined,
                                color: Colors.white,
                              ),
                              onChanged: (Job? value) {
                                getDropdownDetails(value!.jobId!);
                                // This is called when the user selects an item.
                                setState(() {
                                  showSelectedJob = value;
                                });
                                // print(showSelectedState!.name);
                              },
                              items: jobList
                                  .map<DropdownMenuItem<Job>>((Job value) {
                                return DropdownMenuItem<Job>(
                                  value: value,
                                  child: Text(
                                    value.jobNumber ?? '',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        // SizedBox(height: 10),
                        Text(
                          (timesheetlist.isNotEmpty)
                              ? timesheetlist[0].result1![0].catName ?? ""
                              : "No data found",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: kFontWeight_M,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          (timesheetlist.isNotEmpty)
                              ? timesheetlist[0].result1![0].clientName ?? ''
                              : '',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: kFontWeight_SB,
                                    fontSize: kFontSize_14),
                              ),
                              (timesheetlist.isNotEmpty)
                                  ? Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_today_outlined,
                                          color: Colors.white,
                                          size: 14,
                                        ),
                                        SizedBox(width: 2),
                                        Text(
                                          timesheetlist[0]
                                                  .result1![0]
                                                  .jobPostDate ??
                                              '',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: kFontWeight_SB,
                                              fontSize: kFontSize_14),
                                        ),
                                      ],
                                    )
                                  : Text(
                                      "",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: kFontWeight_SB,
                                          fontSize: kFontSize_14),
                                    ),
                              (timesheetlist.isNotEmpty)
                                  ? Row(
                                      children: [
                                        ImageIcon(
                                          AssetImage(
                                              "assets/images/ic_location.png"),
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          timesheetlist[0]
                                                  .result1![0]
                                                  .jobLocation ??
                                              '',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: kFontWeight_SB,
                                            fontSize: kFontSize_14,
                                          ),
                                        ),
                                      ],
                                    )
                                  : Text(
                                      "",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: kFontWeight_SB,
                                          fontSize: kFontSize_14),
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(
                            builder: (BuildContext context) {
                              return HomeScreen();
                            },
                          ), (route) => false);
                          // Navigator.pop(context);
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             HomeScreen()));
                          // getJob();
                        },
                      ),
                    ),
                    height: 40,
                    width: 40,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 0),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    topLeft: Radius.circular(5)),
                                color: Colors.pink.shade100),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                    width: 70,
                                    child: Text("Date",
                                        style: TextStyle(fontSize: 12))),
                                SizedBox(
                                    width: 60,
                                    child: Text("Start Time",
                                        style: TextStyle(fontSize: 12))),
                                SizedBox(
                                    width: 60,
                                    child: Text("Finish Time",
                                        style: TextStyle(fontSize: 12))),
                                SizedBox(
                                    width: 60,
                                    child: Text("Break",
                                        style: TextStyle(fontSize: 12))),
                                SizedBox(
                                    width: 60,
                                    child: Text("Status",
                                        style: TextStyle(fontSize: 12))),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.grey.shade900,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        (dropDownList.isNotEmpty)
                            ? SizedBox(
                                height: getHeightByPercentage(50),
                                child: ListView.separated(
                                    shrinkWrap: true,
                                    itemCount: dropDownList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Row(
                                        children: [
                                          (dropDownList.isNotEmpty)
                                              ? Expanded(
                                                  child: Container(
                                                    // color: Colors.pink.shade100,
                                                    height: 60,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        SizedBox(
                                                            width: 70,
                                                            child: Text(
                                                                dropDownList[
                                                                            index]
                                                                        .createdOn ??
                                                                    '',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12))),
                                                        SizedBox(
                                                            width: 60,
                                                            child: Text(
                                                                dropDownList[
                                                                            index]
                                                                        .starttime ??
                                                                    '',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12))),
                                                        SizedBox(
                                                            width: 60,
                                                            child: Text(
                                                                dropDownList[
                                                                            index]
                                                                        .endtime ??
                                                                    '',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12))),
                                                        SizedBox(
                                                            width: 60,
                                                            child: Text(
                                                                dropDownList[
                                                                            index]
                                                                        .breakTime ??
                                                                    '',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12))),
                                                        Container(
                                                          height: 30,
                                                          width: 70,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            15)),
                                                            color: (dropDownList[
                                                                            index]
                                                                        .status!
                                                                        .length ==
                                                                    8)
                                                                ? Colors
                                                                    .greenAccent
                                                                : kButtonColorR,
                                                          ),
                                                          child: TextButton(
                                                            onPressed: () {
                                                              (dropDownList[
                                                                              index]
                                                                          .status !=
                                                                      "Approved")
                                                                  ? showModalBottomSheet(
                                                                      enableDrag:
                                                                          false,
                                                                      shape:
                                                                          const RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.vertical(
                                                                          top: Radius.circular(
                                                                              20),
                                                                        ),
                                                                      ),
                                                                      isScrollControlled:
                                                                          true,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (BuildContext
                                                                              cntx) {
                                                                        return Padding(
                                                                          padding: const EdgeInsets.only(
                                                                              left: 20,
                                                                              top: 10),
                                                                          child: Column(
                                                                              // mainAxisSize: MainAxisSize.min,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Row(
                                                                                  children: [
                                                                                    Text(
                                                                                      "Time Sheet",
                                                                                      style: TextStyle(fontSize: 12, fontWeight: kFontWeight_M),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 10,
                                                                                ),
                                                                                Row(
                                                                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                  children: [
                                                                                    Row(
                                                                                      children: [
                                                                                        ImageIcon(
                                                                                          AssetImage("assets/images/ic_briefcase.png"),
                                                                                          size: 15,
                                                                                          color: Colors.grey,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 5,
                                                                                        ),
                                                                                        Text(
                                                                                          timesheetlist[0].result1![0].catName ?? '',
                                                                                          style: TextStyle(fontSize: 10, fontWeight: kFontWeight_M),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: 10,
                                                                                    ),
                                                                                    Row(
                                                                                      children: [
                                                                                        ImageIcon(
                                                                                          AssetImage("assets/images/ic_location.png"),
                                                                                          size: 15,
                                                                                          color: Colors.grey,
                                                                                        ),
                                                                                        SizedBox(width: 5),
                                                                                        Text(
                                                                                          timesheetlist[0].result1![0].jobLocation ?? '',
                                                                                          style: TextStyle(fontSize: 10, fontWeight: kFontWeight_M),
                                                                                        ),
                                                                                      ],
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 10,
                                                                                ),
                                                                                Row(
                                                                                  children: [
                                                                                    Icon(
                                                                                      Icons.calendar_today,
                                                                                      size: 20,
                                                                                      color: Colors.grey,
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: 5,
                                                                                    ),
                                                                                    Text(
                                                                                      timesheetlist[0].result1![0].shiftName ?? '',
                                                                                      style: TextStyle(fontSize: 9),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 10,
                                                                                ),
                                                                                Row(
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  // mainAxisAlignment:
                                                                                  //     MainAxisAlignment.spaceEvenly,
                                                                                  children: [
                                                                                    ImageIcon(
                                                                                      AssetImage("assets/images/ic_clock.png"),
                                                                                      size: 15,
                                                                                      color: Colors.grey,
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: 5,
                                                                                    ),
                                                                                    Center(
                                                                                      child: Text(
                                                                                        dropDownList[index].starttime ?? '',
                                                                                        style: TextStyle(fontSize: 9),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: 10,
                                                                                    ),
                                                                                    ImageIcon(
                                                                                      AssetImage("assets/images/ic_clock.png"),
                                                                                      size: 15,
                                                                                      color: Colors.grey,
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: 5,
                                                                                    ),
                                                                                    Center(
                                                                                      child: Text(
                                                                                        dropDownList[index].breakTime ?? '',
                                                                                        style: TextStyle(fontSize: 9),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: 10,
                                                                                    ),
                                                                                    ImageIcon(
                                                                                      AssetImage("assets/images/ic_clock.png"),
                                                                                      size: 15,
                                                                                      color: Colors.grey,
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: 5,
                                                                                    ),
                                                                                    Center(
                                                                                      child: Text(
                                                                                        dropDownList[index].endtime ?? '',
                                                                                        style: TextStyle(fontSize: 9),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 10,
                                                                                ),
                                                                                Row(
                                                                                  children: [
                                                                                    ImageIcon(
                                                                                      AssetImage("assets/images/ic_edit.png"),
                                                                                      size: 15,
                                                                                      color: Colors.grey,
                                                                                    ),
                                                                                    Text(
                                                                                      "Sign Here",
                                                                                      style: TextStyle(
                                                                                        fontSize: 9,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                SizedBox(height: 10),
                                                                                Row(
                                                                                  children: [
                                                                                    Container(
                                                                                      height: 150,
                                                                                      width: 300,
                                                                                      decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                                                                      ),
                                                                                      child: Container(
                                                                                        height: 150,
                                                                                        width: 150,
                                                                                        color: Colors.green,
                                                                                        child: SfSignaturePad(
                                                                                          backgroundColor: Colors.grey[200],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                SizedBox(height: 20),
                                                                                Row(
                                                                                  children: [
                                                                                    Text(
                                                                                      "Signed By",
                                                                                      style: TextStyle(
                                                                                        fontSize: 9,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                SizedBox(height: 10),
                                                                                Row(
                                                                                  children: [
                                                                                    Form(
                                                                                      key: formKey,
                                                                                      child: Container(
                                                                                        height: 60,
                                                                                        width: 300,
                                                                                        child: TextFormField(
                                                                                          // decoration: InputDecoration(
                                                                                          //     border: OutlineInputBorder(),
                                                                                          //     contentPadding: EdgeInsets.all(5)
                                                                                          //     // labelText: 'Mobile'
                                                                                          //     ),
                                                                                          decoration: InputDecoration(
                                                                                            // hintText: 'Enter Reason',
                                                                                            contentPadding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
                                                                                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                                                                          ),
                                                                                          controller: _nameController,
                                                                                          validator: (value) {
                                                                                            if (value!.isEmpty) return "Enter Name";
                                                                                            return null;
                                                                                          },
                                                                                        ),
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
                                                                                          if (formKey.currentState!.validate()) {
                                                                                            SessionsManager.saveTimesheetId(dropDownList[index].timesheetId ?? 0);

                                                                                            NetworkManager.shared.timesheetId = dropDownList[index].timesheetId ?? 0;

                                                                                            NetworkManager.shared.refreshTokens();

                                                                                            onApproveButtonTapped();
                                                                                            showFlashMsg("Approved Successfully");

                                                                                            Navigator.pushReplacement(cntx, MaterialPageRoute(builder: (context) => TimeSheetScreen()));
                                                                                            setState(() {});
                                                                                          }
                                                                                        },
                                                                                        child: Text(
                                                                                          'Approve',
                                                                                          style: TextStyle(
                                                                                            fontSize: 16,
                                                                                          ),
                                                                                        ),
                                                                                        style: ButtonStyle(
                                                                                          backgroundColor: MaterialStateProperty.all(kButtonColorR),
                                                                                          shape: MaterialStateProperty.all(
                                                                                            RoundedRectangleBorder(
                                                                                              borderRadius: BorderRadius.circular(5),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                SizedBox(height: 10),
                                                                              ]),
                                                                        );
                                                                      }).then((value) {
                                                                      getDropdownDetails(NetworkManager
                                                                          .shared
                                                                          .jobId!);
                                                                      setState(
                                                                          () {});
                                                                    })
                                                                  : showModalBottomSheet(
                                                                      isScrollControlled: true,
                                                                      context: context,
                                                                      builder: (BuildContext context) {
                                                                        return Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(left: 20, top: 10),
                                                                            child: Text("TimeSheet Approved "));
                                                                      });
                                                            },
                                                            child: (dropDownList[
                                                                            index]
                                                                        .status!
                                                                        .length ==
                                                                    8)
                                                                ? Text(
                                                                    'Approved',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .green,
                                                                      fontSize:
                                                                          8,
                                                                    ),
                                                                  )
                                                                : Text(
                                                                    'Pending',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          8,
                                                                    ),
                                                                  ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              : Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child:
                                                      Text("No Jobs Available"),
                                                ),
                                        ],
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return Divider(
                                        height: 1,
                                        color: Colors.grey,
                                      );
                                    }),
                              )
                            : Column(
                                children: [
                                  Text("No TimeSheet available right now..."),
                                  Text("Please Select a job to view TimeSheet"),
                                ],
                              )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool isAuthenticationRequired() {
    // TODO: implement isAuthenticationRequired
    throw UnimplementedError();
  }
}
