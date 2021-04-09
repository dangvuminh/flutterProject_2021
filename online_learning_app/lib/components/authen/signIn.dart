import 'package:flutter/material.dart';
import 'package:online_learning_app/services/auth.dart';
import 'package:online_learning_app/notifier/userNotifier.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  final Function toogleForm;
  SignIn({this.toogleForm});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

   String email;
   String password;
  final Auth _auth = Auth();
  final _formKey = GlobalKey<FormState>();

  String error = '';
  @override
  Widget build(BuildContext context) {

    UserNotifier userNoti = Provider.of<UserNotifier>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Register'),
          actions: [
            FlatButton.icon(
                onPressed: (){
                  widget.toogleForm();
                },
                icon: Icon(Icons.person),
                label: Text('Register'))
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/techbg.jpeg'),
                fit: BoxFit.cover,
              )
          ),
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Username',
                    icon: Icon(Icons.person),
                  ),
                  validator: (val)=> val.isEmpty ? 'Please Enter this field' : null,
                  onChanged: (val){
                    setState(() {
                      email = val;
                    });
                  },
                ),

                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    icon: Icon(Icons.lock),
                  ),
                  validator: (val)=> val.isEmpty ? 'Please Enter this field' : null,
                  onChanged: (val){
                    password = val;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RaisedButton(
                    hoverColor: Colors.lightBlue,
                    padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
                    child: Text('Sign In'),
                    onPressed: ()  async {

                      if(_formKey.currentState.validate()){
                        dynamic res = await _auth.login( email,password);
                        if(res == null){
                          userNoti.getLoginState(0, null);
                          setState(() {
                            error = 'Failed to log in';
                          });
                        } else {
                          print('Successfully Signing up');
                          print(res);
                          userNoti.getLoginState(2,res);
                        }
                      }

                    },
                  ),
                ),
                SizedBox(height: 10.0),
                Center(
                  child: Text(
                    '$error',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}


