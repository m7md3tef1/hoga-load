import 'package:hoga_load/core/data/models/GetJop_model.dart';
import 'package:hoga_load/core/data/models/GetLoads_model.dart';

import '../../../core/data/models/Addvehicle_model.dart';
import '../../../core/data/models/vehicles.dart';

abstract class AddJopStates {}

class AddJopLoading extends AddJopStates {}

class AddSuccess extends AddJopStates {}

class AddFailed extends AddJopStates {}


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
