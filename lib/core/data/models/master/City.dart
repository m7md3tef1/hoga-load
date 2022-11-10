class City {
  City({
    this.id,
    this.title,});

  City.fromJson(dynamic json) {
    id = json['id']??0;
    title = json['title']??'other';
  }
  int? id;
  String? title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    return map;
  }

}