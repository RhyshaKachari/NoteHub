import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notehub/home.dart';
import 'package:notehub/services/auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class Login extends StatefulWidget {


  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login To App"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignInButton(Buttons.Google, onPressed:() async {
             await signInWithGoogle();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
            })
          ],
        ),
      ),
    );

  }
}