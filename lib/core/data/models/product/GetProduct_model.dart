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
      this.user, 
      this.description, 
      this.price, 
      this.productImage, 
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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['buy_or_sell'] = buyOrSell;
    map['product_name'] = productName;
    if (productType != null) {
      map['product_type'] = productType!.toJson();
    }
    map['country'] = country;
    map['state'] = state;
    map['city'] = city;
    map['user'] = user;
    map['description'] = description;
    map['price'] = price;
    map['product_image'] = productImage;
    map['status'] = status;
    return map;
  }

}