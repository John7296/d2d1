import 'package:json_annotation/json_annotation.dart';
import 'package:project_d2d/model/alert_messages.dart';

part 'alert.g.dart';

@JsonSerializable()
class Alert {
  @JsonKey(name: 'result1')
  List<AlertMessages>? result1;

  Alert();

  factory Alert.fromJson(Map<String, dynamic> json) => _$AlertFromJson(json);
  Map<String, dynamic> toJson() => _$AlertToJson(this);
}
