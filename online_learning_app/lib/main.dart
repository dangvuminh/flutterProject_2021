import 'package:flutter/material.dart';
import 'package:online_learning_app/components/home/courses/courseDetail.dart';
import 'package:online_learning_app/components/wrapper.dart';
import 'package:online_learning_app/models/user.dart';
import 'package:online_learning_app/notifier/userNotifier.dart';
import 'package:online_learning_app/routes/RouteGenerator.dart';
import 'package:online_learning_app/services/auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserNotifier>(
      create:(context) => UserNotifier() ,
      child: MaterialApp(
        initialRoute: '/',
        onGenerateRoute:  RouteGenerator.generateRoute,
      ),
    );
  }
}
