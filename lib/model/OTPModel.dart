class OTPModel {
  String sMessage;
  String sStatus;

  OTPModel({this.sMessage, this.sStatus});

  OTPModel.fromJson(Map<String, dynamic> json) {
    sMessage = json['sMessage'];
    sStatus = json['sStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sMessage'] = this.sMessage;
    data['sStatus'] = this.sStatus;
    return data;
  }
}
