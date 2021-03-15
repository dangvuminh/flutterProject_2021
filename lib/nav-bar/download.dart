import 'package:flutter/material.dart';
import 'package:mobile_flutter/minimizedCourseCard.dart';
import 'package:mobile_flutter/objects/courseObject.dart';

class DownloadTab extends StatelessWidget {
  final List<CourseObject> courseData;
  DownloadTab({this.courseData});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            color: Colors.grey[850],
            child: Center(
              child: Text(
                  'Downloads',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                    'Downloads',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Remove all',
                  style: TextStyle(
                    color: Colors.blue[300],
                    fontSize: 15.0,
                  ),
                ),
              ),
            ],
          ),

          Expanded(child: ListView.builder(
              itemCount: courseData.length,
            itemBuilder:(context,i) {
                if(i % 2 == 0)
                return MinimizedCourseCard(
                 data: courseData[i],
                );
                return Container();
            },
          ))
        ],
      ),
    );
  }
}
