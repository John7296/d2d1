import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:project_d2d/base/base_stateful_state.dart';
import 'package:project_d2d/connection/network_manager.dart';
import 'package:project_d2d/model/base_response.dart';
import 'package:project_d2d/model/settings.dart';
import 'package:project_d2d/utils/constants.dart';

class TermsAndConditionScreen extends StatefulWidget {
  @override
  State<TermsAndConditionScreen> createState() =>
      _TermsAndConditionScreenState();
}

class _TermsAndConditionScreenState
    extends BaseStatefulState<TermsAndConditionScreen> {
  List<Settings> terms = [];

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {
      // staffProfile();
      termsCondition();
    });
  }

  void termsCondition() {
    showLoader();
    NetworkManager.shared
        .settings("getSettings")
        .then((BaseResponse<List<Settings>> response) {
      hideLoader();
      setState(() {
        terms.clear();
        terms.addAll(response.data!);
      });

      // var privacy = policy.where((element)=>element.stKey=="privacy");
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
      appBar: AppBar(
        centerTitle: true,
        title: Text("Terms and Conditions"),
        titleTextStyle: TextStyle(
            fontSize: 18,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w700,
            color: Colors.black),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(children: [
        //  Padding(
        //   padding: const EdgeInsets.only(top: 50),
        //   child: Row(
        //     children: [
        //       IconButton(
        //           onPressed: () {
        //             Navigator.pop(context);
        //           },
        //           icon: Icon(Icons.arrow_back_ios_new)),
        //       SizedBox(
        //         width: 82,
        //       ),
        //       Center(
        //         child: Text(
        //           "Terms and Condition",
        //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(5)),
              child: ListView.builder(
                itemCount: terms.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          //color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (terms[index].stKey == "termsandconditions")
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child:
                                  //  Text(terms[index].stValue.toString(), maxLines: 40),
                                  Html(
                                data: terms[index].stValue.toString(),
                                defaultTextStyle: TextStyle(
                                     fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                    ),

                                // defaultTextStyle: TextStyle(
                                //   fontSize: 13,
                                //   fontFamily: "Poppins",
                                //   color: Colors.black,
                                // ),

                                // style: {
                                //   "body": Style(
                                //     fontSize: FontSize(15.0),
                                //     fontFamily: "Poppins",
                                //   ),
                                // },
                                // "Key Features",
                                // style: TextStyle(
                                //     color: Color(0xff6e706d),
                                //     fontSize: 13,
                                //     fontWeight: FontWeight.w300),
                                // maxLines: 10,
                              ),
                            ),
                        ],
                      ));
                },
              ),
            ),
          ),
        ),
      ]),
    );
  }

  @override
  bool isAuthenticationRequired() {
    // TODO: implement isAuthenticationRequired
    throw UnimplementedError();
  }
}
