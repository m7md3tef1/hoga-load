class User {
  User({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.username, 
      this.email, 
      this.contactNumber, 
      this.address, 
      this.profilePicture,});

  User.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    email = json['email'];
    contactNumber = json['contact_number'];
    address = json['address'];
    profilePicture = json['profile_picture'];
  }
  int? id;
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? contactNumber;
  dynamic address;
  String? profilePicture;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['username'] = username;
    map['email'] = email;
    map['contact_number'] = contactNumber;
    map['address'] = address;
    map['profile_picture'] = profilePicture;
    return map;
  }

}