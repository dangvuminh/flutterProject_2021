import 'package:flutter/material.dart';
import 'package:online_learning_app/models/userInfo.dart';
import 'package:online_learning_app/services/course_service.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool isEmpty = true;
  String keyword  =  '';
  Future<dynamic> _courseList;

  var txtField = TextEditingController();
  @override
  // void initState() {
  //   _courseList =  Course_Service().searchCourse('react');
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final UserProfile user = Provider.of<UserProfile>(context);
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
                      onChanged: (val) async {
                        setState(() {
                          keyword = val;
                          _courseList =  Course_Service().searchCourse(val);
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
                                // _courseList =  Course_Service().searchCourse(keyword);
                               });
                             },
                             child: Text('x',style: TextStyle(color: Colors.grey,fontSize: 30.0),),
                      )
                    )
                  ],
                )
            ),
          ),
          FutureBuilder(
             future: _courseList,
              builder: (context,snapshot) {
                if(snapshot.hasData && keyword != ''){
                  return Expanded(
                    child: Container(
                      height: 400.0,
                      child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context,index){
                            return InkWell(
                              onTap: (){
                                Navigator.pushNamed(
                                    context, '/courseDetail',
                                    arguments: {
                                    'courseID': snapshot.data[index].id,
                                    'userID': user.userInfo.id,
                                    'token': user.token,
                                    }
                                );
                              },
                              child: Container(
                                color: Colors.grey[200],
                                margin: EdgeInsets.all(15.0),
                                child: Column(
                                      children: [
                                        Image(image: NetworkImage(snapshot.data[index].imageUrl)),
                                        Text(snapshot.data[index].title),
                                        Text('${snapshot.data[index].price} vnd'),
                                        Text(snapshot.data[index].name)
                                      ],
                                    ),
                              ),
                            );

                          }
                      ),
                    ),
                  );
                }
                return Center(child: Text('No matching results'));
              }
          )
        ],
      ),
    );
  }
}
