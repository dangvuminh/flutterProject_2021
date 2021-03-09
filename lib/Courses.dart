import 'package:flutter/material.dart';
import 'package:mobile_flutter/objects/courseObject.dart';
import 'package:mobile_flutter/CourseCard.dart';
class Courses extends StatelessWidget {

  List<CourseObject> courses = [
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
      id: 0,
      productImage:'assets/react-flux.jpg',
      productName: 'Building Applications With React And Flux',
      company: 'Cory House',
      level: 'Intermediate',
      date: 'Jun 2019',
      duration: 5,
      rating: '1,366',
    ),
  ];


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
      body: SafeArea(
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
                          'Back',
                          style: TextStyle(
                            color:Colors.white,
                            fontSize: 22.0,
                          ),
                        )
                      ],
                    ),
                    onPressed: (){
                      Navigator.pop(context, '/signInList');
                    },
                  ),
                  Container(
                      margin:EdgeInsets.only(left: 80.0) ,
                      child: Text(
                          'React',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          )
                      )
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Text(
                      'New',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  Expanded(child: Container()),
                  FlatButton(
                      onPressed: null,
                      child: Row(
                        children: [
                          Container(
                            padding:EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              color: Colors.grey[850],
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'See all',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: 250.0,
                width: 200.0,
                child: ListView.builder(

                  itemCount:   courses.length,
                  itemBuilder: ( context,i){
                      return CourseCard(
                        id: courses[i].id,
                        productImage: courses[i].productImage,
                        productName: courses[i].productName,
                        company: courses[i].company,
                        level: courses[i].level,
                        date: courses[i].date,
                        duration: courses[i].duration,
                        rating: courses[i].rating,
                      );

                  }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
