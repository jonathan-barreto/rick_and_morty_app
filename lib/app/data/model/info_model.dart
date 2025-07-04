import 'dart:convert';

class InfoModel {
  final int? count;
  final int? pages;
  final String? next;
  final String? prev;

  InfoModel({this.count, this.pages, this.next, this.prev});

  factory InfoModel.fromMap(Map<String, dynamic> map) {
    return InfoModel(
      count: map['count'],
      pages: map['pages'],
      next: map['next'],
      prev: map['prev'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'count': count, 'pages': pages, 'next': next, 'prev': prev};
  }

  String toJson() => json.encode(toMap());
}
