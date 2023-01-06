// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Job _$JobFromJson(Map<String, dynamic> json) => Job(
      clientName: json['clientName'] as String?,
      isRequsted: json['isRequsted'] as String?,
      endDateTime: json['endDateTime'] as String?,
      hourlyRate: (json['hourlyRate'] as num?)?.toDouble(),
      jobCatName: json['jobCatName'] as String?,
      jobLocation: json['jobLocation'] as String?,
      jobNumber: json['jobNumber'] as String?,
      shiftName: json['shiftName'] as String?,
      startDateTime: json['startDateTime'] as String?,
      allocatedStaff: json['allocatedStaff'] as String?,
      jobId: json['jobId'] as int?,
    );

Map<String, dynamic> _$JobToJson(Job instance) => <String, dynamic>{
      'jobNumber': instance.jobNumber,
      'jobCatName': instance.jobCatName,
      'jobLocation': instance.jobLocation,
      'clientName': instance.clientName,
      'hourlyRate': instance.hourlyRate,
      'shiftName': instance.shiftName,
      'startDateTime': instance.startDateTime,
      'endDateTime': instance.endDateTime,
      'isRequsted': instance.isRequsted,
      'jobId': instance.jobId,
      'allocatedStaff': instance.allocatedStaff,
    };
