import 'package:flutter/material.dart';
import 'package:online_learning_app/components/home/account/Account.dart';
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
  String appBarName="Home";
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    TopCourses(),
    MyCourses(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
   Account(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      if(index == 0)
        appBarName = 'Home';
      if(index == 1)
        appBarName = 'My Courses';
      if(index == 2)
        appBarName = 'NULL';
      if(index == 3)
        appBarName = 'Account Settings';

    });
  }

  @override
  Widget build(BuildContext context) {
    final UserNotifier userNoti = Provider.of<UserNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        //toolbarHeight: 130.0,
        title: Text(appBarName),
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
