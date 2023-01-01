// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Alert _$AlertFromJson(Map<String, dynamic> json) => Alert()
  ..result1 = (json['result1'] as List<dynamic>?)
      ?.map((e) => AlertMessages.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$AlertToJson(Alert instance) => <String, dynamic>{
      'result1': instance.result1,
    };
