import 'package:json_annotation/json_annotation.dart';

part 'timesheet_banner.g.dart';

@JsonSerializable()

class TimesheetBanner{

  @JsonKey(name: 'Pending')
  int?    pending;

  @JsonKey(name: 'Approved')
  int? approved;

@JsonKey(name: 'Completed')
 int? completed;

 @JsonKey(name: 'currentJob')
 String? currentJob;

  @JsonKey(name: 'clientName')
 String? clientName;


TimesheetBanner({

  this.pending,
  this.approved,
  this.completed,
  this.currentJob,
  this.clientName
 });

 factory TimesheetBanner.fromJson(Map<String, dynamic> json) =>
      _$TimesheetBannerFromJson(json);
  Map<String, dynamic> toJson() => _$TimesheetBannerToJson(this);

}