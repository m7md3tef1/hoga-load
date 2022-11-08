import '../ProductType.dart';

class GetProductModel {
  GetProductModel({
      this.id, 
    required  this.buyOrSell,
    required  this.productName,
      this.productType,
    required  this.country,
    required  this.state,
    required  this.city,
      this.user,
    required  this.description,
      this.price,
      this.priceInt,

    required this.productTypeId,
    required  this.productImage,
      this.status,});

  GetProductModel.fromJson(dynamic json) {
    id = json['id'];
    buyOrSell = json['buy_or_sell'];
    productName = json['product_name'];
    productType = json['product_type'] != null ? ProductType.fromJson(json['product_type']) : null;
    country = json['country'];
    state = json['state'];
    city = json['city'];
    user = json['user'];
    description = json['description'];
    price = json['price'];
    productImage = json['product_image'];
    status = json['status'];
  }
  int? id;
  String? buyOrSell;
  String? productName;
  ProductType? productType;
  dynamic country;
  dynamic state;
  dynamic city;
  dynamic user;
  String? description;
  String? price;
  String? productImage;
  int? status;
  int? productTypeId;
  int? priceInt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['buy_or_sell'] = buyOrSell;
    map['product_name'] = productName;
    map['product_type'] = productTypeId;
    map['country'] = country;
    map['state'] = state;
    map['city'] = city;
    map['description'] = description;
    map['price'] = priceInt;
    map['product_image'] = productImage;
    return map;
  }

}