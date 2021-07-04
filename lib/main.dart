import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartpointofsales/constants.dart';
import 'package:smartpointofsales/page/LoginPage.dart';
import 'package:smartpointofsales/page/MainScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme:ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        canvasColor: secondaryColor
      ),
      home: MyHomePage(title: "Achmad Point Of Sales"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool isLogin=false;
  checkSession() async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    String? userid = pref.getString("xUser");
    if(userid!=null){
      isLogin=true;
    }else{
      isLogin=false;
    }
    setState(() {

    });

  }


  Widget directPage(){
    if(isLogin){
      return MainScreen();
    }else{
      return LoginPage();
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    this.checkSession();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return directPage();
  }
}
