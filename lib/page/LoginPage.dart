import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartpointofsales/constants.dart';
import 'package:smartpointofsales/main.dart';
import 'package:smartpointofsales/utility/Tools.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userid = new TextEditingController();
  TextEditingController password = new TextEditingController();

  prosesLogin(BuildContext context) async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    pref.setString("xUser", "tester");
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: "Achmad POS")));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset("assets/images/asoftlogopos.png")],
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                color: secondaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.all(8.0),
                      child: Text("User Id",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                      child: Container(
                        height: 100,
                        child: TextField(
                          style: TextStyle(
                              color: Colors.black
                          ),
                          controller: userid,
                          decoration: InputDecoration(
                              hintText: "Enter password",
                              filled: true,
                              fillColor: Colors.white
                          ),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8.0),
                      child: Text("Password",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                      child: Container(
                        height: 100,
                        child: TextField(
                          style: TextStyle(
                              color: Colors.black
                          ),
                          controller: password,
                          decoration: InputDecoration(
                              hintText: "Enter password",
                              filled: true,
                              fillColor: Colors.white
                          ),
                          obscureText: true,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8.0),
                      child: Container(
                        child: ElevatedButton(
                          child: Text("Login"),
                          onPressed: (){
                            prosesLogin(context);
                          },
                        ),
                      )
                    )
                  ],
                ),
              ))
        ],
      )),
    );
  }
}
