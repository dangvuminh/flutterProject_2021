import 'package:flutter/material.dart';
import 'package:online_learning_app/services/user_service.dart';

class ProfileUpdate extends StatefulWidget {
  final dynamic userInfo;
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            //When you change or not change anything on the text field then you click Back Button on appbar
            // return the name of current user when not updating
            Navigator.pop(context,widget.userInfo['name']);
          },
        ),
        title: Text('Update Form'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: Column(
              children: [
                Text('Name:'),
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
                SizedBox(height: 30.0,),
                Text('Phone:'),
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
                    Navigator.pop(context,name);
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
