import 'package:flutter/material.dart';
import 'package:mobile_flutter/objects/courseObject.dart';
import 'package:mobile_flutter/CourseCard.dart';
import 'package:mobile_flutter/objects/authors.dart';
import 'package:mobile_flutter/authorList.dart';

class HomeCourse extends StatelessWidget {
  final List<CourseObject> courseData;
  final List<Author> authorData;
  HomeCourse({this.courseData,this.authorData});

  @override
  Widget build(BuildContext context) {
    return
      Column(
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
            // height: 50.0,
            // width: 800.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:   courseData.length,
                itemBuilder: ( context,i){
                  if(courseData[i].id <3)
                    return CourseCard(
                      id: courseData[i].id,
                      productImage: courseData[i].productImage,
                      productName: courseData[i].productName,
                      company: courseData[i].company,
                      level: courseData[i].level,
                      date: courseData[i].date,
                      duration: courseData[i].duration,
                      rating: courseData[i].rating,
                    );
                  return Container();

                }),
          ),
        ),
        Expanded(
          child: Container(
            // height: 50.0,
            // width: 800.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:   courseData.length,
                itemBuilder: ( context,i){
                  if(courseData[i].id>2)
                    return CourseCard(
                      id: courseData[i].id,
                      productImage: courseData[i].productImage,
                      productName: courseData[i].productName,
                      company: courseData[i].company,
                      level: courseData[i].level,
                      date: courseData[i].date,
                      duration: courseData[i].duration,
                      rating: courseData[i].rating,
                    );
                  return Container();
                }),
          ),
        ),
        SizedBox(height: 15.0),
        Expanded(
          child:Column(
            children: [
              Container(
                width:400.0,
                child: Text(
                  'Top Authors',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 50.0,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:   authorData.length,
                      itemBuilder: ( context,i){
                        return AuthorList(
                          id: authorData[i].id,
                          authorImage: authorData[i].authorImage,
                          authorName: authorData[i].authorName,
                        );
                      }),
                ),
              ),
            ],
          ),
        )
      ],
   );
  }
}
