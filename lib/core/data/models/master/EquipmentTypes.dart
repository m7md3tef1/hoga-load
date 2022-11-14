class EquipmentTypes {
  EquipmentTypes({
      this.id, 
      this.title,});

  EquipmentTypes.fromJson(dynamic json) {
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