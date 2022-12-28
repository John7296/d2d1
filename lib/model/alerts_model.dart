class Alerts {
  String? dialougue;
  String? info;
  bool? highPriority;

  Alerts({this.dialougue, this.info, this.highPriority});

  Alerts.fromJson(Map<String, dynamic> json) {
    dialougue = json['dialougue'];
    info = json['info'];
    highPriority = json['high_priority'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dialougue'] = this.dialougue;
    data['info'] = this.info;
    data['high_priority'] = this.highPriority;
    return data;
  }
}
