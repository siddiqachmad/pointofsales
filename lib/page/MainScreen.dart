import 'package:flutter/material.dart';
import 'package:smartpointofsales/component/admin/MenuHome.dart';
import 'package:smartpointofsales/constants.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int pos=0;
  Widget menuAdmin(){
    if(pos==0){
      return Text("Ini Dashboard");
    }
    else if(pos==1){
      return MenuHome();
    }else{
      return Text("Ini Dashboard");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
                child: Column(
                  children: [
                    DrawerHeader(
                        child: Image.asset("assets/images/asoftlogopos.png"),
                    ),
                    ListTile(
                      onTap: (){
                        pos=0;
                        setState(() {

                        });
                      },
                      title: Text("Dashboard"),
                    ),
                    ListTile(
                      onTap: (){
                        pos=1;
                        setState(() {

                        });
                      },
                      title: Text("Menu Makanan"),
                    ),
                  ],
                )
            ),
            Expanded(
              flex: 5,
                child: Container(
                  color: secondaryColor,
                  child: menuAdmin(),
                )
            )
          ],
        ),
      ),
    );
  }
}
