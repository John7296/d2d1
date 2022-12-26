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
import 'package:project_d2d/screens/profile_screen.dart';
import 'package:project_d2d/screens/timesheet_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
            TimeSheetScreen(),
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
              icon: Icon(Icons.home_rounded,size: 35,),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.cases_rounded, size: 30),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined,size: 35),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.logout_rounded,size: 35),
              label: ""),
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
