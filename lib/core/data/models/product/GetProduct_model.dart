import 'package:hoga_load/core/data/models/master/OriginCity.dart';
import 'package:hoga_load/core/data/models/master/OriginCountry.dart';
import 'package:hoga_load/core/data/models/master/OriginState.dart';
import 'package:hoga_load/core/data/models/vehicle/Addvehicle_model.dart';
import 'package:hoga_load/core/data/models/vehicle/user.dart';

import '../ProductType.dart';

class GetProductModel {
  GetProductModel({
      this.id,
      this.buyOrSell,
      this.productName,
      this.productType,
      this.country,
      this.state,
      this.city,
      this.countryPost,
      this.statePost,
      this.cityPost,
      this.user,
      this.description,
      this.price,
      this.priceInt,
      this.search,
     this.productTypeId,
      this.productImage,
      this.status,});


  GetProductModel.fromJson(dynamic json) {
    id = json['id'];
    buyOrSell = json['buy_or_sell'];
    productName = json['product_name'];
    productType = json['product_type'] != null ? ProductType.fromJson(json['product_type']) : null;
    country = json['country']!= null ? ProductType.fromJson(json['country']) : null;
    state = json['state']!= null ? AddVehicle.fromJson(json['state']) : null;
    city = json['city']!= null ? AddVehicle.fromJson(json['city']) : null;
    user = json['user']!= null ? User.fromJson(json['user']) : null;

    description = json['description'];
    price = json['price'];
    productImage = json['product_image'];
    status = json['status'];
  }
  int? id;
  String? buyOrSell;
  String? productName;
  ProductType? productType;
  ProductType? country;
  AddVehicle? state;
  AddVehicle? city;
  int? countryPost;
  int? statePost;
  int? cityPost;
  User? user;
  String? description;
  String? price;
  String? productImage;
  int? status;
  int? productTypeId;
  int? priceInt;
  String? search;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['buy_or_sell'] = buyOrSell;
    map['product_name'] = productName;
    map['product_type'] = productTypeId;
    map['country'] = countryPost;
    map['state'] = statePost;
    map['city'] = cityPost;
    map['description'] = description;
    map['price'] = priceInt;
    map['product_image'] = productImage;
    map['search'] = search;
    map['id'] = id;


    return map;
  }
}
