import 'package:json_annotation/json_annotation.dart';

part 'timesheet.g.dart';

@JsonSerializable()
class TimeSheet {
  @JsonKey(name: 'jobPending')
  int? jobPending;

  @JsonKey(name: 'jobApproved')
  int? jobApproved;

  @JsonKey(name: 'jobCompleted')
  int? jobCompleted;

  @JsonKey(name: 'currentJob')
  String? currentJob;

 


  TimeSheet({
this.currentJob,this.jobApproved,this.jobCompleted,this.jobPending  });

  factory TimeSheet.fromJson(Map<String, dynamic> json) =>
      _$TimeSheetFromJson(json);
  Map<String, dynamic> toJson() => _$TimeSheetToJson(this);
}
