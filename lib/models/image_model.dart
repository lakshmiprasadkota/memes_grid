import 'dart:convert';

List<Getimages> getimagesFromMap(String str) => List<Getimages>.from(json.decode(str).map((x) => Getimages.fromMap(x)));

String getimagesToMap(List<Getimages> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Getimages {
  Getimages({
    this.id,
    this.url,
    this.v,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String url;
  int v;
  DateTime createdAt;
  DateTime updatedAt;

  factory Getimages.fromMap(Map<String, dynamic> json) => Getimages(
    id: json["_id"] == null ? null : json["_id"],
    url: json["url"] == null ? null : json["url"],
    v: json["__v"] == null ? null : json["__v"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toMap() => {
    "_id": id == null ? null : id,
    "url": url == null ? null : url,
    "__v": v == null ? null : v,
    "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
  };
}
