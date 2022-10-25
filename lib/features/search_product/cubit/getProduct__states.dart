import 'package:hoga_load/core/data/models/GetLoads_model.dart';
import 'package:hoga_load/core/data/models/GetProduct_model.dart';

import '../../../core/data/models/Addvehicle_model.dart';
import '../../../core/data/models/vehicles.dart';

abstract class AddProductStates {}

class AddProductLoading extends AddProductStates {}

class AddSuccess extends AddProductStates {}

class AddFailed extends AddProductStates {}



class GetProductsSuccess extends AddProductStates {
  List<GetProductModel> productList = [];
  GetProductsSuccess(this.productList);
}

class GetProductsFailed extends AddProductStates {
  final String msg;
  GetProductsFailed(this.msg);
}

class GetSearchSuccess extends AddProductStates {
  List<GetProductModel> productList = [];
  GetSearchSuccess(this.productList);
}

class GetSearchFailed extends AddProductStates {
  final String msg;
  GetSearchFailed(this.msg);
}

class NetworkFailed extends AddProductStates {
  final String msg;
  NetworkFailed(this.msg);
}
