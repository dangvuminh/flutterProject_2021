// To parse this JSON data, do
//
//     final searchHistory = searchHistoryFromJson(jsonString);

import 'dart:convert';

SearchHistory searchHistoryFromJson(String str) => SearchHistory.fromJson(json.decode(str));

String searchHistoryToJson(SearchHistory data) => json.encode(data.toJson());

class SearchHistory {
  SearchHistory({
    this.id,
    this.content,
  });

  String id;
  String content;

  factory SearchHistory.fromJson(Map<String, dynamic> json) => SearchHistory(
    id: json["id"],
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "content": content,
  };
}
