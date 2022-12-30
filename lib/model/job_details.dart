import 'package:json_annotation/json_annotation.dart';

part 'job_details.g.dart';

@JsonSerializable()
class JobDetails {
  @JsonKey(name: 'jobNumber')
  String? jobNumber;

  @JsonKey(name: 'jobCatName')
  String? jobCatName;

  @JsonKey(name: 'jobLocation')
  String? jobLocation;

  @JsonKey(name: 'clientName')
  String? clientName;

  @JsonKey(name: 'hourlyRate')
  double? hourlyRate;

  @JsonKey(name: 'shiftName')
  String? shiftName;

  @JsonKey(name: 'startDateTime')
  String? startDateTime;

  @JsonKey(name: 'endDateTime')
  String? endDateTime;


  JobDetails({
  this.clientName,
  this.endDateTime,this.hourlyRate,this.jobCatName,this.jobLocation,this.jobNumber,this.shiftName,this.startDateTime
  });

  factory JobDetails.fromJson(Map<String, dynamic> json) =>
      _$JobDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$JobDetailsToJson(this);
}
