import 'package:json_annotation/json_annotation.dart';

part 'applyjob.g.dart';

@JsonSerializable()
class ApplyJob {
  @JsonKey(name: 'Column1')
  String? Column1;


  ApplyJob({
 this.Column1
  });

  factory ApplyJob.fromJson(Map<String, dynamic> json) =>
      _$ApplyJobFromJson(json);
  Map<String, dynamic> toJson() => _$ApplyJobToJson(this);
}
