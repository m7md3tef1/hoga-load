import '../../../core/data/models/jobs/GetJop_model.dart';

abstract class AddJopStates {}

class AddJopLoading extends AddJopStates {}

class AddSuccessJop extends AddJopStates {}

class AddFailed extends AddJopStates {
  String? error;
  AddFailed(this.error);
}
class Loading extends AddJopStates{

}
class AddTestFailed extends AddJopStates{
  String? error;
  AddTestFailed(this.error);
}

class GetJopSuccess extends AddJopStates {
  List<GetJopModel> jopList = [];
  GetJopSuccess(this.jopList);
}

class GetJopFailed extends AddJopStates {
  final String msg;
  GetJopFailed(this.msg);
}

class GetSearchSuccess extends AddJopStates {
  List<GetJopModel> jopList = [];
  GetSearchSuccess(this.jopList);
}

class GetSearchFailed extends AddJopStates {
  final String msg;
  GetSearchFailed(this.msg);
}

class NetworkFailed extends AddJopStates {
  final String msg;
  NetworkFailed(this.msg);
}
