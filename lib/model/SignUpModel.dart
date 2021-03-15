class SignUpModel {
  String sMessage;
  String sStatus;

  SignUpModel({this.sMessage, this.sStatus});

  SignUpModel.fromJson(Map<String, dynamic> json) {
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
