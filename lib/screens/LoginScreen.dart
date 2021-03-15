import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in/widgets.dart';
import 'package:luxury_flavor_app/ui/home_page.dart';
import 'package:toast/toast.dart';
import 'package:luxury_flavor_app/model/LoginModel.dart';
import 'package:luxury_flavor_app/screens/ForgotPasswordScreen.dart';
import 'package:luxury_flavor_app/screens/SignUpScreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:luxury_flavor_app/screens/WelcomeScreen.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

import 'WelcomeScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _firebaseAuth = FirebaseAuth.instance;
  bool _isLoading = false;
  bool _passwordVisible = true;
  final _username = TextEditingController();
  final _password = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    future:
    Firebase.initializeApp();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                    "Sign In",
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

                SizedBox(height: size.height * 0.05),

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
                            controller: _username,
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
                          SizedBox(height: size.height * 0.01),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ForgotPasswordScreen())),
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState.validate()) {
                                setState(() {
                                  _isLoading = true;
                                  postData();
                                  //_login();
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
                                      "LOGIN",
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

                SizedBox(height: size.height * 0.04),

                Row(children: <Widget>[
                  Expanded(
                    child: new Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                        child: Divider(
                          color: Colors.black54,
                          height: size.height * 0.03,
                        )),
                  ),
                  Text("Or connect with"),
                  Expanded(
                    child: new Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                        child: Divider(
                          color: Colors.black54,
                          height: size.height * 0.03,
                        )),
                  ),
                ]),
                SizedBox(height: size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        signInGoogle() /*.whenComplete(() => Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                          return WelcomeScreen()*/
                            ;
                        //return OTPScreen(username: _username.text, code: data["otpnumber"], id: data["_id"], token: data["token"]);
                        //})));
                        /*Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                          return GoogleSignIn();
                          //return OTPScreen(username: _username.text, code: data["otpnumber"], id: data["_id"], token: data["token"]);
                        }));*/
                        //SignInDemo();
                      },
                      child: CircleAvatar(
                        radius: 40.0,
                        backgroundImage:
                            AssetImage("assets/images/google_icon.png"),
                      ),
                    ),
                    SizedBox(
                      width: 0,
                    ),
                    GestureDetector(
                      onTap: () {
                        signInWithFacebok();
                        /*.whenComplete(() => Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                          return WelcomeScreen();
                        })));*/
                      },
                      child: CircleAvatar(
                        radius: 40.0,
                        backgroundColor: Colors.grey[200],
                        backgroundImage:
                            AssetImage("assets/images/facebook_icon.png"),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?  ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: size.height * 0.020,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen())),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Color(0xFFff9cad),
                            fontSize: size.height * 0.02,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
                //SizedBox(height: size.height*0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<LoginModel> postData() async {
    Map mapData = {"user_login": _username.text, "user_pass": _password.text};

    print("mapData +++ " + mapData.toString());

    FormData formData = new FormData.fromMap(
        {"user_login": _username.text, "user_pass": _password.text});

    //print("MapData " + mapData.toString());
    Dio dio = new Dio();
    Response response = await dio.post(
      "https://www.theluxuryflavor.com/webservices/login.php",
      data: formData,
      options: Options(headers: {}),
    );

    print("RegisterRES " + response.data.toString());
    var name = response.data['sMessage'];
    print("name" + name);

    if (response.statusCode == 200) {
      print("rrrr ++" + response.toString());
      if (response.data['sStatus'] == "1") {
        setState(() {
          _isLoading = false;
        });
        Toast.show(response.data["sMessage"], context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      } else {
        setState(() {
          _isLoading = false;

          /*print("rrrr ++" + response.data);
          final jsonData = json.decode(response.data);
          var map = Map<String, dynamic>.from(jsonData);
          //List<LoginModel> datas = map['data'];
          var res = LoginModel.fromJson(map);*/

          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return HomePage();
            //return OTPScreen(username: _username.text, code: data["otpnumber"], id: data["_id"], token: data["token"]);
          }));
          //print("Response +++ " + response.data);
        });
      }
    } else {
      _isLoading = false;
      Toast.show(response.data["sMessage"], context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    }
  }

  Future<LoginModel> postData1() async {
    Map mapData = {"phone_number": _username.text, "password": _password.text};
    print("mapData +++ " + mapData.toString());
    FormData formData = new FormData.fromMap(
        {"user_login": _username.text, "user_pass": _password.text});
    print("MapData " + formData.toString());
    Dio dio = new Dio();

    Response response = await dio.post(
      "http://theluxuryflavor.com/TheLuxuryFlavor/webservices/login.php",
      data: formData,
      options: Options(headers: {
        'Accept': "*/*",
        "Connection": "keep-alive",
        "Accept-Encoding": "gzip, deflate, br",
        "Content-Type":
            "multipart/form-data" /*contentType: Headers.formUrlEncodedContentType*/,
      }),
    );

    print("rrrr ++" + response.data);
    final jsonData = json.decode(response.data);
    var map = Map<String, dynamic>.from(jsonData);
    //List<LoginModel> datas = map['data'];
    var res = LoginModel.fromJson(map);

    print("LoginRES " + response.statusCode.toString());
    if (response.statusCode == 200) {
      setState(() {
        print("sStatus + " + res.sMessage + " ++ " + res.sStatus);
        _isLoading = false;
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return HomePage();
          //return OTPScreen(username: _username.text, code: data["otpnumber"], id: data["_id"], token: data["token"]);
        }));
        print("REsponse +++ " + res.sMessage);
      });
    } else {
      setState(() {
        _isLoading = false;
        Toast.show(res.sMessage, context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
        print(res.sMessage);
      });
    }
  }

  Future _login() async {
    loadingView();
    var API_URL =
        "http://theluxuryflavor.com/TheLuxuryFlavor/webservices/login.php";

    /*var map = new Map<String, dynamic>();
    map['user_login'] = _username.text;
    map['user_pass'] = _password.text;*/

/*    Map mapData = {
      "phone_number": _username.text,
      "password": _password.text
    };*/
    FormData formData = new FormData.fromMap({
      "user_login": _username.text,
      "user_pass": _password.text,
    });
    //response = await dio.post("/info", data: formData);
    //print("MapDate $formData");
    Dio dio = new Dio();
    Response response = await dio.post(API_URL,
        data: formData,
        options: Options(headers: {
          "Content-Type":
              "multipart/form-data; boundary=<calculated when request is sent>"
        }));
    //http.Response response = await http.post(API_URL, body: formData);
    var data = jsonDecode(response.data);
    print("ResponseBody $data");
    if (response.statusCode == 200) {
      setState(() {
        _isLoading = false;
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return HomePage();
          //return OTPScreen(username: _username.text, code: data["otpnumber"], id: data["_id"], token: data["token"]);
        }));
      });
    } else {
      setState(() {
        _isLoading = false;
        Toast.show(data["sMessage"], context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
        print(data["sMessage"]);
      });
    }
  }

  Widget loadingView() => Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.blue,
        ),
      );

  // Google Sign In
  Future<void> signInGoogle() async {
    final googleSignIn = GoogleSignIn();
    final account = await googleSignIn.signIn();
    if (account != null) {
      GoogleSignInAuthentication googleAuth = await account.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        final result = await _firebaseAuth.signInWithCredential(
            GoogleAuthProvider.getCredential(
                idToken: googleAuth.idToken,
                accessToken: googleAuth.accessToken));
        print("FireBaseResult + ++ " + result.user.toString());
        if (result.user.email != null) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return HomePage();
            //return OTPScreen(username: _username.text, code: data["otpnumber"], id: data["_id"], token: data["token"]);
          }));
        }
      }
    }
  }

  //Facebook Login
  Future<Void> signInWithFacebok() async {
    final facebookLogin = FacebookLogin();
    final result = await facebookLogin.logIn(
      ['public_profile'],
    );
    if (result.accessToken != null) {
      print("Facebook Login +++ " + result.accessToken.toString());
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return HomePage();
        //return OTPScreen(username: _username.text, code: data["otpnumber"], id: data["_id"], token: data["token"]);
      }));
      //final authResult= await _firebaseAuth.signInWithCredential(
      //FacebookAuthProvider.getCredential(
      //var token = result.credential.accessToken;
      //)
      /*
          FacebookAuthProvider.getCredential(
              accessToken: result.accessToken.token
          )*/
      //);
      //return await _userFromFirebase(authResult.user);
    } else {
      print('No access token found');
    }
  }
  /*Future<void> signInWithFacebook() async {
    var accessToken;
    final facbookLogin = FacebookLogin();
    final result = await facbookLogin.logIn(['public_profile'],);
    if (result.accessToken != null) {
      final authResult = await _firebaseAuth.signInWithCredential(
          FacebookAuthProvider.getCredential(
              accessToken: result.accessToken.token
          )
      );
      */ /*final authResult = await _firebaseAuth.signInWithCredential(
          FacebookAuthProvider.getCredential(
              //result.accessToken =  result.accessToken.token
          )
      );*/ /*

    }

  }*/
}
/*

class SignInDemo extends StatefulWidget {
  @override
  State createState() => SignInDemoState();
}

class SignInDemoState extends State<SignInDemo> {

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  GoogleSignInAccount _currentUser;
  String _contactText;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        _handleGetContact();
      }
    });
    _googleSignIn.signInSilently();
  }

  Future<void> _handleGetContact() async {
    setState(() {
      _contactText = "Loading contact info...";
    });
    final http.Response response = await http.get(
      'https://people.googleapis.com/v1/people/me/connections'
          '?requestMask.includeField=person.names',
      headers: await _currentUser.authHeaders,
    );
    if (response.statusCode != 200) {
      setState(() {
        _contactText = "People API gave a ${response.statusCode} "
            "response. Check logs for details.";
      });
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data = json.decode(response.body);
    final String namedContact = _pickFirstNamedContact(data);
    setState(() {
      if (namedContact != null) {
        _contactText = "I see you know $namedContact!";
      } else {
        _contactText = "No contacts to display.";
      }
    });
  }

  String _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic> connections = data['connections'];
    final Map<String, dynamic> contact = connections?.firstWhere(
          (dynamic contact) => contact['names'] != null,
      orElse: () => null,
    );
    if (contact != null) {
      final Map<String, dynamic> name = contact['names'].firstWhere(
            (dynamic name) => name['displayName'] != null,
        orElse: () => null,
      );
      if (name != null) {
        return name['displayName'];
      }
    }
    return null;
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  Widget _buildBody() {
    if (_currentUser != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ListTile(
            leading: GoogleUserCircleAvatar(
              identity: _currentUser,
            ),
            title: Text(_currentUser.displayName ?? ''),
            subtitle: Text(_currentUser.email ?? ''),
          ),
          const Text("Signed in successfully."),
          Text(_contactText ?? ''),
          ElevatedButton(
            child: const Text('SIGN OUT'),
            onPressed: _handleSignOut,
          ),
          ElevatedButton(
            child: const Text('REFRESH'),
            onPressed: _handleGetContact,
          ),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Text("You are not currently signed in."),
          ElevatedButton(
            child: const Text('SIGN IN'),
            onPressed: _handleSignIn,
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Google Sign In'),
        ),
        body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: _buildBody(),
        ));
  }
}
*/
