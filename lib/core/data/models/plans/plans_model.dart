class PlansModel {
  PlansModel({
      this.id, 
      this.stripeId, 
      this.title, 
      this.slug, 
      this.image, 
      this.description, 
      this.totalNumberOfLoads, 
      this.totalNumberOfVehicles, 
      this.totalNumberOfProducts, 
      this.totalNumberOfJobs, 
      this.basePrice, 
      this.price, 
      this.stripePriceId, 
      this.isBestSelling, 
    });

  PlansModel.fromJson(dynamic json) {
    id = json['id'];
    stripeId = json['stripe_id'];
    title = json['title'];
    slug = json['slug'];
    image = json['image'];
    description = json['description'];
    totalNumberOfLoads = json['total_number_of_loads'];
    totalNumberOfVehicles = json['total_number_of_vehicles'];
    totalNumberOfProducts = json['total_number_of_products'];
    totalNumberOfJobs = json['total_number_of_jobs'];
    basePrice = json['base_price'];
    price = json['price'];
    stripePriceId = json['stripe_price_id'];
    isBestSelling = json['is_best_selling'];

  }
  int? id;
  String? stripeId;
  String? title;
  String? slug;
  String? image;
  dynamic description;
  int? totalNumberOfLoads;
  int? totalNumberOfVehicles;
  int? totalNumberOfProducts;
  int? totalNumberOfJobs;
  String? basePrice;
  String? price;
  String? stripePriceId;
  int? isBestSelling;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['stripe_id'] = stripeId;
    map['title'] = title;
    map['slug'] = slug;
    map['image'] = image;
    map['description'] = description;
    map['total_number_of_loads'] = totalNumberOfLoads;
    map['total_number_of_vehicles'] = totalNumberOfVehicles;
    map['total_number_of_products'] = totalNumberOfProducts;
    map['total_number_of_jobs'] = totalNumberOfJobs;
    map['base_price'] = basePrice;
    map['price'] = price;
    map['stripe_price_id'] = stripePriceId;
    map['is_best_selling'] = isBestSelling;

    return map;
  }

}