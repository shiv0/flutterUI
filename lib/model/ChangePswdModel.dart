// To parse this JSON data, do
//
//     final changePswdModel = changePswdModelFromJson(jsonString);

import 'dart:convert';

ChangePswdModel changePswdModelFromJson(String str) => ChangePswdModel.fromJson(json.decode(str));

String changePswdModelToJson(ChangePswdModel data) => json.encode(data.toJson());

class ChangePswdModel {
  ChangePswdModel({
    this.sMessage,
    this.sStatus,
  });

  String sMessage;
  String sStatus;

  factory ChangePswdModel.fromJson(Map<String, dynamic> json) => ChangePswdModel(
    sMessage: json["sMessage"],
    sStatus: json["sStatus"],
  );

  Map<String, dynamic> toJson() => {
    "sMessage": sMessage,
    "sStatus": sStatus,
  };
}
