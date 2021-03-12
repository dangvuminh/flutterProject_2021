import 'package:flutter/material.dart';

class Search extends StatelessWidget {
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
          Expanded(child: Container()),
          Column(
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
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
