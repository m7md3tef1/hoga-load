import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hoga_load/core/data/models/master/EquipmentTypes.dart';
import 'package:hoga_load/core/data/models/vehicle/VehicleSizes.dart';
import 'package:hoga_load/core/data/models/vehicle/VehicleTypes.dart';
import 'package:hoga_load/core/data/repository/vehicle_repo.dart';
import 'package:hoga_load/core/keys/keys.dart';
import '../../../core/master_cubit/getDataForm_cubit.dart';

import '../../../core/data/models/vehicle/Addvehicle_model.dart';
import '../../../core/data/models/vehicle/Attributes.dart';
import '../../../core/data/models/vehicle/vehicles.dart';
import 'getVehicle_states.dart';

class VehiclesCubit extends Cubit<AddVehicleStates> {
  VehiclesCubit() : super(AddVehicleLoading());

  static VehiclesCubit get(context) => BlocProvider.of(context);
  Connectivity connectivity = Connectivity();
  List<AddVehicle> attributesList = [];
  List<AddVehicle> equipmentList = [];
  List<AddVehicle> vehicleSizeList = [];
  List<AddVehicle> vehiclesTypeList = [];
  List<Vehicles>searchList=[];
  List<Vehicles>vehicleList=[];

  //checkBoxlist
  List equipmentType=[];
  List attributes=[];
  List vehcleType=[];
  List vehcleSize=[];





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
  getVehicleCubit(){
    connectivity.checkConnectivity().then((value)async{
      if(ConnectivityResult.none == value){
        emit(NetworkFailed("Check your internet connection and try again"));
      }else{
        VehicleRepo.getVehicles().then((value) => {
          print('..................................'),
          print(value),
          vehicleList=value,
          emit(GetVehicleSuccess(value))
        }).onError((error, stackTrace) => {
          emit(GetVehicleFailed(error.toString())),
          print(error)

        });
      }

    });
  }
  searchVehicles(context,{val,equipmentSize2,attributes2,vehicleSize2,vehicleType2}) {
      searchList.clear();
    print("cubit");
    print(equipmentSize2);
      print(vehicleSize2);


      connectivity.checkConnectivity().then((value)async{
      if(ConnectivityResult.none == value){
        emit(NetworkFailed("Check your internet connection and try again"));
      }else{
        VehicleRepo.searchVehicles(search: val,equipmentSize: equipmentSize2,vehicleSize: vehicleSize2,
            attributes: attributes2,vehicleType: vehicleType2,context: context).then((value) => {
          print('..................................'),
          print(value),
          print("value2"),

          if(value.isNotEmpty){
            print("value"),
            print('..................................'),
            print(value),
            searchList=value,
            emit(GetSearchSuccess(searchList)),
            equipmentType.clear(),
            attributes.clear(),
            vehcleType.clear(),
            vehcleSize.clear(),
            DataFormCubit.get(context).cityOriginID='',
            DataFormCubit.get(context).countryOriginID='',
            DataFormCubit.get(context).countryDestinationID='',
            DataFormCubit.get(context).stateDestinationID='',
            DataFormCubit.get(context).stateOriginID='',
            DataFormCubit.get(context).cityDestinationID='',

          }else{
            emit(GetSearchFailed('Nothing found try again')),
            equipmentType.clear(),
            attributes.clear(),
            vehcleType.clear(),
            vehcleSize.clear(),
            DataFormCubit.get(context).cityOriginID='',
            DataFormCubit.get(context).countryOriginID='',
            DataFormCubit.get(context).countryDestinationID='',
            DataFormCubit.get(context).stateDestinationID='',
            DataFormCubit.get(context).stateOriginID='',
            DataFormCubit.get(context).cityDestinationID='',
          }

        }).onError((error, stackTrace) => {
          emit(GetSearchFailed(error.toString())),
          equipmentType.clear(),
          attributes.clear(),
          vehcleType.clear(),
          vehcleSize.clear(),
          DataFormCubit.get(context).cityOriginID='',
          DataFormCubit.get(context).countryOriginID='',
          DataFormCubit.get(context).countryDestinationID='',
          DataFormCubit.get(context).stateDestinationID='',
          DataFormCubit.get(context).stateOriginID='',
          DataFormCubit.get(context).cityDestinationID='',
          print(error)

        });
      }

    });
//    searchList.clear();
//    VehiclesCubit.get(context).vehicleList.forEach((i) {
//      if(i.weight!.toLowerCase().contains(val)||i.weight!.contains(val)){
//        searchList.add(i);
//      }
//      else if(i.availabilityDate!.toLowerCase().contains(val)||i.availabilityDate!.contains(val)){
//        searchList.add(i);
//
//      }else if(i.vehicleSizes2.toString().toLowerCase().contains(val)||i.vehicleSizes2.toString().contains(val)){
//        searchList.add(i);
//
//      }else if(i.id!.toString().contains(val)){
//        searchList.add(i);
//
//      }else if(i.originState!.title!.toString().toLowerCase().contains(val)||i.originState!.title!.toString().contains(val)){
//        searchList.add(i);
//
//      }else if(i.originCountry!.title!.contains(val)||i.originCountry!.title!.toString().contains(val)){
//        searchList.add(i);
//
//      }else if(i.originCity!.title!.contains(val)||i.originCity!.title!.toString().toLowerCase().contains(val)){
//        searchList.add(i);
//
//      }else if(i.equipmentTypes2.toString().contains(val)||i.equipmentTypes2.toString().toLowerCase().contains(val)){
//        searchList.add(i);
//
//      }else if(i.destinationCountry!.title!.contains(val)||i.destinationCountry!.title!.toString().contains(val)){
//        searchList.add(i);
//
//      }else if(i.destinationState!.title!.contains(val)||i.destinationState!.title!.toLowerCase().contains(val)){
//        searchList.add(i);
//
//      }else if(i.destinationCity!.title!.contains(val)||i.destinationCity!.title!.toLowerCase().contains(val)){
//        searchList.add(i);
//
//      }else{
//        null;
//
//      }
//
//
//      if(searchList!=null||searchList.length!=0){
//        emit(GetSearchSuccess(searchList));
//
//      }else{
//        emit(GetSearchFailed('list is empty'));
//
//      }
//    });
  }


  changeCheckBox(boxKey,index,val){

    if(boxKey==MasterKeys.vehicleSize.name){
      val?vehcleSize.add(vehicleSizeList[index].id):vehcleSize.remove(vehicleSizeList[index].id);
    }
    if(boxKey==MasterKeys.vehicleTypes.name){
      val?vehcleType.add(vehiclesTypeList[index].id):vehcleType.remove(vehiclesTypeList[index].id);
    }
    if(boxKey==MasterKeys.attributes.name){
      val?attributes.add(attributesList[index].id):attributes.remove(attributesList[index].id);
    }
    if(boxKey==MasterKeys.equipmentTypes.name){
      val?equipmentType.add(equipmentList[index].id):equipmentType.remove(equipmentList[index].id);
    }
   // emit(ChangeBox());

    print(vehcleSize);
    print(attributes);
    print(equipmentType);
    print(vehcleType);

    print('+++++++++++++++++++++++++++++++++++');
  }
}
