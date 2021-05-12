import 'package:flutter/material.dart';
import 'package:online_learning_app/services/user_service.dart';

class ProfileUpdate extends StatefulWidget {
  dynamic userInfo;
  ProfileUpdate({@required this.userInfo});
  @override
  _ProfileUpdateState createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {

  String name ;
  String phone ;
  @override
  void initState() {
    name = widget.userInfo['name'];
    phone = widget.userInfo['phone'];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Form'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  onChanged: (val){
                    setState(() {
                      name = val;
                    });
                  },
                  initialValue: name,
                  decoration: InputDecoration(
                    hintText: 'Name'
                  ),
                ),
            TextFormField(
              onChanged: (val){
                setState(() {
                  phone = val;
                });
              },
              initialValue: phone ,
            decoration: InputDecoration(
                hintText: 'Phone'
            ),
            ),
             RaisedButton(
                 child: Text('Update'),
                 onPressed: () async {
                    await User_Service().updateProfile(name, widget.userInfo['avatar'], phone, widget.userInfo['token']);
                    Navigator.pop(context);
                 }
                 )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
