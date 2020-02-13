
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:port_tracker/globals.dart';
import 'package:port_tracker/functions/json_helper.dart';
import 'package:port_tracker/models/account.dart';
import 'package:port_tracker/ui/navigation/main_drawer.dart';
import 'package:port_tracker/ui/pages/signup_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // bool _isSelected = false;
  final _formKey = GlobalKey<FormState>();
  final String _url = "http://www.port-tracker.tk:8088/login";
  String _password;
  String _mail;
  bool _autoValidate = false;

  // void _radio() {
  //   setState(() {
  //     _isSelected = !_isSelected;
  //     log(_isSelected.toString());
  //   });
  // }

  Widget radioButton(bool isSelected) => Container(
        width: 16.0,
        height: 16.0,
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.0, color: Colors.black)),
        child: isSelected
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
              )
            : Container(),
      );

  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: ScreenUtil.getInstance().setWidth(120),
          height: 1.0,
          color: Colors.black26.withOpacity(.2),
        ),
      );

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 100.0, left: 60.0),
                child: Image.asset("assets/images/image_01.png"),
              ),
              Expanded(
                child: Container(),
              ),
              Image.asset("assets/images/image_02.png")
            ],
          ),
          SingleChildScrollView(
            child: Form(
              autovalidate: _autoValidate,
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset(
                          "assets/images/logo.png",
                          width: ScreenUtil.getInstance().setWidth(120),
                          height: ScreenUtil.getInstance().setHeight(120),
                        )
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(180),
                    ),
                    Container(
                      width: double.infinity,
                      height: ScreenUtil.getInstance().setHeight(500),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0.0, 15.0),
                                blurRadius: 15.0),
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0.0, -10.0),
                                blurRadius: 10.0),
                          ]),
                      child: Padding(
                        padding:
                            EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Login",
                                style: TextStyle(
                                    fontSize:
                                        ScreenUtil.getInstance().setSp(45),
                                    color: Colors.black,
                                    fontFamily: "Poppins-Bold",
                                    letterSpacing: .6)),
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(30),
                            ),
                            Text("Email",
                                style: TextStyle(
                                    fontFamily: "Poppins-Medium",
                                    color: Colors.black,
                                    fontSize:
                                        ScreenUtil.getInstance().setSp(26))),
                            TextFormField(
                              onSaved: (value) => _mail = value,
                              keyboardType: TextInputType.emailAddress,
                              validator: validateEmail,
                              decoration: InputDecoration(
                                  hintText: "jan.janssen@mail.be",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 12.0)),
                            ),
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(30),
                            ),
                            Text("Password",
                                style: TextStyle(
                                    fontFamily: "Poppins-Medium",
                                    color: Colors.black,
                                    fontSize:
                                        ScreenUtil.getInstance().setSp(26))),
                            TextFormField(
                              onSaved: (value) => _password = value,
                              obscureText: true,
                              validator: validatePassword,
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 12.0)),
                            ),
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(35),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontFamily: "Poppins-Medium",
                                      fontSize:
                                          ScreenUtil.getInstance().setSp(28)),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: ScreenUtil.getInstance().setHeight(40)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        // GestureDetector(
                        //   onTap: _radio,
                        //   child: Row(
                        //     children: <Widget>[
                        //       SizedBox(
                        //         width: 12.0,
                        //       ),
                        //       GestureDetector(
                        //         child: radioButton(_isSelected),
                        //       ),
                        //       SizedBox(
                        //         width: 8.0,
                        //       ),
                        //       Text("Remember me",
                        //           style: TextStyle(
                        //               color: Colors.black,
                        //               fontSize: 12,
                        //               fontFamily: "Poppins-Medium"))
                        //     ],
                        //   ),
                        // ),
                        InkWell(
                          child: Container(
                            width: ScreenUtil.getInstance().setWidth(330),
                            height: ScreenUtil.getInstance().setHeight(100),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color(0xFF17ead9),
                                  Color(0xFF6078ea)
                                ]),
                                borderRadius: BorderRadius.circular(6.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xFF6078ea).withOpacity(.3),
                                      offset: Offset(0.0, 8.0),
                                      blurRadius: 8.0)
                                ]),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  //check voor login
                                  _validateInputs();
                                  final form = _formKey.currentState;
                                  form.save();
                                },
                                child: Center(
                                  child: Text("SIGN IN",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Poppins-Bold",
                                          fontSize: 18,
                                          letterSpacing: 1.0)),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(40),
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(30),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "New User? ",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              color: Colors.black),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  settings: RouteSettings(name: "SignupPage"),
                                  builder: (BuildContext context) =>
                                      SignupPage()),
                            );
                          },
                          child: Text("Sign up",
                              style: TextStyle(
                                  color: Color(0xFF5d74e3),
                                  fontFamily: "Poppins-Bold")),
                        )
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(30),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.verified_user), 
                          color: Colors.green, 
                          onPressed: () async {
                            Map jsonLoginRequest = {"mail": "nickvbh@gmail.com", "password": "testpass"};
                            String jsonLoginResponse = await requestLogin(_url, jsonLoginRequest);
                            loggedInAccount = jsonToAccount(jsonLoginResponse);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => MainDrawer(0, null)),
                            );
                          }
                        ),
                        IconButton(
                          icon: Icon(Icons.supervised_user_circle), 
                          color: Colors.red, 
                          onPressed: () async {
                            Map jsonLoginRequest = {"mail": "jandenul@gmail.com", "password": "testpass"};
                            String jsonLoginResponse = await requestLogin(_url, jsonLoginRequest);
                            loggedInAccount = jsonToAccount(jsonLoginResponse);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => MainDrawer(0, null)),
                            );
                          }
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _validateInputs() async {
    if (_formKey.currentState.validate()) {
      //If all data are correct then save data to out variables
      _formKey.currentState.save();
      Map jsonLoginRequest = toJson();
      String jsonLoginResponse = await requestLogin(_url, jsonLoginRequest);
      print(jsonLoginResponse);

      if (!jsonLoginResponse.contains("error")) {
        loggedInAccount = jsonToAccount(jsonLoginResponse);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              settings: RouteSettings(name: "MainDrawer"),
              builder: (BuildContext context) => MainDrawer(0, null)),
        );
      }
    } else {
      //If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }

  // Function to create json
  Map toJson() => {"mail": _mail, "password": _password};

  // Check if login string is an email address based on a regexp
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  // Check if password string exists
  String validatePassword(String value) {
    Pattern pattern = r'^(?!\s*$).+';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter A Password';
    } else {
      return null;
    }
  }
}
