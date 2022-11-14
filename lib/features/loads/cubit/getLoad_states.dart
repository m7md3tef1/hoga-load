import '../../../core/data/models/loads/GetLoads_model.dart';
import '../../../core/data/models/vehicle/vehicles.dart';

abstract class AddLoadStates {}

class AddLoadLoading extends AddLoadStates {}

class AddingLoad extends AddLoadStates {}

class AddSuccess extends AddLoadStates {}

class AddFailed extends AddLoadStates {}

class GetLoadsSuccess extends AddLoadStates {
  List<Vehicles> loadList = [];
  GetLoadsSuccess(this.loadList);
}

class GetLoadsFailed extends AddLoadStates {
  final String msg;
  GetLoadsFailed(this.msg);
}

class GetSearchSuccess extends AddLoadStates {
  List<Vehicles> loadList = [];
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

class AddTestFailed extends AddLoadStates {
  String? error;
  AddTestFailed(this.error);
}

class EditSuccess extends AddLoadStates {}

class EditFailed extends AddLoadStates {}

class DeleteSuccess extends AddLoadStates {}

class DeleteFailed extends AddLoadStates {}

class Loading extends AddLoadStates {}
