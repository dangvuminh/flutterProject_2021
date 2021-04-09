import 'package:flutter/material.dart';
import 'package:online_learning_app/components/authen/register.dart';
import 'package:online_learning_app/components/authen/signIn.dart';

class Authenticate extends StatefulWidget {

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool isSignInForm = true;

  void toogleForm(){
    setState(() {
      isSignInForm = !isSignInForm;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(isSignInForm)
    return SignIn(toogleForm: toogleForm);
    return Register(toogleForm: toogleForm);
  }
}
