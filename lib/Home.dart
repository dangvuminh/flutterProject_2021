import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.chevron_right,
        ),
        onPressed: (){
          Navigator.pushNamed(context, '/signIn');
        },
      ),
      body: Column(
        children: [
          Container(
            height: 370.0,
          ),
          Expanded(
            child: Column(
              children: [
                FlatButton(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/pluralSightIcon.jpg'),
                      radius: 35.0,
                    ),
                    onPressed:(){}
                ),
                Text(
                    'PLURALSIGHT',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 3.0,
                      color: Colors.white,
                      fontSize: 25.0,
                    )
                ),
                SizedBox(height: 30.0),
                Container(
                  padding: EdgeInsets.fromLTRB(175, 10, 175, 10),
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
                    borderRadius: BorderRadius.all(Radius.circular(3.0)),
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  padding: EdgeInsets.fromLTRB(95, 10, 95, 10),
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
                Container(
                  padding: EdgeInsets.fromLTRB(67, 10, 67, 10),
                  child: Text(
                      'Explore without a subscription',
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}