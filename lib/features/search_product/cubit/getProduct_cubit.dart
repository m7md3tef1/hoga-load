import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hoga_load/core/data/repository/vehicle_repo.dart';
import 'package:hoga_load/features/search_product/cubit/getProduct__states.dart';

import '../../../core/data/models/product/GetProduct_model.dart';




class ProductsCubit extends Cubit<AddProductStates> {
  ProductsCubit() : super(AddProductLoading());

  static ProductsCubit get(context) => BlocProvider.of(context);
  Connectivity connectivity = Connectivity();

  List<GetProductModel> searchList=[];
  List<GetProductModel> productList=[];

  getProduct(){
    connectivity.checkConnectivity().then((value)async{
      if(ConnectivityResult.none == value){
        emit(NetworkFailed("Check your internet connection and try again"));
      }else{
        VehicleRepo.getProducts('products').then((value) => {
          print('..................................'),
          print(value),
          productList=value,
          emit(GetProductsSuccess(value))
        }).onError((error, stackTrace) => {
          emit(GetProductsFailed(error.toString())),
          print(error)

        });
      }

    });
  }

  searchProducts(val,context) {
    searchList.clear();
    ProductsCubit.get(context).productList.forEach((i) {
      if(i.buyOrSell!.toLowerCase().contains(val)||i.buyOrSell!.contains(val)){
        searchList.add(i);
      }
      else if(i.productName!.toLowerCase().contains(val)||i.productName.toString().contains(val)){
        searchList.add(i);

      }else if(i.id!.toString().contains(val)) {
        searchList.add(i);
      }else if(i.price!.contains(val)||i.price!.toString().contains(val)){
        searchList.add(i);

      }else if(i.productType!.title!.contains(val)||i.productType!.title!.toLowerCase().contains(val)) {
        searchList.add(i);
      }

      else{
        null;

      }


      if(searchList!=null||searchList.length!=0){
        emit(GetSearchSuccess(searchList));

      }else{
        emit(GetSearchFailed('list is empty'));

      }
    });
  }
}
