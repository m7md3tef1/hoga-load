import 'vehicle/user.dart';

class ResponseModel {
  ResponseModel({
    this.status,
    this.message,
    this.record,
  });

  ResponseModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['message'] != null) {
      message = [];
      json['message'].forEach((v) {
        message!.add(v);
      });
    }
    //record = json['record'] != null ? User.fromJson(json['record']) : null;
  }
  String? status;
  List<dynamic>? message;
  User? record;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (message != null) {
      map['message'] = message!.map((v) => v.toJson()).toList();
    }
    if (record != null) {
      map['record'] = record!.toJson();
    }
    return map;
  }
}
