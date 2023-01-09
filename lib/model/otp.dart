import 'package:json_annotation/json_annotation.dart';

part 'otp.g.dart';

@JsonSerializable()
class Otp{

  @JsonKey(name: 'Token')
  String? token;

   Otp({

    this.token
   });

    factory Otp.fromJson(Map<String, dynamic> json) =>
      _$OtpFromJson(json);
  Map<String, dynamic> toJson() => _$OtpToJson(this);

}