import 'package:flutter/material.dart';
import 'package:online_learning_app/models/courseWithLessons.dart';
import 'package:online_learning_app/notifier/userNotifier.dart';
import 'package:online_learning_app/sharedTemplate/functions/sharedFunctions.dart';
import 'package:provider/provider.dart';

class LessonList extends StatefulWidget {
  final dynamic lessons;
  LessonList({@required this.lessons});
  @override
  _LessonListState createState() => _LessonListState();
}

class _LessonListState extends State<LessonList> {
  List<Lesson> lessonList = [];
  @override
  void initState(){
    lessonList =
   widget.lessons['lessons'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final UserNotifier user = Provider.of<UserNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Lessons'),
      ),
      body:Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
            itemCount: lessonList.length,
            itemBuilder: (context,index){
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: SharedFunctions().getRandomColorWidget(index,0.4),
                ),

                child: InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, '/lessonDetail',
                        arguments: {
                          'courseID':widget.lessons['courseID'],
                          'lessonID': lessonList[index].id,
                          'token': user.userProfile.token,
                        }
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Lesson ${index+1}',style: TextStyle(fontSize: 25.0),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(lessonList[index].name,style: TextStyle(fontSize: 19.0)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('${lessonList[index].hours} hr(s)'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.play_circle_outline_outlined)
                        ],
                      )
                    ],
                  ),
                ),
              );
            }

            ),
      )
  );
  }
}
