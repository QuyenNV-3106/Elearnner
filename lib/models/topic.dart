import 'dart:convert';

class Topic {
  int id;
  String title;
  String subTile;
  String imgUrl;
  String kind;

  Topic(
      {required this.id,
      required this.title,
      required this.subTile,
      required this.kind,
      required this.imgUrl});

  Topic.WithId(this.id, this.title, this.subTile, this.imgUrl, this.kind);

  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
        id: json["id"],
        title: json["title"],
        subTile: json["subTitle"],
        kind: json["kind"],
        imgUrl: json["imgUrl"]);
  }

  static Topic fromObject(dynamic json) {
    return Topic(
        id: json['id'],
        title: json['title'],
        subTile: json['subTile'],
        kind: json['kind'],
        imgUrl: json['imgUrl']);
  }
}
