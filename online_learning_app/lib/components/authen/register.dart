import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:online_learning_app/models/user.dart';
import 'package:online_learning_app/notifier/userNotifier.dart';
import 'package:online_learning_app/services/auth.dart';
import 'package:provider/provider.dart';


class Register extends StatefulWidget {
  final Function toogleForm;
  Register({this.toogleForm});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String username; String email;
  String phone; String password;
  final Auth _auth = Auth();
  final _formKey = GlobalKey<FormState>();
  String error = '';

  @override
  Widget build(BuildContext context) {

    UserNotifier userNoti = Provider.of<UserNotifier>(context);
    return
      Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        actions: [
          FlatButton.icon(
              onPressed: (){
                widget.toogleForm();
              },
              icon: Icon(Icons.person),
              label: Text('Sign In'))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/techbg2.png'),
              fit: BoxFit.contain,
            )
        ),
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Username',
                  icon: Icon(Icons.person),
                ),
                validator: (val)=> val.isEmpty ? 'Please Enter this field' : null,
                onChanged: (val){
                  setState(() {
                    username = val;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  icon: Icon(Icons.email),
                ),
                validator: (val)=> val.isEmpty ? 'Please Enter this field' : null,
                onChanged: (val){
                  setState(() {
                    email = val;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Phone',
                  icon: Icon(Icons.phone),
                ),
                validator: (val)=> num.tryParse(val) == null ? 'Number Only' : null,
                onChanged: (val){
                  setState(() {
                    phone = val;
                  });
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  icon: Icon(Icons.lock),
                ),
                validator: (val)=> val.isEmpty ? 'Please Enter this field' : null,
                onChanged: (val){
                  password = val;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: RaisedButton(
                    hoverColor: Colors.lightBlue,
                    padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
                    child: Text('Sign up'),
                    onPressed: ()  async {
                      if(_formKey.currentState.validate()) {
                        dynamic res = await _auth.signUp(
                            username, email, phone, password);
                        print(res);
                        if (res == null) {
                          print('Failed to Sign up');
                          //userNoti.getUser(null);
                          userNoti.getRegisterState(0,null);
                          setState(() {
                            error =
                            'This username already exists.Please try another!';
                          });
                        } else {
                          print('Successfully Signing up');
                           await _auth.sendActivateEmail(email);
                             userNoti.getRegisterState(1,res);
                        }
                      }
                    },
                ),
              ),
              SizedBox(height: 10.0),
              Center(
                child: Text(
                  '$error',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
