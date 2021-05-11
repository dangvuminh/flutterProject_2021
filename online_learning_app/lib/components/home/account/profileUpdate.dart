import 'package:flutter/material.dart';

class ProfileUpdate extends StatefulWidget {
  @override
  _ProfileUpdateState createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Name'
              ),
            ),
        TextFormField(
        decoration: InputDecoration(
            hintText: 'Phone'
        ),
        ),
          ],
        ),
      ),
    );
  }
}
