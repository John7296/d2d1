import 'package:json_annotation/json_annotation.dart';

part 'canceljob.g.dart';

@JsonSerializable()
class CancelJob {
  @JsonKey(name: 'message')
  String? message;

  CancelJob({this.message});

  factory CancelJob.fromJson(Map<String, dynamic> json) =>
      _$CancelJobFromJson(json);
  Map<String, dynamic> toJson() => _$CancelJobToJson(this);
}
