import 'package:project_d2d/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordConfirmationScreen extends StatefulWidget {
  @override
  State<PasswordConfirmationScreen> createState() =>
      _PasswordConfirmationScreenState();
}

class _PasswordConfirmationScreenState
    extends State<PasswordConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    size: 30,
                  )),
            ],
          ),
        ),
        Container(
          height: 80,
          width: 210,
          child: Image(
            image: AssetImage("assets/images/logo-d2d.png"),
            fit: BoxFit.fill,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Container(
            height: 200,
            width: 200,
            child: Image(
              image: AssetImage("assets/images/confirmation.jpg"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Text("Confirmation",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w700)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
          child: Center(
            child: Text("Your password has been change. Please ",
                maxLines: 1,
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xffAFB0B6),
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Center(
            child: Text("login with your new password",
                maxLines: 1,
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xffAFB0B6),
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
          child: Container(
            height: 60,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffFD425B),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Center(
                  child: Text(
                "Log in",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              )),
            ),
          ),
        ),
      ],
    ));
  }
}
