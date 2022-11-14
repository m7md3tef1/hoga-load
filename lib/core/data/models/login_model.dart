class LoginModel {
  LoginModel({
    this.password,
      this.userName,

    });

  LoginModel.fromJson(dynamic json) {
    userName = json['username']??'';

  }
  String? userName;

  String?password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = userName;
    map['password']=password;
    return map;
  }

}