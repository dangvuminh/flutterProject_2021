import 'package:flutter/material.dart';
import 'package:mobile_flutter/SignIn.dart';

class SignInList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.grey,
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       Text(
      //           'Sign In',
      //       ),
      //     ],
      //   ),
      // ),
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.chevron_right,
        ),
        onPressed: (){
          Navigator.pushNamed(context, '');
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top:10.0,bottom:10.0),
              color: Colors.grey[850],
              child: FlatButton(
                
                child:Row(
                  children: [
                    Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                      ),
                    Text(
                      'Sign In',
                      style: TextStyle(
                        color:Colors.white,
                        fontSize: 22.0,
                      ),
                    )
                  ],
                ),
                onPressed: (){
                  Navigator.pop(context, '/signIn');
                },
              )

            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 0.5, style: BorderStyle.solid),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text(
                        'Forgot your password?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                    Expanded(child: Container()),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 0.5, style: BorderStyle.solid),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text(
                      'Subscribe to PluralSight',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                    Expanded(child: Container()),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 0.5, style: BorderStyle.solid),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text(
                      'Restore subscription with Itunes',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                    Expanded(child: Container()),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 0.5, style: BorderStyle.solid),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text(
                      'Contact PluralSight support',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                    Expanded(child: Container()),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
