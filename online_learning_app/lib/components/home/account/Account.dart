import 'package:flutter/material.dart';
import 'package:online_learning_app/notifier/userNotifier.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  File _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final UserNotifier user = Provider.of<UserNotifier>(context);

    Future getImage() async {
      final pickedFile = await picker.getImage(source: ImageSource.gallery);

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        } else {
          print('No image selected.');
        }
      });
    }
    
    Widget bottomSheet(){
      return Container(
        height: 120.0,
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text('Choose profile photo',style: TextStyle(fontSize: 20.0),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    FlatButton.icon(
                        icon: Icon(Icons.photo_outlined),
                        label: Text('Gallery'),
                        onPressed: getImage
                        //     ()  {
                        //    getImage(ImageSource.gallery);
                        // },
                    ),

                  ],
                ),
                SizedBox(width: 20.0,),
                Column(
                  children: [
                    FlatButton.icon(
                        icon: Icon(Icons.camera_alt_outlined),
                        label: Text('Camera'),
                        onPressed: (){
                         // getImage(ImageSource.camera);
                        }

                    ),
                  ],
                )
              ],
            )
          ],
        ),
      );
    }
    return Container(
      color: Colors.grey[200],
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: Stack(
              children: [
                Container(
                  color: Colors.lightBlue,
                  height: 120.0,
                ),
                Center(
                  heightFactor: 2.3,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          FlatButton(
                            child: CircleAvatar(
                              radius: 40.0,
                              backgroundImage: _image == null ? AssetImage('assets/avatar.png') : FileImage(_image),
                            ),
                            onPressed: (){
                              showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context){
                                    return bottomSheet();
                                  });
                            },
                          ),
                          Positioned(
                            bottom: 10.0,
                            right: 23.0,
                            child: Icon(Icons.camera_alt),
                          )
                        ],
                      ),
                      user.userProfile.userInfo.name != null
                          ? Text(user.userProfile.userInfo.name,style: TextStyle(fontSize: 20.0),)
                          : Text('Anonymous',style: TextStyle(fontSize: 20.0)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0,),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(Icons.settings),
                      SizedBox(width:10.0),
                      Text('Update profile')
                    ],
                  ),
                ),
                Divider(height: 1.0,color: Colors.grey[400],),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(Icons.lock),
                      SizedBox(width:10.0),
                      Text('Change password'),
                    ],
                  ),
                ),

                Divider(height: 1.0,color: Colors.grey[400],),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(Icons.lock_open),
                      SizedBox(width:10.0),
                      Text('Reset password'),
                    ],
                  ),
                ),

                Divider(height: 1.0,color: Colors.grey[400],),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(Icons.email_outlined),
                      SizedBox(width:10.0),
                      Text('Change email'),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
