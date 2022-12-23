import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom:50),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_new)),
                Spacer(),
                TextButton(
                    onPressed: () {},
                    child: Text("Edit",
                        style: TextStyle(
                            color: Color(0xffAFB0B6),
                            fontWeight: FontWeight.normal,
                            fontSize: 15)))
              ],
            ),
          ),
          CircleAvatar(
            radius: 50,
            backgroundColor: Color(0xffF3B7BF),
            child: CircleAvatar(
              radius: 35,
              child:
                  Image(image: AssetImage("assets/images/profile_img.png")),
            ),
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "Mary James",
              style: TextStyle(
                  color: Colors.black,
                
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
          )),
          Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "Theatre practitioner",
              style: TextStyle(
                  color: Color(0xffAFB0B6),
                
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            ),
          )),
          // Padding(
          //   padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       Text(
          //         "27",
          //         style: TextStyle(
          //             color: Colors.black,
                    
          //             fontWeight: FontWeight.w700,
          //             fontSize: 16),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.only(left: 60),
          //         child: Text(
          //           "89",
          //           style: TextStyle(
          //               color: Colors.black,
                      
          //               fontWeight: FontWeight.w700,
          //               fontSize: 16),
          //         ),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.only(left: 50),
          //         child: Text(
          //           "13 Nov 2024",
          //           style: TextStyle(
          //               color: Color(0xffF41937),
                     
          //               fontWeight: FontWeight.w700,
          //               fontSize: 16),
          //         ),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.only(left: 30),
          //         child: Text(
          //           "3435.00",
          //           style: TextStyle(
          //               color: Color(0xff179F0B),
                      
          //               fontWeight: FontWeight.w700,
          //               fontSize: 16),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          //   child: Row(
          //     // crossAxisAlignment: CrossAxisAlignment.start,
          //      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       Text(
          //         "Jobs",
          //         style: TextStyle(
          //             color: Color(0xffAFB0B6),
                   
          //             fontWeight: FontWeight.w500,
          //             fontSize: 12),
          //       ),
          //       SizedBox(
          //         width: 30,
          //       ),
          //       Text(
          //         "Time sheets",
          //         style: TextStyle(
          //             color: Color(0xffAFB0B6),
                   
          //             fontWeight: FontWeight.w500,
          //             fontSize: 15),
          //       ),
          //       SizedBox(
          //         width: 30,
          //       ),
          //       Text(
          //         "Time sheets",
          //         style: TextStyle(
          //             color: Color(0xffAFB0B6),
                   
          //             fontWeight: FontWeight.w500,
          //             fontSize: 12),
          //       ),
          //       SizedBox(
          //         width: 30,
          //       ),
          //       Text(
          //         "Total Earnings",
          //         style: TextStyle(
          //             color: Color(0xffAFB0B6),
                     
          //             fontWeight: FontWeight.w500,
          //             fontSize: 12),
          //       ),
          //     ],
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
          //   child: Row(
          //     children: [
          //       Text("Recent Job Request",
          //           style: TextStyle(
                       
          //               fontSize: 16,
          //               fontWeight: FontWeight.w600)),
          //       Spacer(),
          //       Text("See all",
          //           style: TextStyle(
                       
          //               fontSize: 13,
          //               color: Color(0xffAFB0B6),
          //               fontWeight: FontWeight.w600)),
          //     ],
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          //   child: Container(
          //       // color: Colors.yellow,
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(30),
          //           color: Colors.white70),
          //       height: 100,
          //       child: Column(
          //         children: [
          //           Row(
          //             children: [
          //               Padding(
          //                 padding: const EdgeInsets.only(left: 10, top: 30),
          //                 child: Column(
          //                   children: [
          //                     Center(
          //                       child: Container(
          //                         height: 50,
          //                         width: 50,
          //                         child: Image(
          //                           image: AssetImage(
          //                               "assets/images/homecare_logo.png"),
          //                           fit: BoxFit.fill,
          //                         ),
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //               Padding(
          //                 padding: const EdgeInsets.only(left: 10, top: 20),
          //                 child: Column(
          //                   mainAxisAlignment: MainAxisAlignment.start,
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Text("Dialysis Specialist",
          //                         style: TextStyle(
                                     
          //                             fontSize: 14,
          //                             fontWeight: FontWeight.w500)),
          //                     Text("Agate House",
          //                         style: TextStyle(
                                   
          //                             fontSize: 12,
          //                             fontWeight: FontWeight.w500,
          //                             color: Color(0xffAFB0B6))),
          //                   ],
          //                 ),
          //               ),
          //               Spacer(),
          //               Padding(
          //                 padding: const EdgeInsets.only(right: 10, top: 30),
          //                 child: Column(
          //                   children: [
          //                     Row(
          //                       children: [
          //                         Icon(
          //                           Icons.add_location_outlined,
          //                           color: Color(0xff413E3E),
          //                         ),
          //                         Text("Agate East",
          //                             style: TextStyle(
                                          
          //                                 fontSize: 12,
          //                                 fontWeight: FontWeight.w500)),
          //                       ],
          //                     ),
          //                     Row(
          //                       children: [
          //                         Icon(
          //                           Icons.calendar_month_outlined,
          //                           color: Color(0xffAFB0B6),
          //                         ),
          //                         Text("11 Nov 2022",
          //                             style: TextStyle(
                                         
          //                                 color: Color(0xffAFB0B6),
          //                                 fontSize: 12,
          //                                 fontWeight: FontWeight.w500)),
          //                       ],
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ],
          //           ),
          //           Container(
          //             height: 20,
          //             width: 100,
          //             decoration: BoxDecoration(
          //               color: Color(0xffD00000),
          //               borderRadius: BorderRadius.only(
          //                 topRight: Radius.circular(15),
          //                 topLeft: Radius.circular(15),
          //               ),
          //             ),
          //             child: Center(
          //                 child: Text(
          //               "Requested",
          //               style: TextStyle(
                          
          //                   fontSize: 10,
          //                   fontWeight: FontWeight.w500,
          //                   color: Colors.white),
          //             )),
          //           )
          //         ],
          //       )),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
          //   child: Row(
          //     children: [
          //       Text("Time Sheets",
          //           style: TextStyle(
                      
          //               fontSize: 16,
          //               fontWeight: FontWeight.w600)),
          //       Spacer(),
          //       Text("See all",
          //           style: TextStyle(
                      
          //               fontSize: 13,
          //               color: Color(0xffAFB0B6),
          //               fontWeight: FontWeight.w600)),
          //     ],
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
          //   child: Row(
          //     children: [
          //       Container(
          //         height: 90,
          //         width: 180,
          //         decoration: BoxDecoration(
          //          color: Colors.white70,
          //           borderRadius: BorderRadius.circular(30),
          //         ),
          //         child: Row(
          //           children: [
          //             Padding(
          //               padding: const EdgeInsets.only(left: 10, top: 10),
          //               child: Column(
          //                 children: [
          //                   CircleAvatar(
          //                     radius: 35,
          //                     backgroundColor: Color(0xffFDD9DE),
          //                     child: Container(
          //                       width: 50,
          //                       height: 40,
          //                       child: Image(
          //                         image: AssetImage(
          //                           "lib/assets/images/time.png",
          //                         ),
          //                         fit: BoxFit.fill,
          //                         //    width:50,
          //                         // height:50
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //             Padding(
          //               padding: const EdgeInsets.only(left: 10, top: 26),
          //               child: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Text("7 Pending",
          //                       style: TextStyle(
                                   
          //                           fontSize: 14,
          //                           fontWeight: FontWeight.w600,
          //                           color: Color(0xffFD425B))),
          //                   Padding(
          //                     padding: const EdgeInsets.only(top: 6.0),
          //                     child: Text("Agate House",
          //                         style: TextStyle(
                                     
          //                             fontSize: 10,
          //                             fontWeight: FontWeight.w500,
          //                             color: Color(0xffAFB0B6))),
          //                   ),
          //                 ],
          //               ),
          //             )
          //           ],
          //         ),
          //       ),
      
          //     Spacer(),
      
          //       Container(
          //         height: 90,
          //         width: 180,
          //         decoration: BoxDecoration(
          //           color: Colors.white70,
          //           borderRadius: BorderRadius.circular(30),
          //         ),
          //         child: Row(
          //           children: [
          //             Padding(
          //               padding: const EdgeInsets.only(left: 10, top: 10),
          //               child: Column(
          //                 children: [
          //                   CircleAvatar(
          //                     radius: 35,
          //                     backgroundColor: Color(0xffFDD9DE),
          //                     child: Container(
          //                       width: 50,
          //                       height: 40,
          //                       child: Image(
          //                         image: AssetImage(
          //                           "assets/images/time.png",
          //                         ),
          //                         fit: BoxFit.fill,
          //                         //    width:50,
          //                         // height:50
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
                      
          //             Padding(
          //               padding: const EdgeInsets.only(left: 10, top: 26),
          //               child: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Text("85 Approved",
          //                       style: TextStyle(
                                  
          //                           fontSize: 14,
          //                           fontWeight: FontWeight.w600,
          //                           color: Color(0xffFD425B))),
          //                   Padding(
          //                     padding: const EdgeInsets.only(top: 6.0),
          //                     child: Text("Agate House",
          //                         style: TextStyle(
                                      
          //                             fontSize: 10,
          //                             fontWeight: FontWeight.w500,
          //                             color: Color(0xffAFB0B6))),
          //                   ),
          //                 ],
          //               ),
          //             )
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
      
          // Padding(
          //   padding: const EdgeInsets.only(left:20, top:20),
          //   child: Row(
          //     children: [
          //       Text("Training Status",
          //                             style: TextStyle(
                                         
          //                                 fontSize: 16,
          //                                 fontWeight: FontWeight.w600,
          //                                 color: Colors.black)),
          //     ],
          //   ),
          // ),
      
          // Row(children: [
      
          //   Padding(
          //     padding: const EdgeInsets.only(left:20, top:10),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //       Text("Manual Handling",
          //                         style: TextStyle(
                                      
          //                             fontSize: 14,
          //                             fontWeight: FontWeight.w400,
          //                             color: Colors.black)),

          //                             SizedBox(height: 10),
      
          //                              Text("Food Hygiene",
          //                         style: TextStyle(
                                     
          //                             fontSize: 14,
          //                             fontWeight: FontWeight.w400,
          //                             color: Colors.black)),

          //                              SizedBox(height: 10),
      
          //                              Text("Fire Awareness",
          //                         style: TextStyle(
                                      
          //                             fontSize: 14,
          //                             fontWeight: FontWeight.w400,
          //                             color: Colors.black)),

          //                              SizedBox(height: 10),
      
          //                              Text("Health and Safety",
          //                         style: TextStyle(
                                      
          //                             fontSize: 14,
          //                             fontWeight: FontWeight.w400,
          //                             color: Colors.black)),

          //                              SizedBox(height: 10),
      
          //                              Text("Infection Control",
          //                         style: TextStyle(
                                     
          //                             fontSize: 14,
          //                             fontWeight: FontWeight.w400,
          //                             color: Colors.black)),
          //     ],),
          //   ),

          //   Column(children: [
          //     Text("38%"),
          //     LinearProgressIndicator(
          //       value: 10,
          //       color: Color(0xffD9D9D9),
          //      // valueColor: Colors.green[800],
          //     )
          //   ],)
          // ],)
      
          
        ]),
      ),
    );
  }
}
