import 'package:json_annotation/json_annotation.dart';

part 'alert_messages.g.dart';

@JsonSerializable()
class AlertMessages {
  @JsonKey(name: 'alert')
  String? alert;

  @JsonKey(name: 'subAlert')
  String? subAlert;

 


  AlertMessages({
this.alert,this.subAlert
  });

  factory AlertMessages.fromJson(Map<String, dynamic> json) =>
      _$AlertMessagesFromJson(json);
  Map<String, dynamic> toJson() => _$AlertMessagesToJson(this);
}
