import '../../../core/data/models/product/GetProduct_model.dart';

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
class AddTestFailed extends AddProductStates {
  final String msg;
  AddTestFailed(this.msg);
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
class ImageGallery extends AddProductStates {
  ImageGallery();
}
class DeleteSuccess extends AddProductStates {
}class DeleteFailed extends AddProductStates {
}
class EditSuccess extends AddProductStates {
}class EditFailed extends AddProductStates {
}
