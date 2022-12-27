import 'package:json_annotation/json_annotation.dart';

part 'login_customer.g.dart';

@JsonSerializable()

class LoginCustomer{

   @JsonKey(name: 'userId')
  int? userId;

  @JsonKey(name: 'fullName')
  String? fullName;

@JsonKey(name: 'Email')
  String? email;

  @JsonKey(name: 'PhoneNo')
  int? phoneNo;

@JsonKey(name: 'RoleId')
  int? roleId;

@JsonKey(name: 'RoleName')
  String? roleName;

@JsonKey(name: 'staffId')
  int? staffId;

  @JsonKey(name: 'clientId')
  int? clientId;

  @JsonKey(name: 'clientName')
  String? clientName;

  @JsonKey(name: 'Token')
  String? token;

  LoginCustomer({
   this.userId,
   this.fullName,
   this.email,
   this.phoneNo,
   this.roleId,
   this.roleName,
   this.staffId,
   this.clientId,
   this.clientName,
   this.token

  });

  factory LoginCustomer.fromJson(Map<String, dynamic> json) =>
      _$LoginCustomerFromJson(json);
  Map<String, dynamic> toJson() => _$LoginCustomerToJson(this);



}