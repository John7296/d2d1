import 'package:json_annotation/json_annotation.dart';

part 'training_status.g.dart';

@JsonSerializable()

class TrainingStatus{

  @JsonKey(name: 'trainingId')
  int?    trainingId;

  @JsonKey(name: 'trainingName')
  String? trainingName;

@JsonKey(name: 'completionRate')
 int? completionRate;

 TrainingStatus({
 
 this.trainingId,
 this.trainingName,
 this.completionRate,

 });

 factory TrainingStatus.fromJson(Map<String, dynamic> json) =>
      _$TrainingStatusFromJson(json);
  Map<String, dynamic> toJson() => _$TrainingStatusToJson(this);

}