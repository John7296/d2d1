// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobdetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobDetails _$JobDetailsFromJson(Map<String, dynamic> json) => JobDetails(
      endDateTime: json['endDateTime'] as String?,
      hourlyRate: (json['hourlyRate'] as num?)?.toDouble(),
      jobCatName: json['jobCatName'] as String?,
      jobLocation: json['jobLocation'] as String?,
      jobNumber: json['jobNumber'] as String?,
      shiftName: json['shiftName'] as String?,
      startDateTime: json['startDateTime'] as String?,
      allocatedStaff: json['allocatedStaff'] as String?,
      careHomeName: json['careHomeName'] as String?,
      comments: json['comments'] as String?,
      jobDescription: json['jobDescription'] as String?,
      info: json['info'] as String?,
    );

Map<String, dynamic> _$JobDetailsToJson(JobDetails instance) =>
    <String, dynamic>{
      'jobNumber': instance.jobNumber,
      'jobCatName': instance.jobCatName,
      'jobLocation': instance.jobLocation,
      'careHomeName': instance.careHomeName,
      'hourlyRate': instance.hourlyRate,
      'allocatedStaff': instance.allocatedStaff,
      'shiftName': instance.shiftName,
      'startDateTime': instance.startDateTime,
      'endDateTime': instance.endDateTime,
      'jobDescription': instance.jobDescription,
      'comments': instance.comments,
      'info': instance.info,
    };
