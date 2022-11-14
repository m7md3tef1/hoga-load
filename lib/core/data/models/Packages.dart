class Packages {
  Packages({
      this.id, 
      this.title, 
      this.slug, 
      this.duration, 
      this.isCustom, 
      this.pricePerDay, 
      this.description, 
      this.status, 
      this.createdAt, 
      this.updatedAt,});

  Packages.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    duration = json['duration'];
    isCustom = json['is_custom'];
    pricePerDay = json['price_per_day'];
    description = json['description'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? title;
  String? slug;
  int? duration;
  int? isCustom;
  String? pricePerDay;
  String? description;
  int? status;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['slug'] = slug;
    map['duration'] = duration;
    map['is_custom'] = isCustom;
    map['price_per_day'] = pricePerDay;
    map['description'] = description;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}