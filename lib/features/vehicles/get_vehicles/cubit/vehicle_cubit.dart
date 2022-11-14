import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hoga_load/core/data/models/response.dart';
import 'package:hoga_load/core/data/repository/vehicle_repo.dart';
import 'package:hoga_load/core/keys/keys.dart';
import 'package:hoga_load/features/home/view.dart';
import '../../../../core/data/models/vehicle/Addvehicle_model.dart';
import '../../../../core/data/models/vehicle/vehicles.dart';
import '../../../../core/dialoges/toast.dart';
import '../../../../core/master_cubit/getDataForm_cubit.dart';
import '../../../loads/cubit/getLoad_cubit.dart';
import 'vehicle_states.dart';

class VehiclesCubit extends Cubit<VehicleStates> {
  VehiclesCubit() : super(VehicleLoading());

  static VehiclesCubit get(context) => BlocProvider.of(context);
  TextEditingController weightController = TextEditingController();
  TextEditingController instructionsController = TextEditingController();

  Connectivity connectivity = Connectivity();
  List<AddVehicle> attributesList = [];
  List<AddVehicle> equipmentList = [];
  List<AddVehicle> vehicleSizeList = [];
  List<AddVehicle> vehiclesTypeList = [];
  List<Vehicles> searchList = [];
  List<Vehicles> vehicleList = [];
  List<Vehicles> myVehicleList = [];

  //checkBoxlist
  List equipmentType = [];
  List attributes = [];
  List vehcleType = [];
  List vehcleSize = [];

  bool isAccessToken = true;
  bool testLoading = true;
  bool myVehiclesLoading = true;

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
                  emit(GetAttributesSuccess(value)),
                  //  attributesBoxValue=List.filled(attributesList.length, false),
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
                  emit(GetEquipmentSuccess(value)),
                  //equipmentBoxValue=List.filled(equipmentList.length, false),
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
                  emit(GetVehicleSizeSuccess(value)),
                  // vehcleSizeBoxValue=List.filled(vehicleSizeList.length, false),
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
                  emit(GetVehiclesTypeSuccess(value)),
                  //vehcleTypeBoxValue=List.filled(vehiclesTypeList.length, false),
                })
            .onError((error, stackTrace) =>
                {emit(GetVehiclesTypeFailed(error.toString())), print(error)});
      }
    });
  }

  vehicleClearData(context) {
    print('adada');
    equipmentType.clear();
    attributes.clear();
    vehcleType.clear();
    vehcleSize.clear();
    DataFormCubit.get(context).cityOriginID = '';
    DataFormCubit.get(context).countryOriginID = '';
    DataFormCubit.get(context).countryDestinationID = '';
    DataFormCubit.get(context).stateDestinationID = '';
    DataFormCubit.get(context).stateOriginID = '';
    DataFormCubit.get(context).cityDestinationID = '';
    print('length >>>>>>>>>>>${vehcleSize.length}');
  }

  changeCheckBox(boxKey, index, val) {
    if (boxKey == MasterKeys.vehicleSize.name) {
      print('zzzzzzz ${vehcleSize.length}');
      val
          ? vehcleSize.add(vehicleSizeList[index].id)
          : vehcleSize.remove(vehicleSizeList[index].id);
    }
    if (boxKey == MasterKeys.vehicleTypes.name) {
      val
          ? vehcleType.add(vehiclesTypeList[index].id)
          : vehcleType.remove(vehiclesTypeList[index].id);
    }
    if (boxKey == MasterKeys.attributes.name) {
      val
          ? attributes.add(attributesList[index].id)
          : attributes.remove(attributesList[index].id);
    }
    if (boxKey == MasterKeys.equipmentTypes.name) {
      val
          ? equipmentType.add(equipmentList[index].id)
          : equipmentType.remove(equipmentList[index].id);
    }
    // emit(ChangeBox());

    print(vehcleSize);
    print(attributes);
    print(equipmentType);
    print(vehcleType);

    print('+++++++++++++++++++++++++++++++++++');
  }

  getVehicleCubit(
      {self,
      val,
      equipmentSize2,
      attributes2,
      vehicleSize2,
      vehicleType2,
      isFilter,
      context}) {
    myVehiclesLoading = true;
    emit(VehicleLoading());
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        VehicleRepo.getVehicles(self,
                val: val,
                context: context,
                isFilter: isFilter,
                vehicleSize: vehicleSize2,
                vehicleType: vehicleType2,
                attributes: attributes2,
                equipmentSize: equipmentSize2)
            .then((value) => {
                  myVehiclesLoading = false,
                  print(value),
                  print('selffffff >>>> $self'),
                  if (self == 1)
                    {
                      myVehicleList = value,
                      print('Get Vehice Response'),
                      print(myVehicleList.length),
                      vehicleClearData(Home.scaffoldStateKey.currentContext)
                    }
                  else
                    {
                      vehicleList = value,
                      emit(GetVehicleSuccess(value)),
                      vehicleClearData(Home.scaffoldStateKey.currentContext),
                    },
                })
            .onError((error, stackTrace) => {
                  myVehiclesLoading = true,
                  emit(GetVehicleFailed(error.toString())),
                  print(stackTrace),
                  print('erorr >>>>>>>>$error'),
                  vehicleClearData(Home.scaffoldStateKey.currentContext),
                });
      }
    });
  }
//  searchVehicles(context,{val,equipmentSize2,attributes2,vehicleSize2,vehicleType2}) {
//      searchList.clear();
//      print("cubit");
//      print(equipmentSize2);
//      print(vehicleSize2);
//
//
//      connectivity.checkConnectivity().then((value)async{
//      if(ConnectivityResult.none == value){
//        emit(NetworkFailed("Check your internet connection and try again"));
//      }else{
//        VehicleRepo.searchVehicles(search: val,equipmentSize: equipmentSize2,vehicleSize: vehicleSize2,
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
//
//    });
//  }

  deleteVehicleCubit(vehicleId) {
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        VehicleRepo.deleteVehicle(vehicleId)
            .then((value) => {
                  print('Delete Vehicle Success'),
                  print(value),
                  emit(DeleteSuccess()),
                  showToast(
                      msg: 'Delete Success', state: ToastedStates.SUCCESS),
                })
            .onError((error, stackTrace) => {
                  emit(DeleteFailed()),
                  print(error),
                  showToast(msg: error.toString(), state: ToastedStates.ERROR),
                  print('Delete Vehicle Failed'),
                });
      }
    });
  }

  editVehicleCubit({context, vehicleId}) {
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        VehicleRepo.editVehicle(context: context, vehicleId: vehicleId)
            .then((value) => {
                  print('Edit Vehicle Success'),
                  print(value),
                  emit(EditSuccess()),
                  showToast(msg: 'Edit Success', state: ToastedStates.SUCCESS),
                })
            .catchError((error, stackTrace) => {
                  emit(EditFailed()),
                  print(error),
                  showToast(msg: error.toString(), state: ToastedStates.ERROR),
                  print('Edit Vehicle Failed'),
                });
      }
    });
  }

  addVehicleCubitTest({context}) {
    testLoading = true;
    emit(Loading());
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
        showToast(
            msg: 'Check your internet connection and try again',
            state: ToastedStates.ERROR);
      } else {
        VehicleRepo.addVehicleTest(context: context)
            .then((value) => {
                  testLoading = false,
                })
            .catchError((error) {
          if (error.toString().contains('Unauthorized Access') ||
              error.toString().contains('no credit left')) {
            testLoading = false;
            isAccessToken = false;
            emit(AddTestFailed(error.toString()));
            print('oooooooooooooooooo');
          }
          testLoading = false;
          emit(AddTestFailed(error.toString()));

          print('Add Vehicle Test Failed');

          print(error);

          //showToast(msg: error.toString(), state: ToastedStates.ERROR);
        });
      }
    });
  }

  addVehicleCubit({context, isLoad}) {
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
        showToast(
            msg: "Check your internet connection and try again",
            state: ToastedStates.ERROR);
      } else {
        emit(AddingLoad());
        VehicleRepo.addVehicle(context: context, isLoad: isLoad)
            .then((value) => {
                  print('Add Vehicle Success'),
                  print(value),
                  emit(AddSuccess()),
                  if (isLoad)
                    LoadsCubit.get(context).getLoad(self: 1, isFilter: false),
                  vehicleClearData(Home.scaffoldStateKey.currentContext),
                  showToast(msg: 'Add Success', state: ToastedStates.SUCCESS),
                })
            .catchError((error, stack) => {
                  emit(AddFailed(error.toString())),
                  vehicleClearData(Home.scaffoldStateKey.currentContext),
                  print('Add Vehicle Failed'),
                  showToast(msg: error.toString(), state: ToastedStates.ERROR),
                  print(error),
                });
      }
    });
  }
}
