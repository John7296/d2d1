import 'package:json_annotation/json_annotation.dart';

part 'timesheetresult1.g.dart';

@JsonSerializable()
class TimeSheetResult1 {


  @JsonKey(name: 'catName')
  String? catName;

  @JsonKey(name: 'clientName')
  String? clientName;

  @JsonKey(name: 'shiftName')
  String? shiftName;

  @JsonKey(name: 'jobPostDate')
  String? jobPostDate;

  @JsonKey(name: 'jobLocation')
  String? jobLocation;




  TimeSheetResult1(
      {this.catName,this.clientName,this.jobLocation,this.jobPostDate,this.shiftName});

  factory TimeSheetResult1.fromJson(Map<String, dynamic> json) =>
      _$TimeSheetResult1FromJson(json);
  Map<String, dynamic> toJson() => _$TimeSheetResult1ToJson(this);
}
