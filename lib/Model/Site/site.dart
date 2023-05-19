import 'dart:convert';

List<Site> siteFromJson(String str) =>
    List<Site>.from(json.decode(str).map((x) => Site.fromJson(x)));

class Site {
  Site({
    required this.id,
    required this.name
  });

  int id;
  String name;

  factory Site.fromJson(Map<String, dynamic> json) => Site(
      id: json['id'],
      name: json['name']
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}