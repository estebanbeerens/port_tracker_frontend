import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:port_tracker/ui/pages/login_page.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => new _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  String _firstName;
  String _lastName;
  String _email;
  String _password;
  String _verificationCode;
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1125, allowFontScaling: true);

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
              key: _formKey,
              autovalidate: _autoValidate,
              child: Padding(
                padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 34.0),
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
                      // height: ScreenUtil.getInstance().setHeight(500),
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
                            Text("Create account",
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
                              //onSaved: (value) => _username = value,
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
                              //onSaved: (value) => _password = value,
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
                            Text("First Name",
                                style: TextStyle(
                                    fontFamily: "Poppins-Medium",
                                    color: Colors.black,
                                    fontSize:
                                        ScreenUtil.getInstance().setSp(26))),
                            TextFormField(
                              //onSaved: (value) => _password = value,
                              validator: validateFirstName,
                              decoration: InputDecoration(
                                  hintText: "Jan",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 12.0)),
                            ),
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(35),
                            ),
                            Text("Last Name",
                                style: TextStyle(
                                    fontFamily: "Poppins-Medium",
                                    color: Colors.black,
                                    fontSize:
                                        ScreenUtil.getInstance().setSp(26))),
                            TextFormField(
                              //onSaved: (value) => _password = value,
                              validator: validateLastName,
                              decoration: InputDecoration(
                                  hintText: "Janssen",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 12.0)),
                            ),
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(35),
                            ),
                            Text("Verification code",
                                style: TextStyle(
                                    fontFamily: "Poppins-Medium",
                                    color: Colors.black,
                                    fontSize:
                                        ScreenUtil.getInstance().setSp(26))),
                            TextFormField(
                              // onSaved: (value) => _password = value,
                              validator: validateVerificationCode,
                              decoration: InputDecoration(
                                  hintText: "Verification code",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 12.0)),
                            ),
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(35),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: ScreenUtil.getInstance().setHeight(40)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 12.0,
                            ),
                          ],
                        ),
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
                                  _validateInputs();
                                  //check voor login
                                  /*final form = _formKey.currentState;
                                  form.save();

                                  if (form.validate()) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          settings:
                                              RouteSettings(name: "LoginPage"),
                                          builder: (BuildContext context) =>
                                              LoginPage()),
                                    );
                                  }*/

                                  //print("$_username $_password");
                                },
                                child: Center(
                                  child: Text("SIGN UP",
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
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //     icon: Icon(Icons.arrow_back),
      //     label: Text("Go back"),
      //     backgroundColor: Colors.white70,
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     }),
    );
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      //If all data are correct then save data to out variables
      _formKey.currentState.save();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            settings: RouteSettings(name: "LoginPage"),
            builder: (BuildContext context) => LoginPage()),
      );
    } else {
      //If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }

  String validateEmail(String value) {
    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter Valid Email';
    } else {
      return null;
    }
  }

  String validatePassword(String value) {
    Pattern pattern = r'^(?!\s*$).+';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter A Password';
    } else {
      return null;
    }
  }

  String validateFirstName(String value) {
    Pattern pattern = r'^(?!\s*$).+';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter Valid First Name';
    } else {
      return null;
    }
  }

  String validateLastName(String value) {
    Pattern pattern = r'^(?!\s*$).+';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter Valid Last Name';
    } else {
      return null;
    }
  }

  String validateVerificationCode(String value) {
    Pattern pattern = r'^(?!\s*$).+';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter Valid Verification Code';
    } else {
      return null;
    }
  }
}
