class ViewdBy {
  ViewdBy({
      this.firstName, 
      this.lastName, 
      this.email, 
      this.contactNumber, 
      this.username, 
      this.address,});

  ViewdBy.fromJson(dynamic json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    contactNumber = json['contact_number'];
    username = json['username'];
    address = json['address'];
  }
  String? firstName;
  String? lastName;
  String? email;
  String? contactNumber;
  String? username;
  String? address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['contact_number'] = contactNumber;
    map['username'] = username;
    map['address'] = address;
    return map;
  }

}