import 'package:flutter/material.dart';
import 'package:project_d2d/screens/about_screen.dart';
import 'package:project_d2d/screens/available_jobs_screen.dart';
import 'package:project_d2d/screens/change_password_screen.dart';
import 'package:project_d2d/screens/help_center_screen.dart';
import 'package:project_d2d/screens/notification_screen.dart';
import 'package:project_d2d/screens/privacy_policy_screen.dart';
import 'package:project_d2d/screens/profile_screen.dart';
import 'package:project_d2d/screens/profile_summary_screen.dart';
import 'package:project_d2d/screens/support_screen.dart';
import 'package:project_d2d/screens/terms_and_condition_screen.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
                "Settings",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Text("Applications",
                  style: TextStyle(
                      fontSize: 17,
                      color: Color(0xff95969D),
                      fontWeight: FontWeight.w700)),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfileScreen()));
                },
                child: ListTile(
                  leading: Icon(Icons.person_outline),
                  title: Text(
                    "Profile",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              InkWell(
                onTap: () {

                   Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChangePasswordScreen()));
                },
                child: ListTile(
                  leading: Icon(Icons.password_outlined),
                  title: Text(
                    "Change Password",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              InkWell(
                onTap: () {

                  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AvailableJobsScreen()));
                },
                child: ListTile(
                  leading: Icon(Icons.work_outline),
                  title: Text(
                    "Jobs",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              InkWell(
                onTap: () {

                  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfileSummaryScreen()));
                },
                child: ListTile(
                  leading: Icon(Icons.currency_pound_outlined),
                  title: Text(
                    "Earnings",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  
                  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>NotificationScreen()));

                },
                child: ListTile(
                  leading: Icon(Icons.notifications_active_outlined),
                  title: Text(
                    "Notifications",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // color: Color(0xffE30000);
                },
                child: ListTile(
                  leading: Icon(
                    Icons.delete_outline,
                    color: Color(0xffE30000),
                  ),
                  title: Text(
                    "Delete Account",
                    style: TextStyle(
                        color: Color(0xffE30000),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: Text("About",
                        style: TextStyle(
                            fontSize: 17,
                            color: Color(0xff95969D),
                            fontWeight: FontWeight.w700)),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                         Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>PrivacyPolicyScreen()));
                      },
                      child: ListTile(
                        leading: Icon(Icons.privacy_tip_outlined),
                        title: Text(
                          "Privacy",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>TermsAndConditionScreen()));
                      },
                      child: ListTile(
                        leading: Icon(Icons.note_add_outlined),
                        title: Text(
                          "Terms and Conditions",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                         Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>HelpCenterScreen()));
                      },
                      child: ListTile(
                        leading: Icon(Icons.help_center_outlined),
                        title: Text(
                          "Help Center",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                         Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>SupportScreen()));
                      },
                      child: ListTile(
                        leading: Icon(Icons.support_outlined),
                        title: Text(
                          "Support",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>AboutScreen()));
                      },
                      child: ListTile(
                        leading: Icon(Icons.info_outline),
                        title: Text(
                          "About",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
