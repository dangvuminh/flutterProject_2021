import 'package:flutter/material.dart';
import 'package:online_learning_app/notifier/userNotifier.dart';
import 'package:provider/provider.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    final UserNotifier user = Provider.of<UserNotifier>(context);
    return Container(
        child: Column(
          children: [
          ],
        ),
    );
  }
}
