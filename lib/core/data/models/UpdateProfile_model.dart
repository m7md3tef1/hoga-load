class UpdateProfile {
  UpdateProfile({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.address,
    this.phone,
  });

  UpdateProfile.fromJson(dynamic json) {
    firstName = json['first_name'] ?? '';
    lastName = json['last_name'] ?? '';
    email = json['email'] ?? '';
    username = json['username'] ?? '';
    address = json['address'] ?? '';
    phone = json['contact_number'] ?? '';
  }
  String? firstName;
  String? lastName;
  String? email;
  String? username;
  String? address;
  var phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['username'] = username;
    map['address'] = address;
    map['contact_number'] = phone;
    return map;
  }
}
