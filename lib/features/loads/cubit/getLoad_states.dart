import '../../../core/data/models/loads/GetLoads_model.dart';

abstract class AddLoadStates {}

class AddLoadLoading extends AddLoadStates {}

class AddSuccess extends AddLoadStates {}

class AddFailed extends AddLoadStates {}


class GetLoadsSuccess extends AddLoadStates {
  List<GetLoadsModel> loadList = [];
  GetLoadsSuccess(this.loadList);
}

class GetLoadsFailed extends AddLoadStates {
  final String msg;
  GetLoadsFailed(this.msg);
}

class GetSearchSuccess extends AddLoadStates {
  List<GetLoadsModel> loadList = [];
  GetSearchSuccess(this.loadList);
}

class GetSearchFailed extends AddLoadStates {
  final String msg;
  GetSearchFailed(this.msg);
}

class NetworkFailed extends AddLoadStates {
  final String msg;
  NetworkFailed(this.msg);
}
