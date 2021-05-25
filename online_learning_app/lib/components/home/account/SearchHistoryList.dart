import 'package:flutter/material.dart';
import 'package:online_learning_app/services/course_service.dart';

class SearchHistoryList extends StatefulWidget {
  final dynamic userInfo;
  SearchHistoryList({@required this.userInfo});
  @override
  _SearchHistoryListState createState() => _SearchHistoryListState();
}

class _SearchHistoryListState extends State<SearchHistoryList> {
  Future<dynamic> _list;
  @override
  void initState() {
    _list = Course_Service().getSearchHistory(widget.userInfo['token']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _list,
        builder: (context,snapshot){
          if(snapshot.hasData){
            return Scaffold(
              appBar: AppBar(
                title: Text('History'),
              ),
              body: ListView.builder(
                itemCount: snapshot.data.length,
                  itemBuilder: (context,index){
                    return Card(
                      child: Container(
                        child: Text(snapshot.data[index].content),
                      ),
                    );
                  }
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text('History'),
              ),
              body: Center(child: CircularProgressIndicator(),),
            );
          }
        }
    );
  }
}
