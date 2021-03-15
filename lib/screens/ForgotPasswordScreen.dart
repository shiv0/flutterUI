import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';
import 'package:luxury_flavor_app/model/ForgotPswdModel.dart';
import 'package:luxury_flavor_app/screens/OTPScreen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  var res;
  bool _isLoading = false;
  final _email = TextEditingController();
  var _formKey = GlobalKey<FormState>();

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
        //color: Colors.green,
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Forget Password",
                    style: TextStyle(
                        fontSize: size.height * 0.03,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
                  style: TextStyle(
                    fontSize: size.height * 0.02,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: size.height * 0.03),

                Container(
                  //alignment: Alignment.center,
                  //color: Colors.cyan,
                  child: Form(
                    key: _formKey,
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(height: size.height * 0.02),
                          TextFormField(
                            controller: _email,
                            cursorColor: Color(0xFFff9cad),
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(color: Color(0xFF313131)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Color(0xFFff9cad),
                              )),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFff9cad)),
                              ),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Email cannot empty";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: size.height * 0.04),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isLoading = true;
                                postData();
                              });
                              /*Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                return OTPScreen();
                                //return OTPScreen(username: _username.text, code: data["otpnumber"], id: data["_id"], token: data["token"]);
                              }));*/
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: size.height * 0.07,
                              width: size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xFFff9cad),
                              ),
                              child: _isLoading
                                  ? CircularProgressIndicator(
                                      backgroundColor: Colors.white,
                                    )
                                  : Text(
                                      "RESET PASSWORD",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: size.height * 0.022,
                                          fontWeight: FontWeight.bold),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //SizedBox(height: size.height*0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<ForgotPswdModel> postData() async {
    FormData formData = FormData.fromMap({
      "email": _email.text,
    });

    Dio dio = new Dio();
    Response response = await dio.post(
      "https://www.theluxuryflavor.com/webservices/forget_password.php",
      data: formData,
      options: Options(headers: {}),
    );

    print("LoginRES " + response.statusCode.toString());
    print("RegisterRES " + response.data.toString());

    final jsonData = json.decode(response.data);
    var map = Map<String, dynamic>.from(jsonData);
    res = ForgotPswdModel.fromJson(map);
    //print("Response +++ " + res.sData.toString());
    //print("USER ID  +++ " + res.sData.userId.toString());

    //var name = response.data["sMessage"].toString();
    //print("name" + name);

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
          var res = ForgotPswdModel.fromJson(map);
          print("Response +++ " + res.sData.toString());
          print("USER ID  +++ " + res.sData.userId.toString());
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return OTPScreen(id: res.sData.userId.toString());
          }));
          //print("REsponse +++ " + response.data);
        });
      }
    } else {
      _isLoading = false;
    }
  }
}
