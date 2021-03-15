import 'package:flutter/material.dart';
import 'package:mobile_flutter/objects/courseObject.dart';
import 'package:mobile_flutter/search_result.dart';

class Search extends StatefulWidget {

  final List<CourseObject> courseData;
  Search({this.courseData});


  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
   String typedText ='';
  // Search s = new Search();

  Widget filteredTab (List<CourseObject> list) {

    if (list.any((element) =>
        element.productName.toLowerCase().contains(typedText.toLowerCase())))
    {
      return SearchResult(
        courses: list.where((element) =>
          element.productName.toLowerCase().contains(typedText.toLowerCase()))
    .toList()
      );
    }
    return Container(
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                        'Over 7000 courses at your fingertips',
                        style:TextStyle(
                          color:Colors.grey[500],
                          fontSize: 20.0,
                        )),
                  ),
                  Text(
                      'Search by title, author, or subject',
                      style:TextStyle(
                        color:Colors.grey[500],
                        fontSize: 17.0,
                      )),
                ],
              ),
            );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Container(
            height: 130.0,
            color:Colors.grey[850],
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                        Icons.arrow_left_sharp,
                        color: Colors.white,
                    ),
                    Text(
                        'Search',
                        style:TextStyle(
                          color:Colors.white,
                        )
                      ),
                  ],
                ),
                Expanded(child: Container()),
                Container(
                  margin: EdgeInsets.only(bottom: 15.0),
                  height: 40.0,
                  width: 400.0,
                  child: Stack(
                     children: [
                       TextField(
                         obscureText: true,
                         decoration: InputDecoration(
                           border: OutlineInputBorder(),
                           fillColor: Colors.grey[600],
                           filled: true,
                         ),
                         onChanged: (text) {
                          setState(() {
                             typedText = text;
                          });
                         },
                       ),
                       Container(
                         height:70.0,
                         padding: EdgeInsets.only(left: 10.0),
                         child: Row(
                           children: [
                             Icon(Icons.search,color: Colors.white,),
                             SizedBox(width: 5.0,),
                             Text('Search',
                                 style:TextStyle(
                                   color:Colors.white,
                                 )),
                           ],
                         ),
                       )
                     ],
                  ),
                )
              ],
            ),
          ),

          //
          filteredTab(widget.courseData),

        ],
      ),
    );
  }
}
