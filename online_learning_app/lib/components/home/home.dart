import 'package:flutter/material.dart';
import 'package:online_learning_app/components/home/myCourses.dart';
import 'package:online_learning_app/components/home/topCourses.dart';
import 'package:online_learning_app/notifier/userNotifier.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //Nav bottom bar function
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    TopCourses(),
    MyCourses(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Account',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final UserNotifier userNoti = Provider.of<UserNotifier>(context);
    //print(userNoti.userProfile.userInfo.email);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 130.0,
        title: Text('Home'),
        bottom: PreferredSize(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 15.0),
            child: Row(
              children: [
                Icon(
                  Icons.person,
                ),
                SizedBox(width: 10.0,),
                Column(
                  children: [
                    Text('${userNoti.userProfile.userInfo.name}'),
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1.0,color: Colors.white),
                        borderRadius:BorderRadius.circular(20.0),
                      ),
                      child: Text(
                          '${userNoti.userProfile.userInfo.email}',
                           style: TextStyle(

                           ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        actions: [
          FlatButton.icon(
              onPressed: (){
                userNoti.getLoginState(0, null);
              },
              icon: Icon(Icons.logout),
              label: Text("Log out"),
          )
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Top Courses',
            backgroundColor: Colors.lightBlueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'My courses',
            backgroundColor: Colors.lightBlue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            backgroundColor: Colors.cyanAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Account',
            backgroundColor: Colors.cyan,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
