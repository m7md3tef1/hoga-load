class User {
  User({
    this.password,
    this.firstName,
    this.lastName,
    this.email,
    this.contactNumber,
    this.username,
    this.address,
    this.profilePicture,
    this.id,});

  User.fromJson(dynamic json) {
    firstName = json['first_name']??'';
    lastName = json['last_name']??'';
    email = json['email']??'';
    contactNumber = json['contact_number']??'';
    address = json['address']??'';
    profilePicture = json['profile_picture']??'';
    username = json['username']??'';
    id = json['id'];
  }
  String? firstName;
  String? lastName;
  String? email;
  String? contactNumber;
  dynamic address;
  dynamic profilePicture;
  int? id;
  String?password;
  String? username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['contact_number'] = contactNumber;
    map['address'] = address;
    map['profile_picture'] = profilePicture;
    map['id'] = id;
    map['password']=password;
    map['username']=username;
    return map;
  }

}