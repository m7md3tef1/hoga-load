class OriginState {
  OriginState({
      this.id, 
      this.title, 
      this.slug, 
      this.countryId, 
      this.createdAt, 
      this.updatedAt, 
      this.deletedAt,});

  OriginState.fromJson(dynamic json) {
    id = json['id']??0;
    title = json['title']??'other';
    slug = json['slug'];
    countryId = json['country_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }
  int? id;
  String? title;
  String? slug;
  int? countryId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['slug'] = slug;
    map['country_id'] = countryId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deleted_at'] = deletedAt;
    return map;
  }

}