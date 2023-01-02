// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timesheet_banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimesheetBanner _$TimesheetBannerFromJson(Map<String, dynamic> json) =>
    TimesheetBanner(
      jobPending: json['jobPending'] as int?,
      jobApproved: json['jobApproved'] as int?,
      jobCompleted: json['jobCompleted'] as int?,
      currentJob: json['currentJob'] as String?,
      clientName: json['clientName'] as String?,
    );

Map<String, dynamic> _$TimesheetBannerToJson(TimesheetBanner instance) =>
    <String, dynamic>{
      'jobPending': instance.jobPending,
      'jobApproved': instance.jobApproved,
      'jobCompleted': instance.jobCompleted,
      'currentJob': instance.currentJob,
      'clientName': instance.clientName,
    };
