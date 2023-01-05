import 'package:json_annotation/json_annotation.dart';

part 'settings.g.dart';

@JsonSerializable()

class Settings{

    @JsonKey(name: 'stKey')
  String? stKey;

@JsonKey(name: 'stValue')
  String? stValue;

  Settings({

this.stKey,
this.stValue

  });

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);
  Map<String, dynamic> toJson() => _$SettingsToJson(this);
  
}