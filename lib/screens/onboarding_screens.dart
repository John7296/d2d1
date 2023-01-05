import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_d2d/model/onboard.dart';
import 'package:project_d2d/screens/login_screen.dart';
import 'package:project_d2d/screens/register_screen.dart';
import 'package:project_d2d/utils/constants.dart';
import 'package:project_d2d/utils/sessions_manager.dart';

class OnboardingScreens extends StatefulWidget {
  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  var _currentIndex = 0;
  List<OnBoard> _onBoardList = [];
  
  final _controller = PageController();
  Size stackSizeSize = Size(0.0, 0.0);

  @override
  void initState() {
    super.initState();

    _onBoardList.add(OnBoard("Be A Part Among Us",
        "Choose a brighter career with Day2Day\n Care Homes", "onboard1.png"));
    _onBoardList.add(OnBoard(
        "Skills Development",
        "Learn professional Home Care Skills from \n our expert panels of trainers ",
        "onboard2.png"));
    _onBoardList.add(OnBoard(
        "Make a Difference",
        "Get all set to work for your dream job and\n be happy when your client are",
        "onboard3.png"));
    _onBoardList.add(OnBoard(
        "Get Rewarded",
        "We want you to be recognised and\n rewarded for the work you do",
        "onboard4.png"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: _controller,
                    itemCount: _onBoardList.length,
                    onPageChanged: (value) {
                      setState(() {
                        _currentIndex = value;
                      });
                    },
                    itemBuilder: (context, position) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            // Expanded(
                            //   child:
                            // Stack(
                            // children: <Widget>[
                            // Container(
                            //   width: double.infinity,
                            //   height: 200,
                            //   decoration: new BoxDecoration(
                            //     color: Colors.green,
                            //     shape: BoxShape.circle,
                            //   ),
                            //   child: Text('Curved View'),
                            //   alignment: Alignment.center,
                            // ),
                            Container(
                              height:210,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(600),
                                  bottomRight: Radius.circular(600),
                                
                                ),
                                color: Color(0xfff9d7de),
                              ),
                            ),
                            // ClipPath(
                            //   clipper: CurvedBottomClipper(),
                            //   child: Container(
                            //     color: Color(0xfff9d7de),
                            //     height: 200,
                            //   ),
                            // ),

                            SizedBox(height: 40),
                           
                            Center(
                              child: Image(
                                image: AssetImage("assets/images/${_onBoardList[position].image}"),
                                fit: BoxFit.fill,
                              ),
                            ),

                            Text(
                              _onBoardList[position].title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xffFD425B)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Text(
                                _onBoardList[position].description,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 15.0, color: Color(0xff95969D)),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                // const SizedBox(
                //   height: 10,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_onBoardList.length,
                      (index) => createIndicatorCircle(index: index)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 40),
                  child: _currentIndex == 3
                      ? SizedBox(
                          width: double.infinity,
                          height:60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffFD425B),
                            ),
                            onPressed: () {
                              SessionsManager.saveOnBoarded("");

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterScreen()));
                            },
                            child: Center(
                                child: Text(
                              "Explore",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )),
                          ),
                          // ElevatedButton(
                          //   style: ButtonStyle(
                          //       backgroundColor:Color(0xffFD425B),
                          //           // MaterialStateProperty.all<Color>(
                          //           //     kAccentColor),
                          //       shape: MaterialStateProperty.all<
                          //               RoundedRectangleBorder>(
                          //           RoundedRectangleBorder(
                          //               borderRadius:
                          //                   BorderRadius.circular(5.0),
                          //               side: const BorderSide(
                          //                   color: kAccentColor, width: 2.0)))),
                          //   child: const Padding(
                          //     padding: EdgeInsets.symmetric(
                          //         vertical: 20.0, horizontal: 40.0),
                          //     child: Text('Explore',
                          //         style: TextStyle(
                          //             fontSize: 15.0, color: Colors.white)),
                          //   ),
                          //   onPressed: () {
                          //     SessionsManager.saveOnBoarded("");
                          //     Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) => LoginScreen()));

                          //     //replaceScreen(Routes.locationLead);
                          //   },
                          // ),
                        )
                      : Row(
                          children: [
                            Expanded(
                                child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    SessionsManager.saveOnBoarded("");
                                   Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterScreen()));
                                  },
                                  child: const Text(
                                    'Skip',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Color(0xff95969D)),
                                  ),
                                ),
                              ],
                            )),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          kAccentColor),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          side: const BorderSide(
                                              color: kAccentColor,
                                              width: 2.0)))),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 40.0),
                                child: Text(
                                  'Next',
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.white),
                                ),
                              ),
                              onPressed: () {
                                _controller.nextPage(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeInOut);
                              },
                            ),
                          ],
                        ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }

  createIndicatorCircle({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      margin: const EdgeInsets.only(right: 4),
      height: 5,
      width: _currentIndex == index ? 15 : 5,
      decoration: BoxDecoration(
        color: _currentIndex == index ? Color(0xffFD425B) : Color(0xffE4E5E7),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  @override
  bool isAuthenticationRequired() {
    return false;
  }
}

class CurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final roundingHeight = size.height * 5 / 5;

    final filledRectangle =
        Rect.fromLTRB(0, 0, size.width, size.height - roundingHeight);

    final roundingRectangle = Rect.fromLTRB(
        -6, size.height - roundingHeight * 2, size.width + 5, size.height);

    final path = Path();
    path.addRect(filledRectangle);

    path.arcTo(roundingRectangle, pi, -pi, true);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
