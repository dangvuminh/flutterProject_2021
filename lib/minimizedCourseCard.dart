import 'package:flutter/material.dart';
import 'package:mobile_flutter/objects/courseObject.dart';

class MinimizedCourseCard extends StatelessWidget {
  final CourseObject data ;
  MinimizedCourseCard({this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[850],
      margin: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Image(image: AssetImage(data.productImage),
              height:60,width:60,
              fit:BoxFit.fill
          ),
          Container(
            margin: EdgeInsets.only(left: 20.0),
            width: 250.0,
            height: 100.0,
            child: Column(
              children: [
                Text(
                  '${data.productName}',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: 250.0,
                  child: Text(
                    '${data.company}',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                  ),
                ),

                Container(
                  width: 250.0,
                  child: Row(
                    children: [
                      Text(
                        '${data.level}',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 5),
                        child: Text(
                          '.',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      Text(
                        '${data.date}',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 5),
                        child: Text(
                          '.',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      Text(
                        '${data.duration}',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: 250.0,
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 13.0,
                        color: Colors.yellowAccent,
                      ),
                      Icon(
                        Icons.star,
                        size: 13.0,
                        color: Colors.yellowAccent,
                      ),
                      Icon(
                        Icons.star,
                        size: 13.0,
                        color: Colors.yellowAccent,
                      ),
                      Icon(
                        Icons.star,
                        size: 13.0,
                        color: Colors.yellowAccent,
                      ),
                      Icon(
                        Icons.star,
                        size: 13.0,
                        color: Colors.yellowAccent,
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        '${data.rating}',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
