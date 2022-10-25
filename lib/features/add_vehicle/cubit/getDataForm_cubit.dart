import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hoga_load/core/data/repository/add_vehicle_repo.dart';

import '../../../core/data/models/Addvehicle_model.dart';
import 'getVehicle_states.dart';

class DataFormCubit extends Cubit<AddVehicleStates> {
  DataFormCubit() : super(AddVehicleLoading());

  static DataFormCubit get(context) => BlocProvider.of(context);
  Connectivity connectivity = Connectivity();
  List<AddVehicle> countryList = [];
  List<AddVehicle> stateList = [];
  List<AddVehicle> cityList = [];
  List<AddVehicle> productList = [];

  getCountry() {
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        VehicleRepo.getData('masters/countries')
            .then((value) => {
          print('..................................'),
          print(value),
          countryList = value,
          emit(GetEquipmentSuccess(value))
        })
            .onError((error, stackTrace) =>
        {emit(GetEquipmentFailed(error.toString())), print(error)});
      }
    });
  }

  getCity() {
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        VehicleRepo.getData('masters/cities')
            .then((value) => {
          print('..................................'),
          print(value),
          cityList = value,
          emit(GetAttributesSuccess(value))
        })
            .onError((error, stackTrace) =>
        {emit(GetAttributesFailed(error.toString())), print(error)});
      }
    });
  }

  getState() {
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        VehicleRepo.getData('masters/states')
            .then((value) => {
          print('..................................'),
          print(value),
          stateList = value,
          emit(GetVehicleSizeSuccess(value))
        })
            .onError((error, stackTrace) =>
        {emit(GetVehicleSizeFailed(error.toString())), print(error)});
      }
    });
  }

  getProduct() {
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        VehicleRepo.getData('masters/product-types')
            .then((value) => {
          print('..................................'),
          print(value),
          productList = value,
          emit(GetVehicleSizeSuccess(value))
        })
            .onError((error, stackTrace) =>
        {emit(GetVehicleSizeFailed(error.toString())), print(error)});
      }
    });
  }

}