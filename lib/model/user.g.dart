// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      userId: json['userId'] as int?,
      fullName: json['fullName'] as String?,
      email: json['Email'] as String?,
      phoneNo: json['PhoneNo'] as String?,
      roleId: json['RoleId'] as int?,
      roleName: json['RoleName'] as String?,
      staffId: json['staffId'] as int?,
      clientId: json['clientId'] as int?,
      clientName: json['clientName'] as String?,
      token: json['Token'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userId': instance.userId,
      'fullName': instance.fullName,
      'Email': instance.email,
      'PhoneNo': instance.phoneNo,
      'RoleId': instance.roleId,
      'RoleName': instance.roleName,
      'staffId': instance.staffId,
      'clientId': instance.clientId,
      'clientName': instance.clientName,
      'Token': instance.token,
    };
