import 'package:flutter/material.dart';
import 'package:online_learning_app/notifier/userNotifier.dart';
import 'package:online_learning_app/services/auth.dart';
import 'package:provider/provider.dart';

class ActivateEmail extends StatefulWidget {
  final String email;
  ActivateEmail({this.email});
  @override
  _ActivateEmailState createState() => _ActivateEmailState();
}

class _ActivateEmailState extends State<ActivateEmail> {
  Auth _auth = Auth();
  @override
  Widget build(BuildContext context) {

    UserNotifier userNoti = Provider.of<UserNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Activate Email'),
      ),
      body: Container(
        child: Form(
          child: Column(
            children: [
              Center(
                child: Text('An email to activate your account has been sent to your email.'
                    'Please head to your mailbox to confirm.Then come back and hit the Sign In button below.'),
              ),
              RaisedButton(
                  child: Text('Activate Account'),
                  onPressed: () async {
                    //await _auth.sendActivateEmail(email);
                    userNoti.getRegisterState(0, null);
                  }
                  )
            ],
          ),
        ),
      ),
    );
  }
}
