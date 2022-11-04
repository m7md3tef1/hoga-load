import '../../../core/data/models/vehicle/user.dart';

abstract class UpdateProfileStates{
}
class UpdateLoading extends UpdateProfileStates{}
class UpdateProfileLoading extends UpdateProfileStates{}

class UpdateProfileSuccess extends UpdateProfileStates{}
class UpdateProfileFailed extends UpdateProfileStates{}

class GetProfileSuccess extends UpdateProfileStates{
  List<User>profileList=[];
  GetProfileSuccess(this.profileList);
}
class GetProfileFailed extends UpdateProfileStates{

  final String msg;
  GetProfileFailed(this.msg);
}
class FailedNetwork extends UpdateProfileStates{

  final String msg;
  FailedNetwork(this.msg);
}


