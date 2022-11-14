import '../../../core/data/models/vehicle/user.dart';

abstract class UpdateProfileStates {}

class UpdateLoading extends UpdateProfileStates {}

class UpdateProfileLoading extends UpdateProfileStates {}

class GetUserProfileLoading extends UpdateProfileStates {}

class UpdateProfileSuccess extends UpdateProfileStates {
  User profileList = User();
  UpdateProfileSuccess(this.profileList);
}

class UpdateProfileFailed extends UpdateProfileStates {}

class GetUserProfileSuccess extends UpdateProfileStates {
  User profileList = User();
  GetUserProfileSuccess(this.profileList);
}

class GetProfileSuccess extends UpdateProfileStates {
  List<User> profileList = [];
  GetProfileSuccess(this.profileList);
}

class GetProfileFailed extends UpdateProfileStates {
  final String msg;
  GetProfileFailed(this.msg);
}

class GetUserProfileFailed extends UpdateProfileStates {
  final String msg;
  GetUserProfileFailed(this.msg);
}

class FailedNetwork extends UpdateProfileStates {
  final String msg;
  FailedNetwork(this.msg);
}
