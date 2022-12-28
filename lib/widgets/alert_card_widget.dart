import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_d2d/base/base_stateful_state.dart';
import 'package:project_d2d/model/job_alert.dart';
import 'package:project_d2d/utils/constants.dart';

class AlertCardWidget extends StatefulWidget {
  const AlertCardWidget({super.key});

  @override
  State<AlertCardWidget> createState() => _AlertCardWidgetState();
}

class _AlertCardWidgetState extends BaseStatefulState <AlertCardWidget> {
  List<JobAlerts> jobalerts = [
    JobAlerts(dialougue: 'Gen Nurse Certificate', info: 'Exp on:15 Jul 2023',highPriority: true),
    JobAlerts(dialougue: '13 jobs cancelled so far', info: '',highPriority: false),
    JobAlerts(dialougue: 'You have got a 5 star rating', info: 'Agoda house',highPriority: false),
    JobAlerts(dialougue: 'Gen Nurse Certificate', info: 'Exp on:15 Jul 2023',highPriority: true),
    JobAlerts(dialougue: 'Gen Nurse Certificate', info: 'Exp on:15 Jul 2023',highPriority: true)
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: jobalerts.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ClipPath(
            child: Container(
              height: 40,
              width: 350,
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: (jobalerts[index].highPriority!)?Colors.redAccent:Colors.greenAccent, width: 5),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    jobalerts[index].dialougue ?? '',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: kFontWeight_M,
                    ),
                  ),
                  Spacer(),
                  Text(
                    jobalerts[index].info ?? '',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: kFontWeight_M,
                      color:(jobalerts[index].highPriority!)?Colors.redAccent:Colors.greenAccent,
                    ),
                  )
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
    );
  }
  
  @override
  bool isAuthenticationRequired() {
    // TODO: implement isAuthenticationRequired
    throw UnimplementedError();
  }
}
