// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timesheetresponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeSheetResponse _$TimeSheetResponseFromJson(Map<String, dynamic> json) =>
    TimeSheetResponse()
      ..result1 = (json['result1'] as List<dynamic>?)
          ?.map((e) => TimeSheetResult1.fromJson(e as Map<String, dynamic>))
          .toList()
      ..result2 = (json['result2'] as List<dynamic>?)
          ?.map((e) => TimeSheetResult2.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$TimeSheetResponseToJson(TimeSheetResponse instance) =>
    <String, dynamic>{
      'result1': instance.result1,
      'result2': instance.result2,
    };
