import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_d2d/connection/network_manager.dart';
import 'package:project_d2d/model/alert_messages.dart';
import 'package:project_d2d/model/base_response.dart';

class NotificationScreen extends StatefulWidget{
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  List<AlertMessages> notifications = [];

  @override
  void initState() {
    super.initState();

      Future.delayed(const Duration(milliseconds: 500), () {
      // staffProfile();
       notification();
    });
  
  }

  void notification() {
    NetworkManager.shared
        .notifications(NetworkManager.shared.userToken??'', "getStaffAlertbyid", NetworkManager.shared.staffId??0)
        .then((BaseResponse<List<AlertMessages>> response) {
      //  hideLoader();
      setState(() {
      notifications.clear();
      notifications.addAll(response.data!);
     
      //   emailSent = true;
      });
      
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
    body: Column(children: [

      Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_new)),
              SizedBox(
                width: 120,
              ),
              Text(
                "Notifications",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),

        Expanded(
          child: Container(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
               itemCount: notifications.length,
             itemBuilder: (BuildContext context, int index){
               return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(left:10, right:10),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notifications[index].alert.toString(),
                        // "",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                      Text(
                        notifications[index].subAlert.toString(),
                        style: TextStyle(color: Colors.black, fontSize: 12.0),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
          ),
              ),
            );
             }
          ),
          ),
        ),
    ]),
    
   );
  }
}