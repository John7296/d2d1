import 'package:json_annotation/json_annotation.dart';
import 'package:project_d2d/model/staff_profile.dart';

part 'staff_response.g.dart';

@JsonSerializable()

class StaffResponse{

  List<StaffProfile>? thisuser;

  StaffResponse();


factory StaffResponse.fromJson(Map<String, dynamic> json) =>
      _$StaffResponseFromJson(json);
  Map<String, dynamic> toJson() => _$StaffResponseToJson(this);

}