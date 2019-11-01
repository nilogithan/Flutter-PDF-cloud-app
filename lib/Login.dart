import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Home.dart';

class LoginPage extends StatefulWidget{
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  String _Username;
  String _password;
  final formkey = new GlobalKey<FormState>();
  final key = new GlobalKey<ScaffoldState>();

  void ValidateAndSave(){
    final Form = formkey.currentState;
    if(Form.validate()){
      Form.save();
      print('Form is valid. Username:$_Username, Password:$_password');
    }else{
      print('Form is valid. Username:$_Username, Password:$_password');
    }

    if(_Username == 'nilogithan' && _password == '12345'){
      Navigator.push(context,
      MaterialPageRoute(builder: (context) => HomePage()));
    }else{
      key.currentState.showSnackBar(new SnackBar(
        content: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text('Username or Password is wrong')],
        ),
      ));
    }
  }

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
        ScreenUtil(width: 750, height: 1200, allowFontScaling: true);
    return new Scaffold(
      key: key,
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0,bottom: 5.0),
                child: Image.asset("assets/image1.png"),
              ),

            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0),
              child: Column(
                children: <Widget>[

                  Row(
                    children: <Widget>[
                      Image.asset(
                        "assets/image_02.png",
                        width: ScreenUtil.getInstance().setWidth(110),
                        height: ScreenUtil.getInstance().setHeight(50),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(180),
                  ),
                  Container(
                      width: double.infinity,
                      height: ScreenUtil.getInstance().setHeight(620),
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
                      child: Form(
                        key: formkey,
                        child: Padding(
                          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Image.asset("assets/image1.png",height: 50.0,width: 50.0,),
                                  Text("Login",
                                      style: TextStyle(
                                          fontSize: ScreenUtil.getInstance().setSp(45),
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .6)),
                                ],
                              ),

                              SizedBox(
                                height: ScreenUtil.getInstance().setHeight(30),
                              ),
                              Text("Username",
                                  style: TextStyle(
                                      fontFamily: "Poppins-Medium",
                                      fontSize: ScreenUtil.getInstance().setSp(26))),
                              TextFormField(
                                decoration: InputDecoration(
                                    hintText: "username",
                                    hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                                validator: (value) => value.isEmpty ? 'Username can\'t empty' : null,
                                onSaved: (value) => _Username = value,
                              ),
                              SizedBox(
                                height: ScreenUtil.getInstance().setHeight(30),
                              ),
                              Text("Password",
                                  style: TextStyle(
                                      fontFamily: "Poppins-Medium",
                                      fontSize: ScreenUtil.getInstance().setSp(26))),
                              TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                                validator: (value) => value.isEmpty ? 'Password can\'t empty' : null,
                                onSaved: (value) => _password = value,
                              ),

                              Padding(
                                padding: EdgeInsets.only(bottom: 20.0),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[

                                  InkWell(
                                    child: Container(
                                      width: ScreenUtil.getInstance().setWidth(330),
                                      height: ScreenUtil.getInstance().setHeight(100),
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                            Color(0xFFE53935),
                                            Color(0xFFB71c1c)
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
                                          onTap: ValidateAndSave,
                                          child: Center(
                                            child: Text("SIGNIN",
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
                            ],
                          ),
                        ),
                      )
                  ),

                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(40),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}