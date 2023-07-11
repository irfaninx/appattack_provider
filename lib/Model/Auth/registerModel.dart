class RegisterData {
  String? collegeID;
  String? email;
  String? password;
  String? deviceID;
  String? deviceToken;

  String? deviceType;

  RegisterData(
      {this.collegeID,
      this.email,
      this.password,
      this.deviceID,
      this.deviceToken,
      this.deviceType});

  RegisterData.fromJson(Map<String, dynamic> json) {
    collegeID = json['college_id'];
    email = json['email'];
    password = json['password'];
    deviceID = json['device_id'];
    deviceToken = json['device_token'];
    deviceType = json['device_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['college_id'] = this.collegeID;
    data['email'] = this.email;
    data['password'] = this.password;
    data['device_id'] = this.deviceID;
    data['device_token'] = this.deviceToken;
    data['device_type'] = this.deviceType;
    return data;
  }
}
