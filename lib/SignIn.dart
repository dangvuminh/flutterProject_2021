import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Sign In'),
        backgroundColor: Colors.grey[850],
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Container(
              height: 250.0,
            ),
            Expanded(child: Container(
              child: Column(
                children: [
                  Container(
                    width: 500.0,
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Text(
                      'Email or username',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w500,
                      )
                    ),
                  ),
                  Container(
                    width: 400.0,
                    height: 50.0,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        fillColor: Colors.grey[600],
                        filled: true,
                      ),
                    ),
                  ),

                  Container(
                    width: 500.0,
                    margin: EdgeInsets.only(top:15.0),
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Text(
                        'Password',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w500,
                        )
                    ),
                  ),
                  Container(
                    width: 400.0,
                    height: 50.0,
                    child: Stack(
                      children: [
                         TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            fillColor: Colors.grey[600],
                            filled: true,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.remove_red_eye_outlined,
                            size: 30.0,
                          ),
                        )
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top:15.0),
                    padding: EdgeInsets.fromLTRB(170, 15, 170, 15),
                    child: Text(
                        'Sign In',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 18.0,
                        )
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.lightBlue,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                      'Need help ?',
                      style: TextStyle(
                        color: Colors.lightBlue,
                      )
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    padding: EdgeInsets.fromLTRB(80, 10, 80, 10),
                    child: Text(
                        'Use Single Sign-On (SSO)',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w600,
                          color: Colors.lightBlue,
                          fontSize: 18.0,
                        )
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightBlue),
                      borderRadius: BorderRadius.all(Radius.circular(3.0)),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Container(
                    padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                    child: Text(
                        'Subscribe to PluralSight',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w600,
                          color: Colors.lightBlue,
                          fontSize: 18.0,
                        )
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightBlue),
                      borderRadius: BorderRadius.all(Radius.circular(3.0)),
                    ),
                  ),
                  SizedBox(height: 15.0),
                ],
              ),
            )),
          ],
        ),
      )
    );
  }
}
