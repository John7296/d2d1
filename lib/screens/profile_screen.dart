import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:project_d2d/base/base_stateful_state.dart';
import 'package:project_d2d/base/manager/data_manager.dart';
import 'package:project_d2d/connection/network_manager.dart';
import 'package:project_d2d/model/base_response.dart';
import 'package:project_d2d/model/job_request.dart';
import 'package:project_d2d/model/staff_profile.dart';
import 'package:project_d2d/model/timesheet.dart';
import 'package:project_d2d/model/timesheet_banner.dart';
import 'package:project_d2d/model/training_status.dart';
import 'package:project_d2d/screens/available_jobs_screen.dart';
import 'package:project_d2d/screens/edit_profile.dart';
import 'package:project_d2d/screens/home_screen.dart';
import 'package:project_d2d/screens/job_cancel_screen.dart';
import 'package:project_d2d/screens/job_cancelled_successful_screen.dart';
import 'package:project_d2d/screens/job_details_screen.dart';

import 'package:project_d2d/screens/profile_summary_screen.dart';
import 'package:project_d2d/screens/settings_screen.dart';
import 'package:project_d2d/screens/timesheet_screen.dart';
import 'package:project_d2d/utils/constants.dart';

class ProfileScreen extends StatefulWidget {
 bool? fromSettings;
 bool? fromBottom;
 bool? fromProfile;
 bool? fromEdit;

 ProfileScreen({super.key,this.fromSettings=true, this.fromBottom=true,this.fromProfile=true, this.fromEdit=true});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends BaseStatefulState<ProfileScreen> {
  List<StaffProfile> profile = [];
  List<TrainingStatus> training = [];
  List<JobRequest> jobs = [];
  List<TimesheetBanner> banner = [];

  int? percentvalue;

  List<StaffProfile>? thisuser;



  
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {
      // thisuser=DataManager.shared.thisuser;
      staffProfile();


      // _updateDeviceToken();
    });
  }

  Future<void> staffProfile() async {
    showLoader();
    NetworkManager.shared
        .staffProfile(NetworkManager.shared.userToken ?? '',
            "getStaffProfilebyid", NetworkManager.shared.staffId ?? 0)
        .then((BaseResponse<List<StaffProfile>> response) {

                trainingStatus();
      recentJobRequest();
      timeSheetBanner();
      
      setState(() {
        profile.clear();
        profile.addAll(response.data!);
       
        //  DataManager.shared.thisuser =response.data!;
      });
      //recentJobRequest();
    }).catchError((e) {
      hideLoader();
      //showFlashMsg(e.toString());
      print(e);
      showFlashMsg(e.Message);
    });
  }

  void trainingStatus() {
    NetworkManager.shared
        .trainingStatus(NetworkManager.shared.userToken ?? '',
            "getTrainingStatus", NetworkManager.shared.staffId ?? 0)
        .then((BaseResponse<List<TrainingStatus>> response) {
      hideLoader();
      setState(() {
        training.clear();
        training.addAll(response.data!);

        
        percentvalue = response.data?.first.completionRate;
      });
      // timeSheetBanner();
    }).catchError((e) {
      hideLoader();
      //showFlashMsg(e.toString());
      print(e);
      showFlashMsg(e.Message!);
    });
  }

  void recentJobRequest() {
    NetworkManager.shared
        .recentJobRequest(NetworkManager.shared.userToken ?? '',
            "getRecentRequstedJobs", NetworkManager.shared.staffId ?? 0)
        .then((BaseResponse<List<JobRequest>> response) {
      hideLoader();
      setState(() {
        jobs.clear();
        jobs.addAll(response.data!);
      });
      // timeSheetBanner();
    }).catchError((e) {});
  }

  void timeSheetBanner() {
    NetworkManager.shared
        .timeSheetBanner(NetworkManager.shared.userToken ?? '',
            "getStaffTimesheetBannerById", NetworkManager.shared.staffId ?? 0)
        .then((BaseResponse<List<TimesheetBanner>> response) {
   
      setState(() {
        banner.clear();
        banner.addAll(response.data!);

        //   emailSent = true;
      });
      //trainingStatus();
    }).catchError((e) {
      //  hideLoader();
      // showFlashMsg(e.toString());
      // print(e);
      // showFlashMsg(e.Message!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
       // physics: NeverScrollableScrollPhysics(),
        child: Column(children: [
          Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                        Navigator.pop(context);

      
                  //  (widget.fromSettings == true)
                  //       ?
                  //        // Navigator.pop(context);
                  //       Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => SettingsScreen()))
                  //       :Navigator.pushAndRemoveUntil(context,
                  //           MaterialPageRoute(
                  //         builder: (BuildContext context) {
                  //           return SettingsScreen();
                  //         },
                  //       ), (route) => false);
      
                  //         if (widget.fromProfile == true)
                  //          Navigator.pushAndRemoveUntil(context,
                  //           MaterialPageRoute(
                  //         builder: (BuildContext context) {
                  //           return HomeScreen();
                  //         },
                  //       ), (route) => false);
      
                  //       if (widget.fromBottom == true)

                  // //       Navigator.pop(context);
                      
                  //      Navigator.pushAndRemoveUntil(context,
                  //           MaterialPageRoute(
                  //         builder: (BuildContext context) {
                  //           return HomeScreen();
                  //         },
                  //       ), (route) => false);

                  //       if(widget.fromEdit==true)
                            
                  // // // Navigator.pop(context);
                  // // // Navigator.pushReplacement(context,
                  // // //     MaterialPageRoute(builder: (context) => HomeScreen()));
                  //      Navigator.pushAndRemoveUntil(context,
                  //           MaterialPageRoute(
                  //         builder: (BuildContext context) {
                  //           return HomeScreen();
                  //         },
                  //       ), (route) => false);
                },
                icon: Icon(Icons.arrow_back_ios_new)),
            Spacer(),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfile()));
                },
                child: Text("Edit",
                    style: TextStyle(color: Color(0xffAFB0B6), fontSize: 15)))
          ],
        ),
          ),
          CircleAvatar(
        radius: 50,
        backgroundColor: Color(0xffF3B7BF),
        child: profile.isNotEmpty? profile.first.profilePhoto!=null
      ?  CircleAvatar(
          radius: 35,
          child: 
          CachedNetworkImage(
              imageUrl:
                   "https://wpr.intertoons.net/d2dwebadmin/${profile.first.profilePhoto}"
                  ),
      
          // Image(
          //   image: AssetImage("assets/images/profile_img.png"),
          // ),
        )
        : CircleAvatar(
          radius: 35,
          child:  
          Image(
            image: AssetImage("assets/images/profile_img.png"),
          ),
        )
     :     CircleAvatar(
          radius: 35,
          child:  
          Image(
            image: AssetImage("assets/images/profile_img.png"),
          ),
        )    
          ),
          
          Center(
          child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          profile.isNotEmpty ? profile[0].staffName ?? '' : "",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 22),
        ),
          )),
          Center(
          child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Text(
          profile.isNotEmpty ? profile[0].catName ?? '' : "",
          // "Theatre practitioner",
          //profile.first.catName.toString(),
          style: TextStyle(color: Color(0xff95969D), fontSize: 13),
        ),
          )),
          SizedBox(height: 10),
          Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
      
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Text(
              profile.isNotEmpty ? profile[0].jobsCount.toString() : "",
              // "27",
              // profile.first.jobsCount.toString(),
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 15),),
      
                   Text(
              "Jobs",
              style: TextStyle(
                  color: Color(0xff95969D),
                  fontWeight: FontWeight.w500,
                  fontSize: 13),
            ),
      
                ]),
      
              ),
      
              Container(
                  child: Column(children: [
                    Text(
                      
                profile.isNotEmpty
                    ? profile[0].timeSheetCount.toString()
                    : "",
                // "89",
                // profile.first.timeSheetCount.toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 15),
              ),
      
               Text(
              "Time sheets",
              style: TextStyle(
                  color: Color(0xff95969D),
                  fontWeight: FontWeight.w500,
                  fontSize: 13),
            ),
                  
                ]),
              ),
      
              Container(
                  child: Column(
                    
                    children: [
      
                     Text(
                profile.isNotEmpty ? profile[0].passportExpy.toString() : "",
                // "13 Nov 2024",
                // profile.first.passportExpy.toString(),
                // maxLines: 2,
                style: TextStyle(
                    color: Color(0xffF41937),
                    fontWeight: FontWeight.w700,
                    fontSize: 15),),
      
                    Text(
              "Passport expiry",
              style: TextStyle(
                  color: Color(0xff95969D),
                  fontWeight: FontWeight.w500,
                  fontSize: 13),
            ),
        
                  
                ]),
                
              ),
      
              Container(
                  child: InkWell(
      
                    onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileSummaryScreen()));
                },
                    child: Column(children: [
                           
                  
                      Row(
                        children: [
                              Icon(Icons.currency_pound_outlined,
                          color: kGreenColor, size: 20),
                           Text(
                            profile.isNotEmpty
                                ? profile.first.totalEarnings==null?
                               
                                "0":   profile[0].totalEarnings.toString():"",
                            // "\$3435.00",
                            //profile.first.totalEarnings.toString(),
                            style: TextStyle(
                                color: kGreenColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 15),
                          ),
                        ],
                      ),
                  
                      Text(
                                  "Total Earnings",
                                  style: TextStyle(
                    color: Color(0xff95969D),
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
                                ),
                    
                                    ]),
                  ),
                
              ),
      
      
        ]),
      
      
       
          ),
          
          Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
        child: Row(
          children: [
            Text("Recent Job Request",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            // Spacer(),
            // Text("See all",
            //     style: TextStyle(
            //       fontSize: 13,
            //       color: Color(0xffAFB0B6),
            //     )),
          ],
        ),
          ),
          if (jobs.isNotEmpty)
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 15),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                //color: Colors.white70
                // color: Colors.yellow,
              ),
              height: 94,
              // width:double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: jobs.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AvailableJobsScreen()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 376,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white70
                            // color: Colors.grey,
                            ),
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 3, right: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: 10,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                    ),
                                    color: kGreenprogressColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 15),
                                child: Column(
                                  children: [
                                    Center(
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        child: CachedNetworkImage(
                                            imageUrl: jobs.isNotEmpty
                                                ? "https://wpr.intertoons.net/d2dwebadmin/${jobs[index].profilePhoto}"
                                                : ""),
      
                                        // Image(
                                        //   image: AssetImage(
                                        //       "assets/images/homecare_logo.png"),
                                        //   fit: BoxFit.fill,
                                        // ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        jobs.isNotEmpty
                                            ? jobs[index]
                                                .profession
                                                .toString()
                                            : "",
                                        // "Dialysis Specialist",
                                        //jobs.first.profession.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                        )),
                                    Text(
                                        jobs.isNotEmpty
                                            ? jobs[index]
                                                .clientName
                                                .toString()
                                            : "",
                                        // "Agate House",
                                        // jobs.first.clientName??'',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff000000))),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 10, top: 15),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.add_location_outlined,
                                          color: Color(0xff413E3E),
                                        ),
                                        Text(
                                            jobs.isNotEmpty
                                                ? jobs[index]
                                                    .staffLocation
                                                    .toString()
                                                : "",
                                            // "Agate East",
                                            //  jobs.first.staffLocation.toString(),
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_month_outlined,
                                          color: Color(0xffAFB0B6),
                                        ),
                                        Text(
                                            jobs.isNotEmpty
                                                ? jobs[index]
                                                    .allocatedOn
                                                    .toString()
                                                : "",
                                            // "11 Nov 2022",
                                            //jobs.first.allocatedOn.toString(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Color(0xff0D0D26),
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 15,
                            width: 110,
                            decoration: BoxDecoration(
                              color: Color(0xffD00000),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                topLeft: Radius.circular(15),
                              ),
                            ),
                            child: Center(
                                child: Text(
                              "Requested",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )),
                          )
                        ]),
                      ),
                    );
      
                    
                  })),
        ),
          if (jobs.isEmpty)
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Container(
            height: 94,
            // color: Colors.green,
            child: Center(child: Text("No Job Request Found")),
          ),
        ),
          Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
        child: Row(
          children: [
            Text("Time Sheets",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            Spacer(),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TimeSheetScreen()));
              },
              child: Text("See all ➤",
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xffAFB0B6),
                  )),
            ),
          ],
        ),
          ),
          if (banner.isNotEmpty)
        Padding(
          padding: const EdgeInsets.only(left:20, right:20, top:20),
          child: Row(
         
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Container(
                   height: 80,
                  // width: 180,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                   //color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: 
                 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: CircleAvatar(
                             radius: 30,
                              backgroundColor: Color(0xffFDD9DE),
                              child: Image(
                                image: AssetImage(
                                  "assets/images/ic_time_1.png",
                                  
                                ),
                                height: 40,
                                fit: BoxFit.fill,
                                //    width:50,
                                // height:50
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10 ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                      
                      
                              Text(
                                    banner.isNotEmpty
                                        ? "${banner[0].pending.toString()} Pending"
                                        : "",
                                    // "7 Pending",
                                    //  " ${banner.first.jobPending.toString()} Pending",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xffFD425B))),
                      
                                        Text(
                                    banner.isNotEmpty
                                        ? banner[0].clientName.toString()
                                        : "",
                                    // "Agate House",
                                    // banner.first.clientName.toString(),
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xffAFB0B6))),
                            
                              
                      
                            ],),
                          )
                          
                        ],
                      ),
                     
                  
                ),
              ),
              
              SizedBox(width: 5,),
      
      
      
             Expanded(
                child: Container(
                   height: 80,
                  // width: 180,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                  // color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: 
                 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: CircleAvatar(
                             radius: 30,
                              backgroundColor: Color(0xffFDD9DE),
                              child: Image(
                                image: AssetImage(
                                  "assets/images/ic_time_1.png",
                                  
                                ),
                                height: 40,
                                fit: BoxFit.fill,
                                //    width:50,
                                // height:50
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10 ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                      
                      
                              Text(
                                    banner.isNotEmpty
                                        ? "${banner[0].approved.toString()} Approved"
                                        : "",
                                    // "7 Pending",
                                    //  " ${banner.first.jobPending.toString()} Pending",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xffFD425B))),
                      
                                        Text(
                                    banner.isNotEmpty
                                        ? banner[0].clientName.toString()
                                        : "",
                                    // "Agate House",
                                    // banner.first.clientName.toString(),
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xffAFB0B6))),
                            
                              
                      
                            ],),
                          )
                          
                        ],
                      ),
                     
                  
                ),
              ),
      
            
             
      
              // if(banner.isEmpty)
              // Padding(
              //   padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              //   child: Container(
              //     height: 70,
              //     color:Colors.yellow,
              //     child: Center(child: Text("No data found"))),
              // ),
            ],
          ),
        ),
          if (banner.isEmpty)
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
          child: Container(
            height: 80,
            // color:Colors.amber,
            child: Center(child: Text("No data found")),
          ),
        ),
          Padding(
        padding: const EdgeInsets.only(left: 20, top: 25),
        child: Row(
          children: [
            Text("Training Status",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black)),
          ],
        ),
          ),
          if (training.isNotEmpty)
        Padding(
          padding: const EdgeInsets.only(left: 20,top:10, bottom: 10),
          child: Container(
           // color: Colors.grey,
            height: 200,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                  itemCount: training.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                  
                      children: [
                     
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              training.isNotEmpty
                                  ? "${training[index].completionRate.toString()}%"
                                  : "",
                              // "93%"
                              //"${training.first.completionRate.toString()}%",
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                                training.isNotEmpty
                                    ? training[index].trainingName.toString()
                                    : "",
                                // "Food Hygiene",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black)),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: LinearPercentIndicator(
                                lineHeight: 12,
                                width: 200,
                                progressColor: kGreenprogressColor,
                                backgroundColor: Color(0xffD9D9D9),
                                percent: percentvalue!/100,
                                barRadius: Radius.circular(5),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                       
                      ],
                    );
                  }),
            ),
                
          ),
        ),         
         if (training.isEmpty)
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20, top:20),
                          child: Container(
                           // color: Colors.amber,
                            height: 100,
                            width: double.infinity,
                            child: Center(
                                child: Text("No Training Status Found")),
                          ),
                        ),
        ]),
      ),
    );
  }

  @override
  bool isAuthenticationRequired() {
    // TODO: implement isAuthenticationRequired
    throw UnimplementedError();
  }
}
