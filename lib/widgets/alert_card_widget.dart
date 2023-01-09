import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_d2d/base/base_stateful_state.dart';
import 'package:project_d2d/connection/network_manager.dart';
import 'package:project_d2d/model/alert.dart';
import 'package:project_d2d/model/alert_messages.dart';
import 'package:project_d2d/model/base_response.dart';
import 'package:project_d2d/utils/constants.dart';
import 'package:project_d2d/utils/sessions_manager.dart';

class AlertCardWidget extends StatefulWidget {
  const AlertCardWidget({super.key});

  @override
  State<AlertCardWidget> createState() => _AlertCardWidgetState();
}

class _AlertCardWidgetState extends BaseStatefulState<AlertCardWidget> {
  List<AlertMessages> alertList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getAlertDetails();
  }

  void getAlertDetails() {
    NetworkManager.shared
        .alerMessages(
      NetworkManager.shared.userToken!,
      "getStaffAlertbyid",
      NetworkManager.shared.staffId.toString(),
      "multiple",
    )
        .then((BaseResponse<Alert> response) {
      setState(() {
        alertList.clear();
        alertList.addAll(response.data!.result1!);
      });
    }).catchError((e) {
      print(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return (alertList.isNotEmpty)
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: alertList.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ClipPath(
                  child: Container(
                    height: 40,
                    width: 350,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                            color:
                                // (alertList[index].alert??'')
                                // ?
                                Colors.redAccent,
                            // : Colors.greenAccent,
                            width: 5),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          alertList[index].alert ?? '',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: kFontWeight_M,
                          ),
                        ),
                        Spacer(),
                        Text(
                          alertList[index].subAlert ?? '',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: kFontWeight_M,
                              color:
                                  // (jobalerts[index].highPriority!)
                                  // ?
                                  Colors.redAccent
                              // : Colors.greenAccent,
                              ),
                        ),
                      ],
                    ),
                  ),
                  clipper: ShapeBorderClipper(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              );
            },
          )
        : Text("No data");
  }

  @override
  bool isAuthenticationRequired() {
    // TODO: implement isAuthenticationRequired
    throw UnimplementedError();
  }
}
