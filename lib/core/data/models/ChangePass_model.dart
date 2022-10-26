class ChangePassModel {
  ChangePassModel({
    this.confirmPass,
    this.currentPass,
    this.newPass,
   });

  ChangePassModel.fromJson(dynamic json) {
    currentPass = json['current_password']??'';
    newPass = json['new_password']??'';
    confirmPass = json['confirmed_password']??'';

  }
  var currentPass;
  var newPass;
  var confirmPass;



  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_password'] = currentPass;
    map['new_password'] = newPass;
    map['confirmed_password'] = confirmPass;

    return map;
  }

}