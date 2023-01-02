// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingStatus _$TrainingStatusFromJson(Map<String, dynamic> json) =>
    TrainingStatus(
      trainingId: json['trainingId'] as int?,
      trainingName: json['trainingName'] as String?,
      completionRate: json['completionRate'] as int?,
    );

Map<String, dynamic> _$TrainingStatusToJson(TrainingStatus instance) =>
    <String, dynamic>{
      'trainingId': instance.trainingId,
      'trainingName': instance.trainingName,
      'completionRate': instance.completionRate,
    };
