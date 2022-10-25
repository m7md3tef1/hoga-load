import 'package:hoga_load/features/home/states.dart';
import 'package:hoga_load/features/home/units/homescreen.dart';
import 'package:hoga_load/features/jobs/view.dart';
import 'package:hoga_load/features/loads/view.dart';
import 'package:hoga_load/features/search_product/view.dart';
import 'package:hoga_load/features/vehicles/view.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  void changeBottom(int index) {
    currentIndex = index;
    debugPrint(index.toString());
    emit(ChangeBottomNavState());
  }
}
