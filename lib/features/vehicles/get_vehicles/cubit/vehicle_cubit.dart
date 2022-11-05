import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hoga_load/core/data/repository/vehicle_repo.dart';
import 'package:hoga_load/core/keys/keys.dart';
import '../../../../core/data/models/vehicle/Addvehicle_model.dart';
import '../../../../core/data/models/vehicle/vehicles.dart';
import '../../../../core/dialoges/toast.dart';
import '../../../../core/master_cubit/getDataForm_cubit.dart';
import 'vehicle_states.dart';

class VehiclesCubit extends Cubit<VehicleStates> {
  VehiclesCubit() : super(VehicleLoading());

  static VehiclesCubit get(context) => BlocProvider.of(context);
  TextEditingController weightController=TextEditingController();
  TextEditingController instructionsController=TextEditingController();

  Connectivity connectivity = Connectivity();
  List<AddVehicle> attributesList = [];
  List<AddVehicle> equipmentList = [];
  List<AddVehicle> vehicleSizeList = [];
  List<AddVehicle> vehiclesTypeList = [];
  List<Vehicles>searchList=[];
  List<Vehicles>vehicleList=[];
  List<Vehicles>myvehicleList=[];


  //checkBoxlist
  List equipmentType=[];
  List attributes=[];
  List vehcleType=[];
  List vehcleSize=[];

//  List<bool>?equipmentBoxValue;
//  List<bool>?vehcleSizeBoxValue;
//  List<bool>?vehcleTypeBoxValue;
//  List<bool>?attributesBoxValue;



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
  getVehicleCubit({self}){
    connectivity.checkConnectivity().then((value)async{
      if(ConnectivityResult.none == value){
        emit(NetworkFailed("Check your internet connection and try again"));
      }else{
        VehicleRepo.getVehicles(self).then((value) => {
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
            vehicleClearData(context),


          }else{
            emit(GetSearchFailed('Nothing found try again')),
            vehicleClearData(context),

          }

        }).onError((error, stackTrace) => {
          emit(GetSearchFailed(error.toString())),
          vehicleClearData(context),
          print(error)

        });
      }

    });
  }

   vehicleClearData(context){
     equipmentType.clear();
     attributes.clear();
     vehcleType.clear();
     vehcleSize.clear();
     DataFormCubit.get(context).cityOriginID='';
     DataFormCubit.get(context).countryOriginID='';
     DataFormCubit.get(context).countryDestinationID='';
     DataFormCubit.get(context).stateDestinationID='';
     DataFormCubit.get(context).stateOriginID='';
     DataFormCubit.get(context).cityDestinationID='';
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

  deleteVehicleCubit(vehicleId){
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        VehicleRepo.deleteVehicle(vehicleId)
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
  editVehicleCubit({context,vehicleId}){

    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        VehicleRepo.editVehicle(context: context,vehicleId:vehicleId)
            .then((value) => {
          print('Edit Vehicle Success'),
          print(value),

          emit(EditSuccess()),
          showToast(msg: 'Edit Success', state: ToastedStates.SUCCESS),

        })
            .catchError((error, stackTrace) =>
        {emit(EditFailed()),
          print(error),
          showToast(msg: error.toString(), state: ToastedStates.ERROR),
          print('Edit Vehicle Failed'),
        });
      }
    });
  }

  addVehicleCubit({context}){

    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        VehicleRepo.addVehicle(context: context)
            .then((value) => {
          print('Add Vehicle Success'),
          print(value),
          emit(AddSuccess()),
          vehicleClearData(context),

          showToast(msg: 'Add Success', state: ToastedStates.SUCCESS),

        }).catchError((error) => {
          emit(AddFailed()),
          vehicleClearData(context),

          print('Add Vehicle Failed'),
          print(error),
        });
      }
    });
  }

}
