// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StaffProfile _$StaffProfileFromJson(Map<String, dynamic> json) => StaffProfile(
      staffId: json['staffId'] as int?,
      staffName: json['staffName'] as String?,
      address: json['address'] as String?,
      gender: json['gender'] as String?,
      actDate: json['actDate'] as String?,
      phoneHome: json['phoneHome'] as int?,
      dob: json['dob'] as String?,
      staffLocation: json['staffLocation'] as String?,
      jobsCount: json['jobsCount'] as int?,
      timeSheetCount: json['timeSheetCount'] as int?,
      timeSheetDate: json['timeSheetDate'] as String?,
      totalEarnings: (json['totalEarnings'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$StaffProfileToJson(StaffProfile instance) =>
    <String, dynamic>{
      'staffId': instance.staffId,
      'staffName': instance.staffName,
      'address': instance.address,
      'gender': instance.gender,
      'actDate': instance.actDate,
      'phoneHome': instance.phoneHome,
      'dob': instance.dob,
      'staffLocation': instance.staffLocation,
      'jobsCount': instance.jobsCount,
      'timeSheetCount': instance.timeSheetCount,
      'timeSheetDate': instance.timeSheetDate,
      'totalEarnings': instance.totalEarnings,
    };
