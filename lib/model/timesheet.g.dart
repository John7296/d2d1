// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timesheet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeSheet _$TimeSheetFromJson(Map<String, dynamic> json) => TimeSheet(
      currentJob: json['currentJob'] as String?,
      Approved: json['Approved'] as int?,
      Completed: json['Completed'] as int?,
      Pending: json['Pending'] as int?,
    )..clientName = json['clientName'] as String?;

Map<String, dynamic> _$TimeSheetToJson(TimeSheet instance) => <String, dynamic>{
      'Pending': instance.Pending,
      'Approved': instance.Approved,
      'Completed': instance.Completed,
      'currentJob': instance.currentJob,
      'clientName': instance.clientName,
    };
