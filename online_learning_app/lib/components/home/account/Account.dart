import 'package:flutter/material.dart';
import 'package:online_learning_app/notifier/userNotifier.dart';
import 'package:online_learning_app/services/user_service.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Account extends StatefulWidget {
  String token;
  Account({this.token});
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  String trial = 'user/macbook/stackoverflow.com/questions/52975739/dart-flutter-validating-a-string-for-url';
  File _image;
  String imagePath;
  final picker = ImagePicker();
  bool isFirstHit = false;
  Future<dynamic> _userInfo;

  @override
  void initState() {
    _userInfo = User_Service().getUserInfo(widget.token);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final UserNotifier user = Provider.of<UserNotifier>(context);

    Future getImage() async {
      final pickedFile = await picker.getImage(source: ImageSource.gallery);
      setState(() {
        if (pickedFile != null) {
          imagePath = pickedFile.path;
          _image = File(pickedFile.path);
        } else {
          print('No image selected.');
        }
        isFirstHit = true;
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
                        onPressed: () async {
                           await getImage();
                           var userdata = await User_Service().getUserInfo(user.userProfile.token);
                           var newUserInfo = await User_Service().updateProfile(userdata.name, imagePath, userdata.phone, widget.token);
                        },
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
    return FutureBuilder(
         future: _userInfo,
        builder: (context,snapshot){
      if(snapshot.hasData){
        var urlPattern = r"(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?";
        var isUrl = new RegExp(urlPattern, caseSensitive: false).firstMatch(snapshot.data.avatar);
        
        if( isUrl == null && isFirstHit == false){
          _image = File(snapshot.data.avatar);
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
                                    //backgroundImage: _image == null ? AssetImage('assets/avatar.png') : FileImage(_image),
                                    backgroundImage: _image == null ? NetworkImage(snapshot.data.avatar) : FileImage(_image),
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

      return CircularProgressIndicator();
    });

  }
}
