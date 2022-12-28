class StaffDetails {
  String? staffName;
  String? jobName;
  String? jobLocation;
  int? hourlyRate;
  String? shiftType;
  String? startDate;
  bool? requested;

  StaffDetails(
      {this.staffName,
      this.jobName,
      this.jobLocation,
      this.hourlyRate,
      this.shiftType,
      this.startDate,
      this.requested});

  StaffDetails.fromJson(Map<String, dynamic> json) {
    staffName = json['staffName'];
    jobName = json['jobName'];
    jobLocation = json['jobLocation'];
    hourlyRate = json['hourlyRate'];
    shiftType = json['shiftType'];
    startDate = json['startDate'];
    requested = json['requested'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['staffName'] = this.staffName;
    data['jobName'] = this.jobName;
    data['jobLocation'] = this.jobLocation;
    data['hourlyRate'] = this.hourlyRate;
    data['shiftType'] = this.shiftType;
    data['startDate'] = this.startDate;
    data['requested'] = this.requested;
    return data;
  }
}
