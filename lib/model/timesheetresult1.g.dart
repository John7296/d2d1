// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timesheetresult1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeSheetResult1 _$TimeSheetResult1FromJson(Map<String, dynamic> json) =>
    TimeSheetResult1(
      catName: json['catName'] as String?,
      clientName: json['clientName'] as String?,
      jobLocation: json['jobLocation'] as String?,
      jobPostDate: json['jobPostDate'] as String?,
      shiftName: json['shiftName'] as String?,
    );

Map<String, dynamic> _$TimeSheetResult1ToJson(TimeSheetResult1 instance) =>
    <String, dynamic>{
      'catName': instance.catName,
      'clientName': instance.clientName,
      'shiftName': instance.shiftName,
      'jobPostDate': instance.jobPostDate,
      'jobLocation': instance.jobLocation,
    };
