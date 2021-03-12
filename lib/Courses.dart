import 'package:flutter/material.dart';
import 'package:mobile_flutter/objects/courseObject.dart';
import 'package:mobile_flutter/objects/authors.dart';
import 'package:mobile_flutter/CourseCard.dart';
import 'package:mobile_flutter/authorList.dart';
import 'package:mobile_flutter/nav-bar/download.dart';
import'package:mobile_flutter/nav-bar/homeCourse.dart';


class Courses extends StatefulWidget {

  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  static List<CourseObject> courses = [
      CourseObject(
        id: 0,
        productImage:'assets/react-flux.jpg',
        productName: 'Building Applications With React And Flux',
        company: 'Cory House',
        level: 'Intermediate',
        date: 'Jun 2019',
        duration: 5,
        rating: '1,366',
      ),
    CourseObject(
      id: 1,
      productImage:'assets/react-redux.jpg',
      productName: 'Building Applications With React And Redux',
      company: 'Cory House',
      level: 'Intermediate',
      date: 'Mar 2019',
      duration: 7,
      rating: '1,476',
    ),
    CourseObject(
      id: 2,
      productImage:'assets/react-nodejs.jpg',
      productName: 'Building Applications With React And NodeJS',
      company: 'Cory House',
      level: 'Intermediate',
      date: 'Feb 2019',
      duration: 7,
      rating: '1,476',
    ),

    CourseObject(
      id: 3,
      productImage:'assets/react.jpg',
      productName: 'React: Getting Started',
      company: 'Samer Buna',
      level: 'Beginner',
      date: 'Jun 2019',
      duration: 4,
      rating: '2,456',
    ),
    CourseObject(
      id: 4,
      productImage:'assets/react-redux.jpg',
      productName: 'Building Applications With React And Redux',
      company: 'Cory House',
      level: 'Intermediate',
      date: 'Mar 2019',
      duration: 7,
      rating: '1,476',
    ),
    CourseObject(
      id: 5,
      productImage:'assets/vuejs.jpg',
      productName: 'Building Applications With VueJS ',
      company: 'Cory House',
      level: 'Intermediate',
      date: 'Feb 2019',
      duration: 7,
      rating: '1,476',
    ),
  ];

  static List<Author> authors = [
    Author(
      id:0,
      authorImage: 'assets/tyrion.jpg',
      authorName: 'Tyrion Lannister',
    ),
    Author(
      id:1,
      authorImage: 'assets/cercei.png',
      authorName: 'Cercei Lannister',
    ),
    Author(
      id:2,
      authorImage: 'assets/danny.jpg',
      authorName: 'Daenerys Targaryen',
    ),
    Author(
      id:2,
      authorImage: 'assets/arya.jpg',
      authorName: 'Arya Stark',
    ),
    Author(
      id:2,
      authorImage: 'assets/jon.jpg',
      authorName: 'Jon Snow',
    ),
  ];

  int _selectedIndex = 0;

   List<Widget> navTabs = <Widget>[
      HomeCourse(
          courseData : courses,
         authorData : authors,
      ),
      DownloadTab(),
    ];
  Widget downLoadTab(){
      return Container();
  }

  void onItemTap(int index){
      setState(() {
        _selectedIndex = index;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.chevron_right,
        ),
        onPressed: (){
          Navigator.pushNamed(context, '');
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.grey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download_rounded),
            label: 'Business',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.open_in_browser),
            label: 'School',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Settings',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: onItemTap,
      ),
      body: SafeArea(
        child: navTabs.elementAt(_selectedIndex),
      ),
    );
  }
}
