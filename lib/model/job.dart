import 'package:json_annotation/json_annotation.dart';

part 'job.g.dart';

@JsonSerializable()
class Job {
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

  @JsonKey(name: 'isRequsted')
  int? isRequsted;

  @JsonKey(name: 'jobId')
  int? jobId;

  @JsonKey(name: 'allocatedStaff')
  String? allocatedStaff;

  @JsonKey(name: 'jobStatus')
  String? jobStatus;

  Job(
      {this.clientName,
      this.isRequsted,
      this.endDateTime,
      this.hourlyRate,
      this.jobCatName,
      this.jobLocation,
      this.jobNumber,
      this.shiftName,
      this.startDateTime,
      this.allocatedStaff,
      this.jobId,
      this.jobStatus});

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);
  Map<String, dynamic> toJson() => _$JobToJson(this);
}
