import 'package:json_annotation/json_annotation.dart';
part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {

  @JsonKey(name: 'Message')
  final String? message;


  @JsonKey(name: 'Data')
  final T? data;

    @JsonKey(name: 'Errors')
  final String? errors;

  BaseResponse({this.message, this.data, this.errors});

  factory BaseResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BaseResponseToJson(this, toJsonT);
}