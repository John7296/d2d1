import 'package:json_annotation/json_annotation.dart';
import 'package:project_d2d/model/alert_messages.dart';
import 'package:project_d2d/model/timesheetresult1.dart';
import 'package:project_d2d/model/timesheetresult2.dart';

part 'timesheetresponse.g.dart';

@JsonSerializable()
class TimeSheetResponse {
  @JsonKey(name: 'result1')
  List<TimeSheetResult1>? result1;

  @JsonKey(name: 'result2')
  List<TimeSheetResult2>? result2;

  TimeSheetResponse();

  factory TimeSheetResponse.fromJson(Map<String, dynamic> json) =>
      _$TimeSheetResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TimeSheetResponseToJson(this);
}
