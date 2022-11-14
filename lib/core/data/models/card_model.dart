class CardModel {
  CardModel(
    this.cardNumber,
    this.month,
    this.year,
    this.cvv,
    this.country,
    this.state,
    this.city,
    this.name,
    this.email,
    this.contactNumber,
    this.address,
    this.postalCode,
  );

  CardModel.fromJson(dynamic json) {
    cardNumber = json['card_number'];
    month = json['exp_month'];
    year = json['exp_year'];
    cvv = json['cvv'];
    name = json['name'];
    email = json['email'];
    contactNumber = json['contact_number'];
    address = json['address_line_1'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    postalCode = json['postal_code'];
  }
  int? cardNumber, month, year, cvv, country, state, city;
  String? name, email, contactNumber, address, postalCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['card_number'] = cardNumber;
    map['exp_month'] = month;
    map['exp_year'] = year;
    map['cvv'] = cvv;
    map['name'] = name;
    map['email'] = email;
    map['contact_number'] = contactNumber;
    map['address_line_1'] = address;
    map['country'] = country;
    map['state'] = state;
    map['city'] = city;
    map['postal_code'] = postalCode;
    return map;
  }
}
