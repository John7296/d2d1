import 'package:json_annotation/json_annotation.dart';

part 'approve_timesheet.g.dart';

@JsonSerializable()
class ApproveTimeSheet {
  @JsonKey(name: 'Message')
  String? Message;


  ApproveTimeSheet({
 this.Message
  });

  factory ApproveTimeSheet.fromJson(Map<String, dynamic> json) =>
      _$ApproveTimeSheetFromJson(json);
  Map<String, dynamic> toJson() => _$ApproveTimeSheetToJson(this);
}
