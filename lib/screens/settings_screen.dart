import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget{
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: Column(children: [
      Padding(
        padding: const EdgeInsets.only (top:50),
        child: Row(children: [
          IconButton(
                      onPressed: () {
                          Navigator.pop(context);

                      }, icon: Icon(Icons.arrow_back_ios_new)),

                      SizedBox(width: 120,),

                      Text("Settings", style: TextStyle(fontSize:18, fontWeight: FontWeight.w700 ),)
        ],),

       
      ),

       Row(children: [
          Padding(
            padding: const EdgeInsets.only(left:20, top:20),
            child: Text("Applications", style: TextStyle(fontSize:17, color: Color(0xff95969D), fontWeight: FontWeight.w700 )),
          )
        ],),

        Padding(
          padding: const EdgeInsets.only(top:10),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  
                },
                child: ListTile(
                  leading: Icon(Icons.person_outline),
                  title: Text("Profile", style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),),
                ),
              ),
               InkWell(
                onTap: () {
                  
                },
                child: ListTile(
                  leading: Icon(Icons.password_outlined),
                  title: Text("Change Password", style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),),
                ),
              ),
               InkWell(
                onTap: () {
                  
                },
                child: ListTile(
                  leading: Icon(Icons.work_history_outlined),
                  title: Text("Jobs", style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),),
                ),
              ),
               InkWell(
                onTap: () {
                  
                },
                child: ListTile(
                  leading: Icon(Icons.attach_money),
                  title: Text("Earnings", style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),),
                ),
              ),
               InkWell(
                onTap: () {
                  
                },
                child: ListTile(
                  leading: Icon(Icons.notification_add_outlined),
                  title: Text("Notifications", style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),),
                ),
              ),
               InkWell(
                onTap: () {
                  // color: Color(0xffE30000);
                },
                child: ListTile(
                  leading: Icon(Icons.delete_outline, color: Color(0xffE30000),),
                  title: Text("Delete Account", style: TextStyle(color: Color(0xffE30000), fontSize: 17, fontWeight: FontWeight.w500),),
                ),
              ),

               Row(children: [
          Padding(
            padding: const EdgeInsets.only(left:20, top:20),
            child: Text("About", style: TextStyle(fontSize:17, color: Color(0xff95969D), fontWeight: FontWeight.w700 )),
          )
        ],),
        Column(children: [
            InkWell(
                onTap: () {
                  // color: Color(0xffE30000);
                },
                child: ListTile(
                  leading: Icon(Icons.privacy_tip_outlined),
                  title: Text("Privacy", style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),),
                ),
              ),

              // InkWell(
              //   onTap: () {
              //     // color: Color(0xffE30000);
              //   },
              //   child: ListTile(
              //     leading: Icon(Icons.term),
              //     title: Text("Delete Account", style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),),
              //   ),
              // ),

              InkWell(
                onTap: () {
                  // color: Color(0xffE30000);
                },
                child: ListTile(
                  leading: Icon(Icons.delete_outline, color: Color(0xffE30000),),
                  title: Text("Delete Account", style: TextStyle(color: Color(0xffE30000), fontSize: 17, fontWeight: FontWeight.w500),),
                ),
              ),

              InkWell(
                onTap: () {
                  // color: Color(0xffE30000);
                },
                child: ListTile(
                  leading: Icon(Icons.delete_outline, color: Color(0xffE30000),),
                  title: Text("Delete Account", style: TextStyle(color: Color(0xffE30000), fontSize: 17, fontWeight: FontWeight.w500),),
                ),
              ),

              InkWell(
                onTap: () {
                  // color: Color(0xffE30000);
                },
                child: ListTile(
                  leading: Icon(Icons.delete_outline, color: Color(0xffE30000),),
                  title: Text("Delete Account", style: TextStyle(color: Color(0xffE30000), fontSize: 17, fontWeight: FontWeight.w500),),
                ),
              ),
        ],)
            ],
          ),
        )
    ]),
   );
  }
}