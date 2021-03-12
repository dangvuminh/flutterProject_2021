import 'package:flutter/material.dart';
import 'package:mobile_flutter/minimizedCourseCard.dart';
import 'package:mobile_flutter/objects/courseObject.dart';

class AllCourses extends StatelessWidget {

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top:10.0,bottom:10.0),
                color: Colors.grey[850],
                child: Row(
                  children: [
                    FlatButton(

                      child:Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          Text(
                            'React',
                            style: TextStyle(
                              color:Colors.white,
                              fontSize: 22.0,
                            ),
                          )
                        ],
                      ),
                      onPressed: (){
                        Navigator.pop(context, '/courses');
                      },
                    ),
                    Container(
                        margin:EdgeInsets.only(left: 80.0) ,
                        child: Text(
                            'New',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              decoration: TextDecoration.none,
                            )
                        )
                    ),
                  ],
                ),
              ),

              Expanded(
                child: ListView.builder(
                   itemCount:   courses.length,
                    itemBuilder: ( context,i){
                        return MinimizedCourseCard(
                          data: courses[i],
                       );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
