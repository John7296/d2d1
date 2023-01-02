import 'package:json_annotation/json_annotation.dart';

part 'job_request.g.dart';

@JsonSerializable()

class JobRequest{

  @JsonKey(name: 'allocationId')
  int?    allocationId;

  @JsonKey(name: 'allocatedOn')
  String? allocatedOn;

@JsonKey(name: 'staffName')
 String? staffName;

 @JsonKey(name: 'gender')
 String? gender;

  @JsonKey(name: 'availability')
 String? availability;

  @JsonKey(name: 'profilePhoto')
 String? profilePhoto;

  @JsonKey(name: 'staffLocation')
 String? staffLocation;

  @JsonKey(name: 'profession')
 String? profession;

   @JsonKey(name: 'clientId')
 int? clientId;

   @JsonKey(name: 'clientName')
 String? clientName;

 JobRequest({

  this.allocationId,
  this.allocatedOn,
  this.staffName,
  this.gender,
  this.availability,
  this.staffLocation,
  this.profession
 });

 factory JobRequest.fromJson(Map<String, dynamic> json) =>
      _$JobRequestFromJson(json);
  Map<String, dynamic> toJson() => _$JobRequestToJson(this);

}