// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginCustomer _$LoginCustomerFromJson(Map<String, dynamic> json) =>
    LoginCustomer(
      userId: json['userId'] as int?,
      fullName: json['fullName'] as String?,
      email: json['Email'] as String?,
      phoneNo: json['PhoneNo'] as int?,
      roleId: json['RoleId'] as int?,
      roleName: json['RoleName'] as String?,
      staffId: json['staffId'] as int?,
      clientId: json['clientId'] as int?,
      clientName: json['clientName'] as String?,
      token: json['Token'] as String?,
    );

Map<String, dynamic> _$LoginCustomerToJson(LoginCustomer instance) =>
    <String, dynamic>{
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
