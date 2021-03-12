import 'package:flutter/material.dart';
import 'package:mobile_flutter/objects/courseObject.dart';

class CourseCard extends StatelessWidget {

   int id;
   String productName;
   String productImage;
   String company;
    String level;
   String rating;
   String date;
   int duration;
   CourseCard({this.id,this.productImage,this.productName,this.company,this.level,this.date,this.duration,this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50,
      // width: 200,
      color: Colors.grey[850],
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Image(image: AssetImage(productImage),
              height:100,width:260,
              fit:BoxFit.fill
          ),
          Container(
            width: 250.0,
            child: Column(
              children: [
              Text(
              '$productName',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
                Container(
                  width: 250.0,
                  child: Text(
                    '$company',
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
                        '$level',
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
                        '$date',
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
                        '$duration',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
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
                  '$rating',
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
    );
  }
}
