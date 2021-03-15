import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:luxury_flavor_app/model/ChangePswdModel.dart';
import 'package:toast/toast.dart';
import 'LoginScreen.dart';

class ChangePasswordScreen extends StatefulWidget {
  String id;
  ChangePasswordScreen({this.id});
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState(id);
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  bool _isLoading = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String id;
  _ChangePasswordScreenState(this.id);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Color(0xFFff9cad)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "Reset your password",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: size.height * 0.038,
                    fontWeight: FontWeight.bold,
                    fontFamily: "assets/fonts/ntailu.ttf"),
              ),
            ),
            Expanded(
                child: Container(
              alignment: Alignment.center,
              child: _buildPortraitPage(),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildPortraitPage() {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min, // <-- notice 'min' here. Important
            children: [
              TextFormField(
                controller: _password,
                cursorColor: Theme.of(context).cursorColor,
                decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(
                        fontFamily: "assets/fonts/ntailu.ttf",
                        fontSize: size.height * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Color(0xff000000),
                    )),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff000000)),
                    )),
                validator: (String value) {
                  //_confirmPassword.text = value;
                  if (value.isEmpty) {
                    return "Please Enter New Password";
                  } else if (value.length < 8) {
                    return "Password must be atleast 8 characters long";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _confirmPassword,
                cursorColor: Theme.of(context).cursorColor,
                decoration: InputDecoration(
                    labelText: "Confirm Password",
                    labelStyle: TextStyle(
                        fontFamily: "assets/fonts/ntailu.ttf",
                        fontSize: size.height * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Color(0xff000000),
                    )),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff000000)),
                    )),
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Please Re-Enter New Password";
                  } else if (value.length < 8) {
                    return "Password must be atleast 8 characters long";
                  } else if (value != _password.text) {
                    return 'Not Match';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 30,
              ),
              _isLoading
                  ? CircularProgressIndicator()
                  : Container(
                      height: size.width * 0.14,
                      width: size.width,
                      decoration: BoxDecoration(
                          color: Color(0xFFff9cad),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: GestureDetector(
                        onTap: () {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              _isLoading = true;
                              print("token and id" + "token" + " " + id);
                              postData();
                            });
                          }
                          /*
                      if(_formKey.currentState.validate()) {
                        //var name = _username.text;
                        //var password = _password.text;
                        setState(() {
                          _isLoading = true;
                          _sendEmail();
                        });
                      }*/
                          //Navigator.of(context).push(MaterialPageRoute(builder: (context) => NumberVerificationScreen()));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFFff9cad),
                              style: BorderStyle.solid,
                              width: 1.0,
                            ),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text(
                            "Send Email",
                            style: TextStyle(
                                fontSize: size.height * 0.022,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "assets/fonts/ntailu.ttf"),
                          ),
                        ),
                      )),
            ],
          ),
        ),
      ),
    );
  }

  Future<ChangePswdModel> postData() async {
    Map mapData = {
      "user_id": id,
      "password": _password.text,
      "confirm_password": _confirmPassword.text
    };
    print("MapData " + mapData.toString());
    Dio dio = new Dio();
    Response response = await dio.post(
      "https://www.theluxuryflavor.com/webservices/updatePassword.php",
      data: mapData,
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
      ),
    );
    print("LoginRES " + response.statusCode.toString());

    final jsonData = json.decode(response.data);
    var map = Map<String, dynamic>.from(jsonData);
    var res = ChangePswdModel.fromJson(map);

    if (response.statusCode == 200) {
      if (res.sStatus == "1") {
        setState(() {
          _isLoading = false;
          Toast.show(res.sMessage, context,
              duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
          print("Response +++ " + res.sMessage);
        });
      } else {
        setState(() {
          _isLoading = false;
          /*final jsonData = json.decode(response.data);
    var map = Map<String, dynamic>.from(jsonData);
    //List<LoginModel> datas = map['data'];
    var res = SignUpModel.fromJson(map);*/
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return LoginScreen();
            //return OTPScreen(username: _username.text, code: data["otpnumber"], id: data["_id"], token: data["token"]);
          }));
          print("Response +++ " + res.sMessage);
        });
      }
    } else {
      _isLoading = false;
      Toast.show(res.sMessage, context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    }
  }

  Future changePswd() async {
    var API_URL =
        "https://www.theluxuryflavor.com/webservices/updatePassword.php";
    FormData formData = FormData.fromMap({
      "user_id": id,
      "password": _password.text,
      "confirm_password": _confirmPassword.text,
    });
    print("MapDate $formData");
    http.Response response =
        await http.post(API_URL, headers: {}, body: formData);
    var data = jsonDecode(response.body);
    print("ResponseBody $data");
    if (response.statusCode == 200) {
      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
        Toast.show(data["message"], context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      });
    }
  }

  @override
  void dispose() {
    _confirmPassword.dispose();
    _password.dispose();
    super.dispose();
  }
}
