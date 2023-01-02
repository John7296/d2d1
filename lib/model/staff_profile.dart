
import 'package:json_annotation/json_annotation.dart';

part 'staff_profile.g.dart';

@JsonSerializable()

class StaffProfile{


  @JsonKey(name: 'staffId')
  int?    staffId;

  @JsonKey(name: 'staffName')
  String? staffName;

@JsonKey(name: 'address')
  String? address;

  @JsonKey(name: 'gender')
  String? gender;

  @JsonKey(name: 'actDate')
  String? actDate;

  @JsonKey(name: 'phoneHome')
  int? phoneHome;

  @JsonKey(name: 'dob')
  String? dob;

  @JsonKey(name: 'staffLocation')
  String? staffLocation;

   @JsonKey(name: 'jobsCount')
  int? jobsCount;

   @JsonKey(name: 'timeSheetCount')
  int? timeSheetCount;

   @JsonKey(name: 'timeSheetDate')
  String? timeSheetDate;

   @JsonKey(name: 'totalEarnings')
  double? totalEarnings;

  StaffProfile({
   
   this.staffId,
   this.staffName,
   this.address,
   this.gender,
   this.actDate,
   this.phoneHome,
   this.dob,
   this.staffLocation,
   this.jobsCount,
   this.timeSheetCount,
   this.timeSheetDate,
   this.totalEarnings
  });


 factory StaffProfile.fromJson(Map<String, dynamic> json) =>
      _$StaffProfileFromJson(json);
  Map<String, dynamic> toJson() => _$StaffProfileToJson(this);

}