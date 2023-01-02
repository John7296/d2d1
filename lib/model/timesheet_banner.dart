import 'package:json_annotation/json_annotation.dart';

part 'timesheet_banner.g.dart';

@JsonSerializable()

class TimesheetBanner{

  @JsonKey(name: 'jobPending')
  int?    jobPending;

  @JsonKey(name: 'jobApproved')
  int? jobApproved;

@JsonKey(name: 'jobCompleted')
 int? jobCompleted;

 @JsonKey(name: 'currentJob')
 String? currentJob;

  @JsonKey(name: 'clientName')
 String? clientName;


TimesheetBanner({

  this.jobPending,
  this.jobApproved,
  this.jobCompleted,
  this.currentJob,
  this.clientName
 });

 factory TimesheetBanner.fromJson(Map<String, dynamic> json) =>
      _$TimesheetBannerFromJson(json);
  Map<String, dynamic> toJson() => _$TimesheetBannerToJson(this);

}