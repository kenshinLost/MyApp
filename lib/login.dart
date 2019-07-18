import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key:key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
        Padding(padding: new EdgeInsets.all(20.0),
        child: Icon(Icons.help),)
        ],
        leading: Icon(Icons.arrow_back),
        title: Text('登录'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: new EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child:
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                labelText: "用户名",
                hintText: "请输入用户名",
                prefixIcon: Icon(Icons.person)
              ),
            ),
          ),
          Padding(
            padding: new EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: TextField(
              autofocus: true,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "密码",
                hintText: "请输入密码",
                prefixIcon: Icon(Icons.lock),
                suffix: Icon(Icons.remove_red_eye)
              )
            ),
          ),
          Padding(
            padding: new EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: RaisedButton(
              child: Text('登录'),
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}