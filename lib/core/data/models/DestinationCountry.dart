class DestinationCountry {
  DestinationCountry({
      this.id, 
      this.title, 
      this.slug, 
      this.createdAt, 
      this.updatedAt, 
      this.deletedAt,});

  DestinationCountry.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }
  int? id;
  String? title;
  String? slug;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['slug'] = slug;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deleted_at'] = deletedAt;
    return map;
  }

}