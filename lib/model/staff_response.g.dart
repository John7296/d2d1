// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StaffResponse _$StaffResponseFromJson(Map<String, dynamic> json) =>
    StaffResponse()
      ..thisuser = (json['thisuser'] as List<dynamic>?)
          ?.map((e) => StaffProfile.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$StaffResponseToJson(StaffResponse instance) =>
    <String, dynamic>{
      'thisuser': instance.thisuser,
    };
