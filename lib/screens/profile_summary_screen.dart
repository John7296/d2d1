import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:project_d2d/screens/settings_screen.dart';
import 'package:project_d2d/utils/constants.dart';

class ProfileSummaryScreen extends StatefulWidget {
  @override
  State<ProfileSummaryScreen> createState() => _ProfileSummaryScreenState();
}

class _ProfileSummaryScreenState extends State<ProfileSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                            fontWeight: FontWeight.w900,
                            color: Color(0xffAFB0B6),
                            fontSize: 13)))
              ],
            ),
          ),
          CircleAvatar(
            radius: 50,
            backgroundColor: Color(0xffF3B7BF),
            child: CircleAvatar(
              radius: 35,
              child: Image(
                image: AssetImage("assets/images/profile_img.png"),
              ),
            ),
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "Mary James",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
          )),
          Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              "Theatre practitioner",
              style: TextStyle(color: Color(0xff95969D), fontSize: 13),
            ),
          )),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(10),
              color: Color(0xff95969D),
              strokeWidth: 2, //thickness of dash/dots
              dashPattern: [3, 3],
              child: Container(
                height: 80,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffA7F0B3),
                ),
                child: Center(
                  child: Text(
                    "\$ 3425.00",
                    style: TextStyle(
                        color: Color(0xff07701E),
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Row(
              children: [
                Text("Payment History",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: DataTable(
              headingRowColor: MaterialStateColor.resolveWith(
                  (states) => Color(0xffFF9AA8).withOpacity(0.5)),
              horizontalMargin: 3,
              headingRowHeight: 40,
              columnSpacing: 30,
              dataRowHeight: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffCECCDD), width: 1),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              columns: [
                DataColumn(label: Text("Date", style: TextStyle(color: Color(0xff4A4646), fontSize: 13),)),
                DataColumn(label: Text("Mode of Payment", style: TextStyle(color: Color(0xff4A4646),fontSize: 13),)),
                DataColumn(label: Padding(
                  padding: const EdgeInsets.only(left:25),
                  child: Text("Status", style: TextStyle(color: Color(0xff4A4646),fontSize: 13),),
                ))
              ],
              rows: <DataRow>[
                DataRow(cells: <DataCell>[
                  DataCell(Text(
                    '25-Aug-2022',
                    style: TextStyle(fontSize: 12, color: Color(0xff666666)),
                  )),
                  DataCell(Text('Bank Transfer', style: TextStyle(fontSize: 13, color: Color(0xff666666)),),),
                  DataCell(Container(
                    height: 25,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Color(0xffC8F8B8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text("Credited", style: TextStyle(fontSize: 13, color: Color(0xff666666)),)),
                  )),
                ]),
                DataRow(cells: <DataCell>[
                  DataCell(Text(
                    '28-Apr-2022',
                    style: TextStyle(fontSize: 12, color: Color(0xff666666),),
                  )),
                  DataCell(Text('Bank Transfer', style: TextStyle(fontSize: 13, color: Color(0xff666666)),)),
                  DataCell(Container(
                    height: 25,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Color(0xffC8F8B8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text("Credited", style: TextStyle(fontSize: 13, color: Color(0xff666666)),)),
                  )),
                ]),
                DataRow(cells: <DataCell>[
                  DataCell(Text(
                    '09-Mar-2022',
                    style: TextStyle(fontSize: 13,  color: Color(0xff666666)),
                  )),
                  DataCell(Text('Bank Transfer', style: TextStyle(fontSize: 13, color: Color(0xff666666)),)),
                  DataCell(Container(
                    height: 25,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Color(0xffC8F8B8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text("Credited", style: TextStyle(fontSize: 13, color: Color(0xff666666)),)),
                  )),
                ]),
                DataRow(cells: <DataCell>[
                  DataCell(Text(
                    '05-Jan-2022',
                    style: TextStyle(fontSize: 13, color: Color(0xff666666),),
                  )),
                  DataCell(Text('Online', style: TextStyle(fontSize: 13, color: Color(0xff666666)),)),
                  DataCell(Container(
                    height: 25,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Color(0xffC8F8B8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text("Credited", style: TextStyle(fontSize: 13, color: Color(0xff666666)),)),
                  )),
                ]),
                DataRow(cells: <DataCell>[
                  DataCell(Text(
                    '28-Apr-2022',
                    style: TextStyle(fontSize: 13, color: Color(0xff666666)),
                  )),
                  DataCell(Text('Chequeue', style: TextStyle(fontSize: 13, color: Color(0xff666666)),)),
                  DataCell(Container(
                    height: 25,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Color(0xffC8F8B8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text("Credited", style: TextStyle(fontSize: 13, color: Color(0xff666666)),)),
                  )),
                ]),
                DataRow(cells: <DataCell>[
                  DataCell(Text(
                    '09-Mar-2022',
                    style: TextStyle(fontSize: 13,  color: Color(0xff666666),),
                  )),
                  DataCell(Text('Bank Transfer', style: TextStyle(fontSize: 13, color: Color(0xff666666)),)),
                  DataCell(Container(
                    height: 25,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Color(0xffC8F8B8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text("Credited", style: TextStyle(fontSize: 13, color: Color(0xff666666)),)),
                  )),
                ]),
                DataRow(cells: <DataCell>[
                  DataCell(Text(
                    '05-Jun-2022',
                    style: TextStyle(fontSize: 13, color: Color(0xff666666)),
                  )),
                  DataCell(Text('Online', style: TextStyle(fontSize: 13, color: Color(0xff666666)),)),
                  DataCell(Container(
                    height: 25,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Color(0xffC8F8B8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text("Credited", style: TextStyle(fontSize: 13, color: Color(0xff666666)),)),
                  )),
                ]),
                DataRow(cells: <DataCell>[
                  DataCell(Text(
                    '28-Apr-2022',
                    style: TextStyle(fontSize: 13,  color: Color(0xff666666)),
                  )),
                  DataCell(Text('Chequeue', style: TextStyle(fontSize: 13, color: Color(0xff666666)),)),
                  DataCell(Container(
                    height: 25,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Color(0xffC8F8B8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text("Credited", style: TextStyle(fontSize: 13, color: Color(0xff666666)),)),
                  )),
                ]),
                DataRow(cells: <DataCell>[
                  DataCell(Text(
                    '09-Mar-2022',
                    style: TextStyle(fontSize: 13,  color: Color(0xff666666),),
                  )),
                  DataCell(Text('Bank Transfer', style: TextStyle(fontSize: 13, color: Color(0xff666666)),)),
                  DataCell(Container(
                    height: 25,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Color(0xffC8F8B8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text("Credited", style: TextStyle(fontSize: 13, color: Color(0xff666666)),)),
                  )),
                ]),
                DataRow(cells: <DataCell>[
                  DataCell(Text(
                    '05-Apr-2022',
                    style: TextStyle(fontSize: 13, color: Color(0xff666666),),
                  )),
                  DataCell(Text('Online', style: TextStyle(fontSize: 13, color: Color(0xff666666)),)),
                  DataCell(Container(
                    height: 25,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Color(0xffC8F8B8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text("Credited", style: TextStyle(fontSize: 13, color: Color(0xff666666)),)),
                  )),
                ]),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Container(
              height: 50,
              width: 160,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffFD425B),
                ),
                onPressed: () {
                   Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                         SettingsScreen()));
                },
                child: Center(
                    child: Text(
                  "Contact Us",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                )),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
