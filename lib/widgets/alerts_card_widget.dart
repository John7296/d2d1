import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_d2d/model/alerts_model.dart';
import 'package:project_d2d/utils/constants.dart';

class AlertCard extends StatefulWidget {
  const AlertCard({super.key});

  @override
  State<AlertCard> createState() => _AlertCardState();
}

class _AlertCardState extends State<AlertCard> {
  List<Alerts> alerts = [
    Alerts(dialougue: 'Gen Nurse Certificate', info: 'Exp on:15 Jul 2023',highPriority: true),
    Alerts(dialougue: '13 jobs cancelled so far', info: '',highPriority: false),
    Alerts(dialougue: 'You have got a 5 star rating', info: 'Agoda house',highPriority: false),
    Alerts(dialougue: 'Gen Nurse Certificate', info: 'Exp on:15 Jul 2023',highPriority: true),
    Alerts(dialougue: 'Gen Nurse Certificate', info: 'Exp on:15 Jul 2023',highPriority: true)
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: alerts.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ClipPath(
            child: Container(
              height: 40,
              width: 350,
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: (alerts[index].highPriority!)?Colors.redAccent:Colors.greenAccent, width: 5),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    alerts[index].dialougue ?? '',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: kFontWeight_M,
                    ),
                  ),
                  Spacer(),
                  Text(
                    alerts[index].info ?? '',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: kFontWeight_M,
                      color:(alerts[index].highPriority!)?Colors.redAccent:Colors.greenAccent,
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
}
