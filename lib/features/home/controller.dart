import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hoga_load/features/home/states.dart';
import 'package:hoga_load/features/home/units/homescreen.dart';
import 'package:hoga_load/features/jobs/view.dart';
import 'package:hoga_load/features/loads/cubit/getLoad_cubit.dart';
import '../loads/get_loads/view.dart';
import 'package:hoga_load/features/search_product/cubit/getProduct_cubit.dart';
import 'package:hoga_load/features/search_product/view.dart';
import '../vehicles/get_vehicles/cubit/vehicle_cubit.dart';
import '../vehicles/get_vehicles/view.dart';

import '../jobs/cubit/getJop_cubit.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeLayoutLoading());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens = [
    const HomeScreen(),
    const SearchView(),
    const LoadsView(),
    const VehiclesView(),
    const JobsView()
  ];

  void changeBottom(int index, context) {
    currentIndex = index;
    if (currentIndex == 3) VehiclesCubit.get(context).getVehicleCubit(self: 0);
    if (currentIndex == 2)
      LoadsCubit.get(context).getLoad(self: 0, isFilter: false);
    if (currentIndex == 1) ProductsCubit.get(context).getProduct();
    if (currentIndex == 4) JopCubit.get(context).getJop();

    emit(ChangeBottomNavState());
  }
}
