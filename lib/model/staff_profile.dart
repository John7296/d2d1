
import 'package:json_annotation/json_annotation.dart';

part 'staff_profile.g.dart';

@JsonSerializable()

class StaffProfile{


  @JsonKey(name: 'staffId')
  int?  staffId;

  @JsonKey(name: 'staffName')
  String? staffName;

@JsonKey(name: 'address')
  String? address;

  @JsonKey(name: 'gender')
  String? gender;

  @JsonKey(name: 'actDate')
  String? actDate;

  @JsonKey(name: 'phoneHome')
  String? phoneHome;

  @JsonKey(name: 'Column1')
  String? column1;

  @JsonKey(name: 'staffLocation')
  String? staffLocation;

  
  @JsonKey(name: 'Email')
  String? email;

   @JsonKey(name: 'jobsCount')
  int? jobsCount;

   @JsonKey(name: 'timeSheetCount')
  int? timeSheetCount;

   @JsonKey(name: 'passportExpy')
  String? passportExpy;

   @JsonKey(name: 'totalEarnings')
  double? totalEarnings;

     @JsonKey(name: 'catName')
  String? catName;

  StaffProfile({
   
   this.staffId,
   this.staffName,
   this.address,
   this.gender,
   this.actDate,
   this.phoneHome,
   this.column1,
   this.staffLocation,
   this.jobsCount,
   this.timeSheetCount,
   this.passportExpy,
   this.totalEarnings,
   this.catName
  });


 factory StaffProfile.fromJson(Map<String, dynamic> json) =>
      _$StaffProfileFromJson(json);
  Map<String, dynamic> toJson() => _$StaffProfileToJson(this);

}