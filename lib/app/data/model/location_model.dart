import 'dart:convert';

class LocationModel {
  final String? name;
  final String? url;

  LocationModel({this.name, this.url});

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(name: map['name'], url: map['url']);
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'url': url};
  }

  String toJson() => json.encode(toMap());
}
