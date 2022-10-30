import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hoga_load/core/data/repository/vehicle_repo.dart';
import 'package:hoga_load/features/jobs/cubit/getJop_states.dart';

import '../../../core/data/models/jobs/GetJop_model.dart';

class JopCubit extends Cubit<AddJopStates> {
  JopCubit() : super(AddJopLoading());

  static JopCubit get(context) => BlocProvider.of(context);
  Connectivity connectivity = Connectivity();

  List<GetJopModel> searchList = [];
  List<GetJopModel> jopList = [];

  getJop() {
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        VehicleRepo.getJop('jobs')
            .then((value) => {
                  print('..................................'),
                  print(value),
                  jopList = value,
                  emit(GetJopSuccess(value))
                })
            .onError((error, stackTrace) =>
                {emit(GetJopFailed(error.toString())), print(error)});
      }
    });
  }

  searchJop(val, context) {
    searchList.clear();
    JopCubit.get(context).jopList.forEach((i) {
      if (i.title!.toLowerCase().contains(val) || i.title!.contains(val)) {
        searchList.add(i);
      }  else if (i.id!.toString().contains(val)) {
        searchList.add(i);
      } else if (i.state!.title!.toString().toLowerCase().contains(val) ||
          i.state!.title!.toString().contains(val)) {
        searchList.add(i);
      } else if (i.salary!.contains(val) ||
          i.salary!.toString().contains(val)) {
        searchList.add(i);
      } else if (i.category!.title!.contains(val) ||
          i.category!.title!.toLowerCase().contains(val)) {
        searchList.add(i);
      } else if (i.jobType!.title!.toString().contains(val) ||
          i.jobType!.title!.toString().toLowerCase().contains(val)) {
        searchList.add(i);
      } else if (i.noOfPosts!.toString().contains(val) ||
          i.noOfPosts!.toString().contains(val)) {
        searchList.add(i);
      }  else if (i.shiftTime.toString().toLowerCase().contains(val) ||
          i.shiftTime.toString().contains(val)) {
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
