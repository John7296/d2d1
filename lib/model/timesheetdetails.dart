import 'package:json_annotation/json_annotation.dart';

part 'timesheetdetails.g.dart';

@JsonSerializable()
class TimeSheetDetails {
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

  TimeSheetDetails(
      {this.breakTime,
      this.clientId,
      this.clientName,
      this.createdOn,
      this.endtime,
      this.starttime,
      this.status,
      this.timesheetId});

  factory TimeSheetDetails.fromJson(Map<String, dynamic> json) =>
      _$TimeSheetDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$TimeSheetDetailsToJson(this);
}
