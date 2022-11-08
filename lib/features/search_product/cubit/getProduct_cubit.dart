import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hoga_load/core/data/repository/product_repo.dart';
import 'package:hoga_load/core/data/repository/vehicle_repo.dart';
import 'package:hoga_load/features/search_product/cubit/getProduct__states.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/data/models/product/GetProduct_model.dart';
import '../../../core/dialoges/toast.dart';




class ProductsCubit extends Cubit<AddProductStates> {
  ProductsCubit() : super(AddProductLoading());
 TextEditingController priceController=TextEditingController();
  TextEditingController nameController=TextEditingController();
  TextEditingController descController=TextEditingController();
  var image;
  static ProductsCubit get(context) => BlocProvider.of(context);
  Connectivity connectivity = Connectivity();

  List<GetProductModel> searchList=[];
  List<GetProductModel> productList=[];
  List<GetProductModel> myProductList=[];

  String? img64;

  bool isAccessToken=true;
  bool  testLoading=true;
  bool  myVehiclesLoading=true;
  getProduct({self}){
    connectivity.checkConnectivity().then((value)async{
      if(ConnectivityResult.none == value){
        emit(NetworkFailed("Check your internet connection and try again"));
      }else{
        ProductRepo.getProducts('products',self).then((value) => {
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

  searchProducts(context,{val}) {
    searchList.clear();
    print("cubit");



   // connectivity.checkConnectivity().then((value)async{
//      if(ConnectivityResult.none == value){
//        emit(NetworkFailed("Check your internet connection and try again"));
//      }else{
//        ProductRepo.searchVehicles(search: val,equipmentSize: equipmentSize2,vehicleSize: vehicleSize2,
//            attributes: attributes2,vehicleType: vehicleType2,context: context).then((value) => {
//          print('..................................'),
//          print(value),
//          print("value2"),
//
//          if(value.isNotEmpty){
//            print("value"),
//            print('..................................'),
//            print(value),
//            searchList=value,
//            emit(GetSearchSuccess(searchList)),
//            vehicleClearData(context),
//
//
//          }else{
//            emit(GetSearchFailed('Nothing found try again')),
//            vehicleClearData(context),
//
//          }
//
//        }).onError((error, stackTrace) => {
//          emit(GetSearchFailed(error.toString())),
//          vehicleClearData(context),
//          print(error)
//
//        });
//      }

   // });
  }

  addProductCubit({context,GetProductModel? productModel}){
     emit(AddProductLoading());
     testLoading=true;

     connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
        showToast(msg: "Check your internet connection and try again", state: ToastedStates.ERROR);

      } else {
        ProductRepo.addProduct(context: context,productModel: productModel)
            .then((value) => {
          print('Add Product Success'),
          print(value),
          emit(AddSuccess()),
          priceController.text='',
          descController.text='',
          nameController.text='',
          img64='',

          showToast(msg: 'Add Success', state: ToastedStates.SUCCESS),

        }).catchError((error)  {
          emit(AddFailed());
        if(error.toString().contains('Unauthorized Access') ||
        error.toString().contains('no credit left')){
            testLoading=false;
            isAccessToken=false;

      }
      testLoading=false;
          print('Add Product Failed');
          print(error);
          showToast(msg: error.toString(), state: ToastedStates.ERROR);

        });
      }
    });
  }

  pickFromGallery(BuildContext context) async {
    var img = await ImagePicker().pickImage(source: ImageSource.gallery);
    image = File(
      img!.path,
    );
    print(image);
    final bytes = image.readAsBytesSync();
     img64 = "data:image/png;base64,"+base64Encode(bytes);
    emit(ImageGallery());
    print('img64'+img64!);


  }

  deleteProductCubit(productId){
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        ProductRepo.delete(productId)
            .then((value) => {
          print('Delete Vehicle Success'),
          print(value),

          emit(DeleteSuccess()),
          showToast(msg: 'Delete Success', state: ToastedStates.SUCCESS),

        })
            .onError((error, stackTrace) =>
        {emit(DeleteFailed()),
          print(error),
          showToast(msg: error.toString(), state: ToastedStates.ERROR),
          print('Delete Vehicle Failed'),
        });
      }
    });
  }

  addProductCubitTest({context}){
    testLoading=true;
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
        showToast(msg: 'Check your internet connection and try again', state: ToastedStates.ERROR);
      } else {
        ProductRepo.addProductTest(context: context)
            .then((value) => {
          testLoading=false,

        }).catchError((error)  {

          if(error.toString().contains('Unauthorized Access') ||
              error.toString().contains('no credit left')){
            testLoading=false;
            isAccessToken=false;
            emit(AddTestFailed(error.toString()));
            print('oooooooooooooooooo');

          }
          testLoading=false;
          emit(AddTestFailed(error.toString()));

          print('Add Vehicle Test Failed');

          print(error);

          //showToast(msg: error.toString(), state: ToastedStates.ERROR);


        });
      }
    });
  }


}
