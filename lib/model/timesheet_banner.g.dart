// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timesheet_banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimesheetBanner _$TimesheetBannerFromJson(Map<String, dynamic> json) =>
    TimesheetBanner(
      Pending: json['Pending'] as int?,
      Approved: json['Approved'] as int?,
      Completed: json['Completed'] as int?,
      currentJob: json['currentJob'] as String?,
      clientName: json['clientName'] as String?,
    );

Map<String, dynamic> _$TimesheetBannerToJson(TimesheetBanner instance) =>
    <String, dynamic>{
      'Pending': instance.Pending,
      'Approved': instance.Approved,
      'Completed': instance.Completed,
      'currentJob': instance.currentJob,
      'clientName': instance.clientName,
    };
