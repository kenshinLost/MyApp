import 'package:flutter/material.dart';
import 'package:myapp/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectIndex = 0;

  int loginState;

  void _selectedTab(int index){
    setState(() {
      _selectIndex = index;
    });
  }


Future _validateLogin() async{
    Future<dynamic> future = Future(() async{
      SharedPreferences prefs =await SharedPreferences.getInstance();
      return prefs.getString("loginToken");
    });

    future.then((val){
      if(val == null){
        setState(() {
          loginState = 0;
        });
      }else{
        setState(() {
          loginState = 1;
        });
      }
    }).catchError((e){
      print(e.toString());
    });
  }
  
  void initState() {
    super.initState();
    _validateLogin();
  }

  Scaffold homePage() {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
            child:Card(
              // elevation: 20.0,
              shape:  new RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              clipBehavior: Clip.antiAlias,
              semanticContainer: false,
              // borderOnForeground: true,
              child: Container(height: 250.0,width: 250.0,),
            ),
        ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        onTap: _selectedTab,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            title: Text('商城'),
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person_pin_circle),title: Text('我的')),
          // BottomNavigationBarItem(icon: Icon(Icons.settings),title: Text('设置')),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  Widget build(BuildContext context) {
    if(loginState == 0) {
      return LoginPage();
    }else{
      return homePage();
    }
  }
}