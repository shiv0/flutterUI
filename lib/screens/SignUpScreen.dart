import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';
import 'package:luxury_flavor_app/model/SignUpModel.dart';
import 'package:luxury_flavor_app/screens/LoginScreen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String select = null;
  String selectRole = null;
  bool _passwordVisible = true;
  String storeName = "";
  bool _confirmPasswordVisible = true;
  bool _isLoading = false;
  final _email = TextEditingController();
  final _username = TextEditingController();
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  final _storeName = TextEditingController();
  final _phone = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _passwordVisible = false;
    _confirmPasswordVisible = false;
  }

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
          //IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
        ],
      ),
      body: Container(
        //color: Colors.green,
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: size.height * 0.02),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Create an account",
                    style: TextStyle(
                        fontSize: size.height * 0.03,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Container(
                  //alignment: Alignment.center,
                  //color: Colors.cyan,
                  child: Form(
                    key: _formKey,
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(height: size.height * 0.0),
                          TextFormField(
                            controller: _username,
                            cursorColor: Color(0xFFff9cad),
                            decoration: InputDecoration(
                              labelText: 'Username',
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
                                return "Username cannot empty";
                              }
                              return null;
                            },
                          ),
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
                          SizedBox(height: size.height * 0.02),
                          TextFormField(
                            controller: _firstName,
                            cursorColor: Color(0xFFff9cad),
                            decoration: InputDecoration(
                              labelText: 'First Name',
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
                                return "First name cannot empty";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: size.height * 0.02),
                          TextFormField(
                            controller: _lastName,
                            cursorColor: Color(0xFFff9cad),
                            decoration: InputDecoration(
                              labelText: 'Last Name',
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
                                return "Last name cannot empty";
                              }
                              return null;
                            },
                          ),
                          //SizedBox(height: size.height*0.02),
                          /*if(select == null)*/

                          SizedBox(height: size.height * 0.02),
                          TextFormField(
                            controller: _phone,
                            cursorColor: Color(0xFFff9cad),
                            decoration: InputDecoration(
                              labelText: 'Phone',
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
                                return "Phone cannot empty";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: size.height * 0.02),
                          TextFormField(
                            controller: _password,
                            obscureText: !_passwordVisible,
                            cursorColor: Color(0xFFff9cad),
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Color(0xFF313131)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Color(0xFFff9cad),
                              )),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFff9cad)),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Password cannot empty";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: size.height * 0.02),
                          TextFormField(
                            controller: _confirmPassword,
                            obscureText: !_confirmPasswordVisible,
                            cursorColor: Color(0xFFff9cad),
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              labelStyle: TextStyle(color: Color(0xFF313131)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Color(0xFFff9cad),
                              )),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFff9cad)),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  _confirmPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    _confirmPasswordVisible =
                                        !_confirmPasswordVisible;
                                  });
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Confirm password cannot empty";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: size.height * 0.03),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              addRadioButton(0, 'Customer'),
                              addRadioButton(1, 'Vendor'),
                            ],
                          ),
                          Visibility(
                            visible: selectRole != null,
                            child: TextFormField(
                              controller: _storeName,
                              cursorColor: Color(0xFFff9cad),
                              decoration: InputDecoration(
                                labelText: 'Store Name',
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
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState.validate()) {
                                setState(() {
                                  if (select != null) {
                                    if (select == "customer" ||
                                        select == "wcfm_vendor") {
                                      if (select == 'customer') {
                                        storeName = "";
                                      } else {
                                        storeName = _storeName.text;
                                      }
                                      _isLoading = true;
                                      //updateUserPicture();
                                      //developerlibs();
                                      postData();
                                    } else {
                                      Toast.show(
                                          "Please enter store name", context,
                                          duration: Toast.LENGTH_SHORT,
                                          gravity: Toast.BOTTOM);
                                    }
                                  } else {
                                    Toast.show("Select Role", context,
                                        duration: Toast.LENGTH_SHORT,
                                        gravity: Toast.BOTTOM);
                                  }
                                });
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: size.height * 0.065,
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
                                      "SIGN UP",
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

                SizedBox(height: size.height * 0.03),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "By tapping " "Sign Up" " you accept our ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: size.height * 0.017,
                      ),
                    ),
                    GestureDetector(
                      // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen())),
                      child: Text(
                        "terms",
                        style: TextStyle(
                            color: Color(0xFFff9cad),
                            fontSize: size.height * 0.017,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    Text(
                      " and ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: size.height * 0.017,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen())),
                  child: Text(
                    "Condition",
                    style: TextStyle(
                      color: Color(0xFFff9cad),
                      fontSize: size.height * 0.017,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                //SizedBox(height: size.height*0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<SignUpModel> updateUserPicture() async

  //{File file, List<int> bytes}) async
  {
    FormData formData = new FormData.fromMap({
      "username": _username.text,
      "email": _email.text,
      "first_name": _firstName.text,
      "last_name": _lastName.text,
      "store_name": storeName,
      "phone": _phone.text,
      "password": _password.text,
      "confirm_password": _confirmPassword.text,
      "role": select
    });

    try {
      Dio _dio = Dio();
      final response = await _dio.post(
          'http://theluxuryflavor.com/TheLuxuryFlavor/webservices/vendor_register.php',
          data: formData,
          options: Options(headers: {
            "content-type": "multipart/form-data; charset=utf-8",
            "Accept": "application/json",
            "Content-Type": "application/json"
          }),
          onSendProgress: (send, total) {});
      return SignUpModel(sMessage: response.data['sMessage']);
      print(response.data['sMessage']);
      // thumbnailUrl: response.data['thumbnail_url']);
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<SignUpModel> postData() async {
    FormData formData = new FormData.fromMap({
      "username": _username.text,
      "email": _email.text,
      "first_name": _firstName.text,
      "last_name": _lastName.text,
      "store_name": storeName,
      "phone": _phone.text,
      "password": _password.text,
      "role": select
    });
    Map mapData = {
      "username": _username.text,
      "email": _email.text,
      "first_name": _firstName.text,
      "last_name": _lastName.text,
      "store_name": storeName,
      "phone": _phone.text,
      "password": _password.text,
      "role": select
    };
    print("MapData " + mapData.toString());
    Dio dio = new Dio();
    Response response = await dio.post(
        "https://www.theluxuryflavor.com/webservices/vendor_register.php",
        data: formData,
        options: Options(headers: {/*"Content-Type":"multipart/form-data"*/}));
    //);

    //'Accept': "*/*",
    //"Connection" : "keep-alive",
    //"Accept-Encoding" : "gzip, deflate, br",
    //,}),

    print("Register RES " + response.statusCode.toString());
    print("Register RES " + response.data.toString());
    final jsonData = json.decode(response.data);
    var map = Map<String, dynamic>.from(jsonData);
    //List<LoginModel> datas = map['data'];
    print(map.toString());
    var res = SignUpModel.fromJson(map);
    //var name = response.data['sMessage'];
    //print("name" + name);

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

  List role = [
    "customer",
    "wcfm_vendor",
  ];

  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Color(0xFFff9cad),
          value: role[btnValue],
          groupValue: select,
          onChanged: (value) {
            setState(() {
              print(value);
              select = value;
              print("Gender Value  " + select);
              if (select == "customer") {
                setState(() {
                  selectRole = null;
                });
              } else {
                setState(() {
                  selectRole = select;
                });
              }
            });
          },
        ),
        Text(title)
      ],
    );
  }
}
