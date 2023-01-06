import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_d2d/base/base_stateful_state.dart';
import 'package:project_d2d/screens/available_jobs_screen.dart';
import 'package:project_d2d/screens/home_detail_screen.dart';
import 'package:project_d2d/screens/job_applied_successful_screen.dart';
import 'package:project_d2d/screens/job_cancel_screen.dart';
import 'package:project_d2d/screens/job_cancelled_successful_screen.dart';
import 'package:project_d2d/screens/job_details_screen.dart';
import 'package:project_d2d/screens/logoutscreen.dart';
import 'package:project_d2d/screens/profile_screen.dart';
import 'package:project_d2d/screens/settings_screen.dart';
import 'package:project_d2d/screens/timesheet_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseStatefulState<HomeScreen> {
  int selectedindex = 0;
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              selectedindex = index;
            });
            // pageChanged(index);
          },
          children: <Widget>[
            HomeDetailScreen(),
            AvailableJobsScreen(),
            ProfileScreen(),
            SettingsScreen(),
            LogoutScreen(),
            
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey.shade600,
        currentIndex: selectedindex,
        onTap: selectedPage,
        items: [
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/ic_home.png"),
                size: 25,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/ic_briefcase.png"),
                size: 25,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon:ImageIcon(
                AssetImage("assets/images/ic_user.png"),
                size: 25,
              ), label: ""),
               BottomNavigationBarItem(
              icon:ImageIcon(
                AssetImage("assets/images/ic_settings.png"),
                size: 25,
              ), label: ""),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/ic_log-out.png"),
                size: 25,
              ), label: ""),
        ],
        selectedLabelStyle: TextStyle(fontFamily: 'Intro'),
        selectedFontSize: 0,
        unselectedLabelStyle: TextStyle(fontFamily: 'Intro'),
        unselectedFontSize: 0,
      ),
    );
  }

  void selectedPage(int index) {
    setState(() {
      selectedindex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  bool isAuthenticationRequired() {
    // TODO: implement isAuthenticationRequired
    throw UnimplementedError();
  }
}
