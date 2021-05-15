import 'package:flutter/material.dart';
import 'package:online_learning_app/services/user_service.dart';

class ChangePassword extends StatefulWidget {
  final dynamic userInfo;
  ChangePassword({@required this.userInfo});

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  String oldPassword;
  String newPassword;
  String message = '';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text('Old password:'),
              TextFormField(
                obscureText: true,
                onChanged: (val){
                  setState(() {
                    oldPassword = val;
                  });
                },
                initialValue: oldPassword,
                decoration: InputDecoration(
                    hintText: 'Old Password '
                ),
              ),
              SizedBox(height: 30.0,),
              Text('New Password:'),
              TextFormField(
                obscureText: true,
                onChanged: (val){
                  setState(() {
                    newPassword = val;
                  });
                },
                validator: (val)=> val.length < 6 ? 'The mumber of characters is not more than 6' : null,
                initialValue: newPassword ,
                decoration: InputDecoration(
                    hintText: 'New Password'
                ),
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                  child: Text('Change Password'),
                  onPressed: () async {
                    var res = await User_Service().changPassword(widget.userInfo['id'],oldPassword,
                        newPassword, widget.userInfo['token']);
                    if(_formKey.currentState.validate()){
                      if(res == 0){
                        setState(() {
                          message  = 'Your old password is incorrect';
                        });
                      } else {
                          Navigator.pop(context,true);
                      }
                    }
                  }
              ),
              SizedBox(height: 20.0,),
              Text(message,style: TextStyle(color: Colors.red),)
            ],
          ),
        ),
      ),
    );
  }
}
