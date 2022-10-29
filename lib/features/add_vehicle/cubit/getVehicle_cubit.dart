import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hoga_load/core/data/models/GetVehicle_model.dart';
import 'package:hoga_load/core/data/repository/add_vehicle_repo.dart';

import '../../../core/data/api/api.dart';
import '../../../core/data/local/cacheHelper.dart';
import '../../../core/data/models/Addvehicle_model.dart';
import '../../../core/data/models/vehicles.dart';
import '../../../core/keys/keys.dart';
import 'getVehicle_states.dart';

class VehiclesCubit extends Cubit<AddVehicleStates> {
  VehiclesCubit() : super(AddVehicleLoading());

  static VehiclesCubit get(context) => BlocProvider.of(context);
  Connectivity connectivity = Connectivity();
  List<AddVehicle> attributesList = [];
  List<AddVehicle> equipmentList = [];
  List<AddVehicle> vehicleSizeList = [];
  List<AddVehicle> vehiclesTypeList = [];
  List<Vehicles> searchList = [];
  List<Vehicles> vehicleList = [];

  addVehicle(vehicleModel) async {
     String token =await CacheHelper.getString(SharedKeys.token);
    var response = Api().postHttp(
      url: 'vehicles/add', data: vehicleModel.toJson(), authToken: token
    );

    print(response);
    print('kkkkkkkkkkkkkkkkkkkkkkkkmmmmmm');
print(token);
    response
        .then((value) => {print(value), emit(AddSuccess())})
        .onError((error, stackTrace) => {
          print('this error sdafsfsdfsdfdsfsdfsdfsdfs ------------------'),
      print(error.toString()),
              emit(AddFailed()),
      print('this error ------------------'),


            });
  }

  getAttributesCubit() {
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        VehicleRepo.getData('masters/attributes')
            .then((value) => {
                  print('..................................'),
                  print(value),
                  attributesList = value,
                  emit(GetAttributesSuccess(value))
                })
            .onError((error, stackTrace) =>
                {emit(GetAttributesFailed(error.toString())), print(error)});
      }
    });
  }

  getEquipmentsCubit() {
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        VehicleRepo.getData('masters/equipment-types')
            .then((value) => {
                  print('..................................'),
                  print(value),
                  equipmentList = value,
                  emit(GetEquipmentSuccess(value))
                })
            .onError((error, stackTrace) =>
                {emit(GetEquipmentFailed(error.toString())), print(error)});
      }
    });
  }

  getVehicleSizesCubit() {
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        VehicleRepo.getData('masters/vehicle-sizes')
            .then((value) => {
                  print('..................................'),
                  print(value),
                  vehicleSizeList = value,
                  emit(GetVehicleSizeSuccess(value))
                })
            .onError((error, stackTrace) =>
                {emit(GetVehicleSizeFailed(error.toString())), print(error)});
      }
    });
  }

  getVehicleTypesCubit() {
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        VehicleRepo.getData('masters/vehicle-types')
            .then((value) => {
                  print('..................................'),
                  print(value),
                  vehiclesTypeList = value,
                  emit(GetVehiclesTypeSuccess(value))
                })
            .onError((error, stackTrace) =>
                {emit(GetVehiclesTypeFailed(error.toString())), print(error)});
      }
    });
  }

  getVehicleCubit() {
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        VehicleRepo.getVehicles()
            .then((value) => {
                  print('..................................'),
                  print(value),
                  vehicleList = value,
                  emit(GetVehicleSuccess(value))
                })
            .onError((error, stackTrace) =>
                {emit(GetVehicleFailed(error.toString())), print(error)});
      }
    });
  }

  searchVehicles(val, context) {
    searchList.clear();
    VehiclesCubit.get(context).vehicleList.forEach((i) {
      if (i.weight!.toLowerCase().contains(val) || i.weight!.contains(val)) {
        searchList.add(i);
      } else if (i.availabilityDate!.toLowerCase().contains(val) ||
          i.availabilityDate!.contains(val)) {
        searchList.add(i);
      } else if (i.vehicleSizes.toString().toLowerCase().contains(val) ||
          i.vehicleSizes.toString().contains(val)) {
        searchList.add(i);
      } else if (i.id!.toString().contains(val)) {
        searchList.add(i);
      } else if (i.originState!.title!.toString().toLowerCase().contains(val) ||
          i.originState!.title!.toString().contains(val)) {
        searchList.add(i);
      } else if (i.originCountry!.title!.contains(val) ||
          i.originCountry!.title!.toString().contains(val)) {
        searchList.add(i);
      } else if (i.originCity!.title!.contains(val) ||
          i.originCity!.title!.toString().toLowerCase().contains(val)) {
        searchList.add(i);
      } else if (i.equipmentTypes.toString().contains(val) ||
          i.equipmentTypes.toString().toLowerCase().contains(val)) {
        searchList.add(i);
      } else if (i.destinationCountry!.title!.contains(val) ||
          i.destinationCountry!.title!.toString().contains(val)) {
        searchList.add(i);
      } else if (i.destinationState!.title!.contains(val) ||
          i.destinationState!.title!.toLowerCase().contains(val)) {
        searchList.add(i);
      } else if (i.destinationCity!.title!.contains(val) ||
          i.destinationCity!.title!.toLowerCase().contains(val)) {
        searchList.add(i);
      } else {
        null;
      }

      if (searchList != null || searchList.length != 0) {
        emit(GetSearchSuccess(searchList));
      } else {
        emit(GetSearchFailed('list is empty'));
      }
    });
  }
}
