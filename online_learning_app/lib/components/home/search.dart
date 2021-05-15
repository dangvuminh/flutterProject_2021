import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool isEmpty = true;
  String keyword  =  '';
  var txtField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Form(
            child: Container(
                padding: EdgeInsets.all(20.0),
                child: Stack(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder()
                      ),
                      controller: txtField,
                      onChanged: (val){
                        setState(() {
                          keyword = val;
                        });
                      },
                    ),
                    Positioned(
                      top: 10.0,
                      left: 350.0,
                      child: keyword == ''
                          ?  Icon(Icons.search,size: 40.0,)
                          : InkWell(
                             onTap: (){
                               setState(() {
                                 keyword = '';
                                 txtField.text = '';
                               });
                             },
                             child: Text('x',style: TextStyle(color: Colors.grey,fontSize: 30.0),),
                      )
                    )
                  ],
                )
            ),
          ),
        ],
      ),
    );
  }
}
