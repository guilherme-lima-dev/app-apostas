import 'package:flutter/material.dart';
import 'package:ole_players_app/views/login/login_page.dart';

class CustomLoginFAB extends StatelessWidget {
  const CustomLoginFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      child: FittedBox(
        child: FloatingActionButton(
          onPressed: (){
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => LoginPage())
            );
          },
          tooltip: 'Login',
          elevation: 15,
          backgroundColor: Color(0xffFF537F),
          child: Text("Login", style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}