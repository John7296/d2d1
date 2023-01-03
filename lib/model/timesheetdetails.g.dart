// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timesheetdetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeSheetDetails _$TimeSheetDetailsFromJson(Map<String, dynamic> json) =>
    TimeSheetDetails(
      breakTime: json['breakTime'] as String?,
      clientId: json['clientId'] as int?,
      clientName: json['clientName'] as String?,
      createdOn: json['createdOn'] as String?,
      endtime: json['endtime'] as String?,
      starttime: json['starttime'] as String?,
      status: json['status'] as String?,
      timesheetId: json['timesheetId'] as int?,
    );

Map<String, dynamic> _$TimeSheetDetailsToJson(TimeSheetDetails instance) =>
    <String, dynamic>{
      'clientId': instance.clientId,
      'clientName': instance.clientName,
      'timesheetId': instance.timesheetId,
      'createdOn': instance.createdOn,
      'starttime': instance.starttime,
      'breakTime': instance.breakTime,
      'endtime': instance.endtime,
      'status': instance.status,
    };
