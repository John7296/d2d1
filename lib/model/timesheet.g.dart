// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timesheet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeSheet _$TimeSheetFromJson(Map<String, dynamic> json) => TimeSheet(
      currentJob: json['currentJob'] as String?,
      jobApproved: json['jobApproved'] as int?,
      jobCompleted: json['jobCompleted'] as int?,
      jobPending: json['jobPending'] as int?,
    );

Map<String, dynamic> _$TimeSheetToJson(TimeSheet instance) => <String, dynamic>{
      'jobPending': instance.jobPending,
      'jobApproved': instance.jobApproved,
      'jobCompleted': instance.jobCompleted,
      'currentJob': instance.currentJob,
    };
