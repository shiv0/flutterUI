// To parse this JSON data, do
//
//     final forgotPswdModel = forgotPswdModelFromJson(jsonString);

import 'dart:convert';

ForgotPswdModel forgotPswdModelFromJson(String str) => ForgotPswdModel.fromJson(json.decode(str));

String forgotPswdModelToJson(ForgotPswdModel data) => json.encode(data.toJson());

class ForgotPswdModel {
  ForgotPswdModel({
    this.sMessage,
    this.sStatus,
    this.sData,
  });

  String sMessage;
  String sStatus;
  SData sData;

  factory ForgotPswdModel.fromJson(Map<String, dynamic> json) => ForgotPswdModel(
    sMessage: json["sMessage"],
    sStatus: json["sStatus"],
    sData: SData.fromJson(json["sData"]),
  );

  Map<String, dynamic> toJson() => {
    "sMessage": sMessage,
    "sStatus": sStatus,
    "sData": sData.toJson(),
  };
}

class SData {
  SData({
    this.userId,
    this.email,
  });

  int userId;
  String email;

  factory SData.fromJson(Map<String, dynamic> json) => SData(
    userId: json["user_id"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "email": email,
  };
}
