import 'package:json_annotation/json_annotation.dart';

part 'jobdetails.g.dart';

@JsonSerializable()
class JobDetails {
  @JsonKey(name: 'jobNumber')
  String? jobNumber;

  @JsonKey(name: 'jobCatName')
  String? jobCatName;

  @JsonKey(name: 'jobLocation')
  String? jobLocation;

  @JsonKey(name: 'careHomeName')
  String? careHomeName;

  @JsonKey(name: 'hourlyRate')
  double? hourlyRate;

  @JsonKey(name: 'allocatedStaff')
  String? allocatedStaff;

  @JsonKey(name: 'shiftName')
  String? shiftName;

  @JsonKey(name: 'startDateTime')
  String? startDateTime;

  @JsonKey(name: 'endDateTime')
  String? endDateTime;

  @JsonKey(name: 'jobDescription')
  String? jobDescription;

  @JsonKey(name: 'comments')
  String? comments;

  JobDetails(
      {this.endDateTime,
      this.hourlyRate,
      this.jobCatName,
      this.jobLocation,
      this.jobNumber,
      this.shiftName,
      this.startDateTime,
      this.allocatedStaff,
      this.careHomeName,
      this.comments,
      this.jobDescription});

  factory JobDetails.fromJson(Map<String, dynamic> json) => _$JobDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$JobDetailsToJson(this);
}
