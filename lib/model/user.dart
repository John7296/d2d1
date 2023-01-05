import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()

class User{

   @JsonKey(name: 'userId')
  int? userId;

  @JsonKey(name: 'fullName')
  String? fullName;

@JsonKey(name: 'Email')
  String? email;

  @JsonKey(name: 'PhoneNo')
  String? phoneNo;

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

  User({
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

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);



}