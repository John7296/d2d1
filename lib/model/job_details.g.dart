// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobDetails _$JobDetailsFromJson(Map<String, dynamic> json) => JobDetails(
      clientName: json['clientName'] as String?,
      endDateTime: json['endDateTime'] as String?,
      hourlyRate: (json['hourlyRate'] as num?)?.toDouble(),
      jobCatName: json['jobCatName'] as String?,
      jobLocation: json['jobLocation'] as String?,
      jobNumber: json['jobNumber'] as String?,
      shiftName: json['shiftName'] as String?,
      startDateTime: json['startDateTime'] as String?,
    );

Map<String, dynamic> _$JobDetailsToJson(JobDetails instance) =>
    <String, dynamic>{
      'jobNumber': instance.jobNumber,
      'jobCatName': instance.jobCatName,
      'jobLocation': instance.jobLocation,
      'clientName': instance.clientName,
      'hourlyRate': instance.hourlyRate,
      'shiftName': instance.shiftName,
      'startDateTime': instance.startDateTime,
      'endDateTime': instance.endDateTime,
    };
