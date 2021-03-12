import 'package:flutter/material.dart';
import 'package:mobile_flutter/objects/authors.dart';

class AuthorList extends StatelessWidget {
  int id;
  String authorImage;
  String authorName;

  AuthorList({this.id,this.authorImage,this.authorName});
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 50.0,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10.0,10.0,10.0,5.0),
            child: Column(
              children: [
                CircleAvatar(backgroundImage: AssetImage(authorImage),
                  radius: 40,
                ),
                Text(
                    '$authorName',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
