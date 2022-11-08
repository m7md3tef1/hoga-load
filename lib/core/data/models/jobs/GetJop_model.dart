



import 'package:hoga_load/core/data/models/jobs/jopTpe.dart';
import 'package:hoga_load/core/data/models/state.dart';

import '../master/City.dart';
import '../master/Country.dart';
import '../vehicle/user.dart';
import 'category.dart';

class GetJopModel {
  GetJopModel({
      this.id, 
      this.title, 
      this.description, 
      this.category, 
      this.jobType,
     this.country2,
     this.state2,
     this.city2,
      this.country,this.jopCategortId,
    this.jopTypeId,
      this.state, 
      this.city, 
      this.user, 
      this.salary, 
      this.noOfPosts, 
      this.shiftTime, 
      this.status,});

  GetJopModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
    jobType = json['job_type'] != null ? JobType.fromJson(json['job_type']) : null;
    country = json['country'] != null ? Country.fromJson(json['country']) : null;
    state = json['state'] != null ? State.fromJson(json['state']) : null;
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    user = (json['user'] != null ? User.fromJson(json['user']) : null)!;
    salary = json['salary'];
    noOfPosts = json['no_of_posts'];
    shiftTime = json['shift_time'];
    status = json['status'];
    country2 = json['country'];
    state2 = json['state'];
    city2 = json['city'];
  }
  int? id;
  String? title;
  String? description;
  Category? category;
  JobType? jobType;
  dynamic country2;
  dynamic state2;
  dynamic city2;
  int? jopTypeId;
  int? jopCategortId;
  Country? country;
  State? state;
  City? city;
  User? user;
  String? salary;
  int? noOfPosts;
  String? shiftTime;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;

    if (category != null) {
      map['category'] = category!.toJson();
    }
    if (jobType != null) {
      map['job_type'] = jobType!.toJson();
    }
    map['job_type'] = jopTypeId;
    map['category'] = jopCategortId;
    if (country != null) {
      map['country'] = country!.toJson();
    }
    if (state != null) {
      map['state'] = state!.toJson();
    }
    if (city != null) {
      map['city'] = city!.toJson();
    }
    if (user != null) {
      map['user'] = user!.toJson();
      map['country'] = country2;
      map['state'] = state2;
      map['city'] = city2;
    }
    map['salary'] = salary;
    map['no_of_posts'] = noOfPosts;
    map['shift_time'] = shiftTime;
    map['status'] = status;
    return map;
  }

}