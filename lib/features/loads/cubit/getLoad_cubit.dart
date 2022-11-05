import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hoga_load/core/data/repository/vehicle_repo.dart';
import 'package:hoga_load/features/vehicles/get_vehicles/cubit/vehicle_cubit.dart';
import '../../../core/data/models/loads/GetLoads_model.dart';
import '../../../core/data/repository/load_repo.dart';
import '../../../core/dialoges/toast.dart';
import 'getLoad_states.dart';


class LoadsCubit extends Cubit<AddLoadStates> {
  LoadsCubit() : super(AddLoadLoading());
  TextEditingController weightController=TextEditingController();
  TextEditingController instructionsController=TextEditingController();
  static LoadsCubit get(context) => BlocProvider.of(context);
  Connectivity connectivity = Connectivity();

  List<GetLoadsModel> searchList=[];
  List<GetLoadsModel> loadList=[];
  List<GetLoadsModel>myVehicleList=[];

  bool isAccessToken=true;
  bool  testLoading=true;
  bool  myVehiclesLoading=true;
  getLoad({self}){
    connectivity.checkConnectivity().then((value)async{
      if(ConnectivityResult.none == value){
        emit(NetworkFailed("Check your internet connection and try again"));
      }else{
        LoadsRepo.getLoads(self).then((value) => {
          print('..................................'),
          print(value),
          loadList=value,
          emit(GetLoadsSuccess(value))
        }).onError((error, stackTrace) => {
          emit(GetLoadsFailed(error.toString())),
          print(error)

        });
      }

    });
  }

  deleteLoadsCubit(vehicleId){
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
  editLoadsCubit({context,vehicleId}){

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
  addLoadsCubitTest({context}){
    testLoading=true;
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
        showToast(msg: 'Check your internet connection and try again', state: ToastedStates.ERROR);
      } else {
        LoadsRepo.addLoadsTest(context: context)
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
  addLoadsCubit({context}){

    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
        showToast(msg: "Check your internet connection and try again", state: ToastedStates.ERROR);

      } else {
        LoadsRepo.addLoads(context: context)
            .then((value) => {
          print('Add Vehicle Success'),
          print(value),
          emit(AddSuccess()),
          VehiclesCubit.get(context).vehicleClearData(context),

          showToast(msg: 'Add Success', state: ToastedStates.SUCCESS),

        }).catchError((error) => {
          emit(AddFailed()),
          VehiclesCubit.get(context).vehicleClearData(context),

          print('Add Vehicle Failed'),
          print(error),
          showToast(msg: error.toString(), state: ToastedStates.ERROR),

        });
      }
    });
  }

  searchLoads(context,{val,equipmentSize2,attributes2,vehicleSize2,vehicleType2}) {
    searchList.clear();
    print("cubit");
    print(equipmentSize2);
    print(vehicleSize2);


    connectivity.checkConnectivity().then((value)async{
      if(ConnectivityResult.none == value){
        emit(NetworkFailed("Check your internet connection and try again"));
      }else{
        LoadsRepo.searchLoads(search: val,equipmentSize: equipmentSize2,vehicleSize: vehicleSize2,
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
            VehiclesCubit.get(context).vehicleClearData(context),


          }else{
            emit(GetSearchFailed('Nothing found try again')),
            VehiclesCubit.get(context).vehicleClearData(context),

          }

        }).onError((error, stackTrace) => {
          emit(GetSearchFailed(error.toString())),
          VehiclesCubit.get(context).vehicleClearData(context),
          print(error)

        });
      }

    });
  }


}
