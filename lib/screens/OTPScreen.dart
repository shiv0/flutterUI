import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;
import 'package:luxury_flavor_app/model/OTPModel.dart';
import 'dart:convert';

import 'ChangePasswordScreen.dart';

class OTPScreen extends StatefulWidget {
  String id;
  OTPScreen({this.id});

  @override
  _OTPScreenState createState() => _OTPScreenState(id);
}

bool _isLoading = false;
bool isLoggedIn = false;

GlobalKey<FormState> _formKey = GlobalKey<FormState>();
TextEditingController _otpController = TextEditingController();

class _OTPScreenState extends State<OTPScreen> {
  String id, otpCode, otpPin;
  _OTPScreenState(this.id);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFff9cad),
        title: Text("Back"),
        actions: <Widget>[
          //Navigator.pop(context),
        ],
      ),
      body: Container(
        //color: Colors.black12,
        padding: EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //SizedBox(height: 50,),
                Text(
                  "Verification",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Please enter your OTP",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                OTPTextField(
                  length: 5,
                  width: MediaQuery.of(context).size.width,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldWidth: 50,
                  fieldStyle: FieldStyle.box,
                  style: TextStyle(
                    fontSize: 17,
                  ),
                  onCompleted: (pin) {
                    otpPin = pin;
                    print("Completed: " + pin);
                  },
                ),
                SizedBox(height: size.height * 0.02),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "We have sent you OTP on your email address.",
                    style: TextStyle(
                        fontSize: size.height * 0.017,
                        fontWeight: FontWeight.bold,
                        fontFamily: "assets/fonts/ntailu.ttf"),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "The code will expire is 02.25",
                    style: TextStyle(
                        fontSize: size.height * 0.017,
                        fontWeight: FontWeight.bold,
                        fontFamily: "assets/fonts/ntailu.ttf"),
                  ),
                ),
                /*SizedBox(height: size.height*0.02),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("The code is $code" ?? "default",
                    style: TextStyle(
                        fontSize: size.height * 0.017,
                        fontWeight: FontWeight.bold,
                        fontFamily: "assets/fonts/ntailu.ttf"),
                  ),
                ),*/
                SizedBox(height: size.height * 0.03),
                SizedBox(height: 40),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                      alignment: Alignment.center,
                      height: size.width * 0.13,
                      width: size.width * 0.3,
                      decoration: BoxDecoration(
                          color: Color(0xFFff9cad),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (otpPin.isNotEmpty) {
                              setState(() {
                                //
                                _isLoading = true;
                                postData();
                                /*Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                  return ChangePasswordScreen(id: "29");
                                  //return OTPScreen(username: _username.text, code: data["otpnumber"], id: data["_id"], token: data["token"]);
                                }));*/
                                //_verifiOTP();
                              });
                            } else {
                              Toast.show("Please enter OTP", context,
                                  duration: Toast.LENGTH_SHORT,
                                  gravity: Toast.BOTTOM);
                            }
                          });
                          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => TravelApp()));
                          // Navigator.push(context, FirstScreen())
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: _isLoading
                              ? CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                )
                              : Text(
                                  "Send",
                                  style: TextStyle(
                                      fontSize: size.height * 0.022,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "assets/fonts/ntailu.ttf"),
                                ),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<OTPModel> postData() async {
    var API_URL = "https://www.theluxuryflavor.com/webservices/veriryOtp.php";

    Map mapData = {"otp": otpPin, "user_id": id};
    print("MapData + " + mapData.toString());
    FormData formData = FormData.fromMap({"otp": otpPin, "user_id": id});

    Dio dio = new Dio();
    Response response = await dio.post(
      API_URL,
      data: formData,
      options: Options(headers: {}),
    );

    print("LoginRES " + response.statusCode.toString());
    print("RegisterRES " + response.data.toString());

    final jsonData = json.decode(response.data);
    var map = Map<String, dynamic>.from(jsonData);
    var res = OTPModel.fromJson(map);

    if (response.statusCode == 200) {
      if (res.sStatus == "1") {
        setState(() {
          _isLoading = false;
        });
        Toast.show(res.sMessage, context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      } else {
        setState(() {
          _isLoading = false;
          //Toast.show(res.sMessage, context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
          var responseData = response.data;
          final jsonData = json.decode(response.data);
          var map = Map<String, dynamic>.from(jsonData);
          var res = OTPModel.fromJson(map);
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return ChangePasswordScreen(id: id);
          }));
          //print("REsponse +++ " + response.data);
        });
      }
    } else {
      _isLoading = false;
    }
  }

  Future<OTPScreen> _verifiOTP() async {
    var API_URL = "https://www.theluxuryflavor.com/webservices/veriryOtp.php";

    FormData formData = FormData.fromMap({"otp": otpPin, "user_id": id});

    http.Response response = await http.post(API_URL,
        headers: {"Authorization": "token"}, body: formData);
    var data = jsonDecode(response.body);
    print("ResponseBody $data");
    if (response.statusCode == 200) {
      setState(() {
        _isLoading = false;
        var user = data["user"];
        print("User + " + user['full_name'].toString());
        //loginUser(token, id, user['full_name'], user['email'], user['phoneNumber']/*, data['gender'], data['images']*/);
        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => TravelApp()));
      });
    } else {
      setState(() {
        _isLoading = false;
        Toast.show(data["message"], context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      });
    }
  }
}
