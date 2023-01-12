import 'package:json_annotation/json_annotation.dart';

part 'timesheet.g.dart';

@JsonSerializable()
class TimeSheet {
  @JsonKey(name: 'Pending')
  int? Pending;

  @JsonKey(name: 'Approved')
  int? Approved;

  @JsonKey(name: 'Completed')
  int? Completed;

  @JsonKey(name: 'currentJob')
  String? currentJob;

    @JsonKey(name: 'clientName')
  String? clientName;


 


  TimeSheet({
this.currentJob,this.Approved,this.Completed,this.Pending });

  factory TimeSheet.fromJson(Map<String, dynamic> json) =>
      _$TimeSheetFromJson(json);
  Map<String, dynamic> toJson() => _$TimeSheetToJson(this);
}
