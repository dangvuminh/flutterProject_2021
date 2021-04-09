import 'package:flutter/material.dart';
import 'package:online_learning_app/components/home/topCourses/topNewCourses.dart';
import 'package:online_learning_app/components/home/topCourses/topRatedCourses.dart';
import 'package:online_learning_app/components/home/topCourses/topSellCourses.dart';

class TopCourses extends StatefulWidget {
  @override
  _TopCoursesState createState() => _TopCoursesState();
}

class _TopCoursesState extends State<TopCourses> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80.0,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.attach_money),
                text: 'Top sell',
              ),
              Tab(
                icon: Icon(Icons.wb_sunny_outlined),
                text: 'Top New',
              ),
              Tab(
                icon: Icon(Icons.star_rate_outlined),
                text: 'Top rate',
              ),
            ],
          ),
        ),

        body:  TabBarView(
          children: <Widget>[
            Center(
              child: TopSellCourses(),
            ),
            Center(
              child: TopRatedCourse(),
            ),
            Center(
              child: TopNewCourses(),
            ),
          ],
        ),
      ),
    );
  }
}
