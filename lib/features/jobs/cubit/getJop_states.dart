import '../../../core/data/models/jobs/GetJop_model.dart';
import '../../../core/data/models/jobs/get_jop.dart';

abstract class AddJopStates {}

class AddJopLoading extends AddJopStates {}

class AddSuccessJop extends AddJopStates {}

class AddFailed extends AddJopStates {
  String? error;
  AddFailed(this.error);
}

class Loading extends AddJopStates {}

class AddTestFailed extends AddJopStates {
  String? error;
  AddTestFailed(this.error);
}

class JobsLoading extends AddJopStates {}

class GetJopSuccess extends AddJopStates {
  List<GetJop> jopList = [];
  GetJopSuccess(this.jopList);
}

class GetJopFailed extends AddJopStates {
  final String msg;
  GetJopFailed(this.msg);
}

class GetSearchSuccess extends AddJopStates {
  List<GetJop> jopList = [];
  GetSearchSuccess(this.jopList);
}

class GetSearchSuccess2 extends AddJopStates {
  List<GetJopModel> jopList = [];
  GetSearchSuccess2(this.jopList);
}

class GetSearchFailed extends AddJopStates {
  final String msg;
  GetSearchFailed(this.msg);
}

class DeleteSuccess extends AddJopStates {}

class DeleteFailed extends AddJopStates {}

class EditSuccess extends AddJopStates {}

class EditFailed extends AddJopStates {}

class NetworkFailed extends AddJopStates {
  final String msg;
  NetworkFailed(this.msg);
}
