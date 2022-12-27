import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_d2d/utils/constants.dart';

class TimeSheetHome extends StatefulWidget {
  const TimeSheetHome({super.key});

  @override
  State<TimeSheetHome> createState() => _TimeSheetHomeState();
}

class _TimeSheetHomeState extends State<TimeSheetHome> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 120,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              // color: Colors.redAccent,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.pink.shade300, Colors.pink.shade100],
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 5, 15, 5),
                      child: Image.asset(
                        'assets/images/time.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: Colors.redAccent,
                  ),
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                      color: Colors.redAccent,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: Text(
                          '78',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: kFontWeight_SB,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Pending",
                  style: TextStyle(fontSize: 12, fontWeight: kFontWeight_M),
                ),
                Text(
                  "current job",
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 120,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              // color: Colors.redAccent,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.green, Colors.green.shade100],
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 5, 15, 5),
                      child: Image.asset(
                        'assets/images/time.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: Colors.redAccent,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text(
                        '78',
                        style: TextStyle(
                          fontWeight: kFontWeight_SB,
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Approved",
                  style: TextStyle(fontSize: 12, fontWeight: kFontWeight_M),
                ),
                Text(
                  "current job",
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 120,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              // color: Colors.redAccent,
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.yellow, Colors.yellow.shade100]),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 5, 15, 5),
                      child: Image.asset(
                        'assets/images/time.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: Colors.redAccent,
                  ),
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      color: Colors.redAccent,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Text(
                          '78',
                          style: TextStyle(
                            fontWeight: kFontWeight_SB,
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Completed",
                  style: TextStyle(fontSize: 12, fontWeight: kFontWeight_M),
                ),
                Text(
                  "current job",
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
