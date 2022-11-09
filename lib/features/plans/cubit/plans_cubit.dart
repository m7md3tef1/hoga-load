import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hoga_load/core/data/repository/plans_repo.dart';
import '../../../core/data/models/plans/plans_model.dart';
import 'plans_states.dart';

class PlansCubit  extends Cubit<PlansStates> {
  PlansCubit() : super(PlansLoading());

  static PlansCubit get(context) => BlocProvider.of(context);
  Connectivity connectivity =  Connectivity();
  List<PlansModel>plansList=[];

  getPlansCubit(){
    emit(PlansLoading());
    connectivity.checkConnectivity().then((value)async{
      if(ConnectivityResult.none == value){
        emit(NetworkFailed("Check your internet connection and try again"));
      }else{
        PlansRepo.getPlans().then((value) => {
          print('..................................'),
          plansList=value,
          print("this value--------Plans"),
          print(value),
          emit(GetPlansSuccess(value))
        }).onError((error, stackTrace) => {
          emit(GetPlansFailed(error.toString())),
          print(error)

        });
      }

    });
  }


}