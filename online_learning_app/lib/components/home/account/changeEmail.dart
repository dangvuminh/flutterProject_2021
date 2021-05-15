import 'package:flutter/material.dart';
import 'package:online_learning_app/services/user_service.dart';

class ChangeEmail extends StatefulWidget {
  final dynamic userInfo;
  ChangeEmail({@required this.userInfo});
  @override
  _ChangeEmailState createState() => _ChangeEmailState();
}

class _ChangeEmailState extends State<ChangeEmail> {
  String newEmail;
  String message='';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Change Email'),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text('New email:'),
                TextFormField(
                  obscureText: true,
                  onChanged: (val){
                    setState(() {
                      newEmail = val;
                    });
                  },
                  validator: (val)=> val.isEmpty ? 'The email input is empty' : null,
                  initialValue: newEmail ,
                  decoration: InputDecoration(
                      hintText: 'New email'
                  ),
                ),
                SizedBox(height: 20.0,),
                RaisedButton(
                    child: Text('Change email'),
                    onPressed: () async {
                      bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(newEmail);
                      if(emailValid == true){
                        if(_formKey.currentState.validate()){
                          var res = await User_Service().changeEmail(newEmail,widget.userInfo['token']);
                          if(res == 0){
                            setState(() {
                              message  = 'Your email already exists';
                            });
                          } else {
                            Navigator.pop(context,true);
                          }
                        } else {
                          setState(() {
                            message = 'Your email form is invalid';
                          });
                        }
                      }

                    }
                ),
                SizedBox(height: 20.0,),
                Text(message,style: TextStyle(color: Colors.red),)
              ],
            ),
          ),
        )
    );
  }
}
