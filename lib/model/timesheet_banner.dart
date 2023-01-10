import 'package:json_annotation/json_annotation.dart';

part 'timesheet_banner.g.dart';

@JsonSerializable()

class TimesheetBanner{

  @JsonKey(name: 'Pending')
  int?    Pending;

  @JsonKey(name: 'Approved')
  int? Approved;

@JsonKey(name: 'Completed')
 int? Completed;

 @JsonKey(name: 'currentJob')
 String? currentJob;

  @JsonKey(name: 'clientName')
 String? clientName;


TimesheetBanner({

  this.Pending,
  this.Approved,
  this.Completed,
  this.currentJob,
  this.clientName
 });

 factory TimesheetBanner.fromJson(Map<String, dynamic> json) =>
      _$TimesheetBannerFromJson(json);
  Map<String, dynamic> toJson() => _$TimesheetBannerToJson(this);

}