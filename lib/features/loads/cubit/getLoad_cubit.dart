import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hoga_load/core/data/repository/vehicle_repo.dart';

import '../../../core/data/models/loads/GetLoads_model.dart';
import 'getLoad_states.dart';


class LoadsCubit extends Cubit<AddLoadStates> {
  LoadsCubit() : super(AddLoadLoading());

  static LoadsCubit get(context) => BlocProvider.of(context);
  Connectivity connectivity = Connectivity();

  List<GetLoadsModel> searchList=[];
  List<GetLoadsModel> loadList=[];

  getLoad(){
    connectivity.checkConnectivity().then((value)async{
      if(ConnectivityResult.none == value){
        emit(NetworkFailed("Check your internet connection and try again"));
      }else{
        VehicleRepo.getLoads('loads').then((value) => {
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

  searchLoads(val,context) {
    searchList.clear();
    LoadsCubit.get(context).loadList.forEach((i) {

       if(i.availabilityDate!.toLowerCase().contains(val)||i.availabilityDate!.contains(val)){
        searchList.add(i);
      }
       else if(i.originCountry!.title!.toString().toLowerCase().contains(val)||i.originCountry!.title!.toString().contains(val)){
         searchList.add(i);

       }else if(i.id!.toString().contains(val)){
        searchList.add(i);

      }else if(i.originState!.title!.toString().toLowerCase().contains(val)||i.originState!.title!.toString().contains(val)){
        searchList.add(i);

      }else if(i.destinationCity!.title!.toString().toLowerCase().contains(val)||i.destinationCity!.title!.toString().contains(val)){
         searchList.add(i);

       }else if(i.destinationState!.title!.toString().toLowerCase().contains(val)||i.destinationState!.title!.toString().contains(val)){
         searchList.add(i);

       }else if(i.equipmentTypes.toString().toLowerCase().contains(val)||i.equipmentTypes.toString().contains(val)){
         searchList.add(i);

       }else if(i.vehicleSizes.toString().toLowerCase().contains(val)||i.vehicleSizes.toString().contains(val)) {
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
