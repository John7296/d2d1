import 'package:json_annotation/json_annotation.dart';

part 'timesheetresult2.g.dart';

@JsonSerializable()
class TimeSheetResult2 {
  @JsonKey(name: 'clientId')
  int? clientId;

  @JsonKey(name: 'clientName')
  String? clientName;

  @JsonKey(name: 'timesheetId')
  int? timesheetId;

  @JsonKey(name: 'createdOn')
  String? createdOn;

  @JsonKey(name: 'starttime')
  String? starttime;

  @JsonKey(name: 'breakTime')
  String? breakTime;

  @JsonKey(name: 'endtime')
  String? endtime;

  @JsonKey(name: 'status')
  String? status;

  TimeSheetResult2(
      {this.breakTime,
      this.clientId,
      this.clientName,
      this.createdOn,
      this.endtime,
      this.starttime,
      this.status,
      this.timesheetId});

  factory TimeSheetResult2.fromJson(Map<String, dynamic> json) =>
      _$TimeSheetResult2FromJson(json);
  Map<String, dynamic> toJson() => _$TimeSheetResult2ToJson(this);
}
