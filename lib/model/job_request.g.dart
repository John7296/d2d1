// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobRequest _$JobRequestFromJson(Map<String, dynamic> json) => JobRequest(
      allocationId: json['allocationId'] as int?,
      allocatedOn: json['allocatedOn'] as String?,
      staffName: json['staffName'] as String?,
      gender: json['gender'] as String?,
      availability: json['availability'] as String?,
      staffLocation: json['staffLocation'] as String?,
      profession: json['profession'] as String?,
    )
      ..profilePhoto = json['profilePhoto'] as String?
      ..clientId = json['clientId'] as int?
      ..clientName = json['clientName'] as String?;

Map<String, dynamic> _$JobRequestToJson(JobRequest instance) =>
    <String, dynamic>{
      'allocationId': instance.allocationId,
      'allocatedOn': instance.allocatedOn,
      'staffName': instance.staffName,
      'gender': instance.gender,
      'availability': instance.availability,
      'profilePhoto': instance.profilePhoto,
      'staffLocation': instance.staffLocation,
      'profession': instance.profession,
      'clientId': instance.clientId,
      'clientName': instance.clientName,
    };
