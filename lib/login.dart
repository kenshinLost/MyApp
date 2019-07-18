import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void _login(){
    print('object');
  }

  @override
  Widget build(BuildContext context) {
    final AppBar appBar = AppBar(
      actions: <Widget>[
        Padding(
          padding: new EdgeInsets.all(20.0),
          child: Icon(Icons.help),
        )
      ],
      leading: Icon(Icons.arrow_back),
      title: Text('登录'),
    );

    final Widget userInput = Padding(
      padding: new EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: TextField(
        autofocus: true,
        decoration: InputDecoration(
            labelText: "用户名",
            hintText: "请输入用户名",
            prefixIcon: Icon(Icons.person)),
      ),
    );
    final Widget passwdInput = Padding(
      padding: new EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: TextField(
          autofocus: true,
          obscureText: true,
          decoration: InputDecoration(
              labelText: "密码",
              hintText: "请输入密码",
              prefixIcon: Icon(Icons.lock),
              suffixText: '忘记密码',
          ))
              // suffix: Icon(Icons.remove_red_eye))),
    );
    final Widget loginButton = Padding(
      padding: new EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
      child: RaisedButton(
          child: Container(
            child: Text('登录',textAlign: TextAlign.center,),
            width: MediaQuery.of(context).size.width * 0.8,
          ),
          color: Colors.red[300],
          onPressed: _login,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))
          )
      ),
    );
    final Widget textButton = Container(
        width: MediaQuery.of(context).size.width * 0.85,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('游客登录'),
            Text('新用户注册'),
          ],
        ),
      );
    return Scaffold(
      appBar: appBar,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          userInput,
          passwdInput,
          loginButton,
          textButton,
        ],
      ),
    );
  }
}
