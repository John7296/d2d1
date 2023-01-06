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
      phoneHome: json['phoneHome'] as String?,
      column1: json['Column1'] as String?,
      staffLocation: json['staffLocation'] as String?,
      jobsCount: json['jobsCount'] as int?,
      timeSheetCount: json['timeSheetCount'] as int?,
      passportExpy: json['passportExpy'] as String?,
      totalEarnings: (json['totalEarnings'] as num?)?.toDouble(),
      catName: json['catName'] as String?,
    )..email = json['Email'] as String?;

Map<String, dynamic> _$StaffProfileToJson(StaffProfile instance) =>
    <String, dynamic>{
      'staffId': instance.staffId,
      'staffName': instance.staffName,
      'address': instance.address,
      'gender': instance.gender,
      'actDate': instance.actDate,
      'phoneHome': instance.phoneHome,
      'Column1': instance.column1,
      'staffLocation': instance.staffLocation,
      'Email': instance.email,
      'jobsCount': instance.jobsCount,
      'timeSheetCount': instance.timeSheetCount,
      'passportExpy': instance.passportExpy,
      'totalEarnings': instance.totalEarnings,
      'catName': instance.catName,
    };
