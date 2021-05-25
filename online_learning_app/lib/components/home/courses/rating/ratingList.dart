import 'package:flutter/material.dart';
import 'package:online_learning_app/services/rating_service.dart';

class RatingList extends StatefulWidget {
  String courseID;
  String token;

  RatingList({this.courseID,this.token});
  @override
  _RatingListState createState() => _RatingListState();
}

class _RatingListState extends State<RatingList> {
  Future<dynamic> _rating;
  @override
  void initState() {
    // TODO: implement initState
    _rating = Rating_Service().getRating(widget.courseID, widget.token);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _rating,
      builder: (context,snapshot){
        if(snapshot.hasData){
          return Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/avatar.png'),
                    ),
                    SizedBox(width: 5.0,),
                    Text('User'),
                  ],
                ),
              SizedBox(height: 10.0,),
              Text(snapshot.data.content),
              ],
            ),
          );
        } else{
          return Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}
