import 'package:flutter/material.dart';
import 'package:online_learning_app/components/authen/activateEmail.dart';
import 'package:online_learning_app/components/authen/authenticate.dart';
import 'package:online_learning_app/components/home/home.dart';
import 'package:online_learning_app/models/user.dart';
import 'package:online_learning_app/models/userInfo.dart';
import 'package:online_learning_app/notifier/userNotifier.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserNotifier>(context);
    if(user.state == 2){
      return Provider<UserProfile>.value(
        value: user.userProfile != null ? user.userProfile : null ,
          child: Home()
      );
    } else if(user.state == 1){
      return ActivateEmail(email : user.user.email);
    } else{
      return Authenticate();
    }
  }
}
