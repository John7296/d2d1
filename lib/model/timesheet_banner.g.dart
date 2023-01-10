// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timesheet_banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimesheetBanner _$TimesheetBannerFromJson(Map<String, dynamic> json) =>
    TimesheetBanner(
      pending: json['Pending'] as int?,
      approved: json['Approved'] as int?,
      completed: json['Completed'] as int?,
      currentJob: json['currentJob'] as String?,
      clientName: json['clientName'] as String?,
    );

Map<String, dynamic> _$TimesheetBannerToJson(TimesheetBanner instance) =>
    <String, dynamic>{
      'Pending': instance.pending,
      'Approved': instance.approved,
      'Completed': instance.completed,
      'currentJob': instance.currentJob,
      'clientName': instance.clientName,
    };
