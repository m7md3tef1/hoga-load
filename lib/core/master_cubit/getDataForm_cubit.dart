import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hoga_load/core/data/models/jobs/GetJop_model.dart';
import 'package:hoga_load/core/data/repository/master_repo.dart';
import '../data/models/vehicle/Addvehicle_model.dart';
import 'getDataForm_state.dart';

class DataFormCubit extends Cubit<AddDataFormStates> {
  DataFormCubit() : super(DataFormStatesLoading());

  static DataFormCubit get(context) => BlocProvider.of(context);
  Connectivity connectivity = Connectivity();
  List<AddVehicle> countryList = [];
  List<AddVehicle> stateList = [];
  List<AddVehicle> cityList = [];
  List<AddVehicle> productList = [];
  List<AddVehicle> jopTypeList=[];
  List<AddVehicle> jopCategoryList=[];

  String countryOriginID='' ;
  String stateOriginID='' ;
  String cityOriginID='' ;
  String countryDestinationID='' ;
  String stateDestinationID='' ;
  String cityDestinationID='' ;
  String dateTime ='';

  String countryJop='' ;
  String stateJop='' ;
  String cityJop='' ;
  String jopCategory ='';
  String jopType ='';
  String salary ='';
  String noOfPost ='';
  String shiftTIme ='';
  String jopTitle ='';


  getCountry() {
    emit(GetCountryLoading());
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        MasterRepo.getCountry('masters/countries')
            .then((value) => {
          print('..................................'),
          print(value),
          countryList = value,
          emit(GetCountrySuccess(value))
        })
            .onError((error, stackTrace) =>
        {emit(GetCityFailed(error.toString())), print(error)});
      }
    });
  }

  getCity(state) {
    emit(GetCityLoading());
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        MasterRepo.getCity("masters/cities",state)
            .then((value) => {
          print('..................................'),
          print(value),
          cityList = value,
          emit(GetCitySuccess(value))
        })
            .onError((error, stackTrace) =>
        {emit(GetCityFailed(error.toString())), print(error)});
      }
    });
  }

  getJopCategory() {
    emit(GetJopCategoryLoading());
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        MasterRepo.getJop('masters/job-categories')
            .then((value) => {
          print('................success..................'),
          print(value),
          jopCategoryList = value,
          emit(GetJopCategorySuccess(value))
        })
            .onError((error, stackTrace) =>
        {emit(GetJopCategoryFailed(error.toString())), print(error)});
      }
    });
  }

  getJopType() {
    emit(GetJopTypeLoading());
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        MasterRepo.getJop('masters/job-types',)
            .then((value) => {
          print('................success..................'),
          print(value),
          jopTypeList = value,
          emit(GetJopTypeSuccess(value))
        })
            .onError((error, stackTrace) =>
        {emit(GetJopTypeFailed(error.toString())), print(error)});
      }
    });
  }


  getDestintionCity(state) {
    emit(GetDestintionCityLoading());
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        MasterRepo.getCity('masters/cities',state)
            .then((value) => {
          print('..................................'),
          print(value),
          cityList = value,
          emit(GetDestintionCitySuccess(value))
        })
            .onError((error, stackTrace) =>
        {emit(GetDestintionCityFailed(error.toString())), print(error)});
      }
    });
  }

  getState(country) {
    print("getstate");
    print(country);
    emit(GetStateLoading());
     //loadOriginState=false;
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        MasterRepo.getState('masters/states',country)
            .then((value) => {
          print('..................................'),
          print(value),
          stateList = value,
          emit(GetStateSuccess(value))
        })
            .onError((error, stackTrace) =>
        {emit(GetStateFailed(error.toString())), print(error)});
      }
    });
  }
  getDestintionState(country) {
    print("getstate");
    print(country);
    emit(GetDestintionStateLoading());
    //loadOriginState=false;
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        MasterRepo.getState('masters/states',country)
            .then((value) => {
          print('..................................'),
          print(value),
          stateList = value,
          emit(GetDestintionStateSuccess(value))
        })
            .onError((error, stackTrace) =>
        {emit(GetDestintionStateFailed(error.toString())), print(error)});
      }
    });
  }


  getProduct() {
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        MasterRepo.getData('masters/product-types')
            .then((value) => {
          print('..................................'),
          print(value),
          productList = value,
          emit(GetProductTypeSuccess(value))
        })
            .onError((error, stackTrace) =>
        {emit(GetProductTypeFailed(error.toString())), print(error)});
      }
    });
  }

}