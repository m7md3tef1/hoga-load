import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hoga_load/core/data/models/jobs/get_jop.dart';
import 'package:hoga_load/core/data/repository/vehicle_repo.dart';
import 'package:hoga_load/features/jobs/cubit/getJop_states.dart';
import '../../../core/data/models/jobs/GetJop_model.dart';
import '../../../core/data/repository/product_repo.dart';
import '../../../core/dialoges/toast.dart';
import '../../../core/master_cubit/getDataForm_cubit.dart';

class JopCubit extends Cubit<AddJopStates> {
  JopCubit() : super(AddJopLoading());

  static JopCubit get(context) => BlocProvider.of(context);
  Connectivity connectivity = Connectivity();
  List<GetJop> searchList = [];

  List<GetJopModel> searchList2 = [];
  List<GetJop> jopList = [];
  TextEditingController salaryController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController noOfPostController = TextEditingController();
  TextEditingController shiftController = TextEditingController();
  TextEditingController descController = TextEditingController();

  List<GetJop> myJopList = [];
  bool isAccessToken = true;
  bool testLoading = false;
  bool myJopLoading = false;
  getJops(
      {self,
      GetJop? productModel,
      city2,
      country2,
      state2,
      jopTypeId,
      jopCategortId,
      isFilter,
      context}) {
    myJopLoading = true;

    emit(AddJopLoading());

    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        ProductRepo.getJop('jobs', self,
                productModel: productModel,
                city2: city2,
                country2: country2,
                state2: state2,
                jopTypeId: jopTypeId,
                jopCategortId: jopCategortId,
                isFilter: isFilter)
            .then((value) => {
                  myJopLoading = false,
                  print('................!!!..................'),
                  print(value),
                  if (self == 1)
                    {
                      myJopLoading = false,
                      myJopList = value,
                      print('Get My Product Response'),
                      print(myJopList.length),
                    }
                  else
                    {
                      jopList = value,
                      emit(GetJopSuccess(value)),
                      if (isFilter = true)
                        {
                          // jopClearData(context),
                        }
                    }
                })
            .onError((error, stackTrace) => {
                  myJopLoading = true,
                  print('-----$stackTrace'),
                  emit(GetJopFailed(error.toString())),
                  print('^^^^^$error')
                });
      }
    });
  }

  getJop() {
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        emit(AddJopLoading());
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

  searchJop(context, val) {
    searchList.clear();
    JopCubit.get(context).jopList.forEach((i) {
      if (i.title!.toLowerCase().contains(val) || i.title!.contains(val)) {
        searchList.add(i);
      } else if (i.id!.toString().contains(val)) {
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
      } else if (i.shiftTime.toString().toLowerCase().contains(val) ||
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

  searchFilterJop(GetJopModel getJopModel, context) {
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        emit(AddJopLoading());
        ProductRepo.searchJob('jops', 0, productModel: getJopModel)
            .then((value) => {
                  print('..................................'),
                  print(value),
                  searchList2 = value,
                  if (searchList2 != null || searchList2.length != 0)
                    {
                      emit(GetSearchSuccess2(searchList2)),
                      showToast(msg: 'Success', state: ToastedStates.SUCCESS),
                    }
                  else
                    {
                      emit(GetSearchFailed('list is empty')),
                    }
                })
            .onError((error, stackTrace) =>
                {emit(GetSearchFailed(error.toString())), print(error)});
        showToast(msg: 'Failed', state: ToastedStates.ERROR);
      }
    });

    //searchList.clear();
//    JopCubit.get(context).jopList.forEach((i) {
//      if (i.title!.toLowerCase().contains(val) || i.title!.contains(val)) {
//        searchList.add(i);
//      }  else if (i.id!.toString().contains(val)) {
//        searchList.add(i);
//      } else if (i.state!.title!.toString().toLowerCase().contains(val) ||
//          i.state!.title!.toString().contains(val)) {
//        searchList.add(i);
//      } else if (i.salary!.contains(val) ||
//          i.salary!.toString().contains(val)) {
//        searchList.add(i);
//      } else if (i.category!.title!.contains(val) ||
//          i.category!.title!.toLowerCase().contains(val)) {
//        searchList.add(i);
//      } else if (i.jobType!.title!.toString().contains(val) ||
//          i.jobType!.title!.toString().toLowerCase().contains(val)) {
//        searchList.add(i);
//      } else if (i.noOfPosts!.toString().contains(val) ||
//          i.noOfPosts!.toString().contains(val)) {
//        searchList.add(i);
//      }  else if (i.shiftTime.toString().toLowerCase().contains(val) ||
//          i.shiftTime.toString().contains(val)) {
//        searchList.add(i);
//      } else {
//        null;
//      }
//
//      if (searchList != null || searchList.length != 0) {
//        emit(GetSearchSuccess(searchList));
//      } else {
//        emit(GetSearchFailed('list is empty'));
//      }
//    });
  }

  jopClearData(context) {
    DataFormCubit.get(context).cityJop = '';
    DataFormCubit.get(context).countryJop = '';
    DataFormCubit.get(context).countryJop = '';
    DataFormCubit.get(context).jopCategory = '';
    DataFormCubit.get(context).jopType = '';
    DataFormCubit.get(context).salary = '';
    DataFormCubit.get(context).noOfPost = '';
    DataFormCubit.get(context).shiftTIme = '';
    DataFormCubit.get(context).jopTitle = '';
  }

  addJopCubitTest({context}) {
    testLoading = true;
    emit(Loading());
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
        showToast(
            msg: 'Check your internet connection and try again',
            state: ToastedStates.ERROR);
      } else {
        VehicleRepo.addJopTest(context: context)
            .then((value) => {
                  testLoading = false,
                  showToast(msg: 'success', state: ToastedStates.SUCCESS),
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

          print('Add Jop Test Failed');

          print(error);
        });
      }
    });
  }

  addJopCubit({context, GetJopModel? productModel}) {
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
        showToast(
            msg: "Check your internet connection and try again",
            state: ToastedStates.ERROR);
      } else {
        print('---------- ${productModel!.toJson()}');
        emit(AddJopLoading());
        ProductRepo.addJop(context: context, jopModel: productModel)
            .then((value) => {
                  print('Add Jop Success'),
                  print(value),
                  emit(AddSuccessJop()),
                  descController.text = '',
                  noOfPostController.text = '',
                  salaryController.text = '',
                  titleController.text = '',
                  shiftController.text = '',
                  showToast(
                      msg: 'Add Jop Success', state: ToastedStates.SUCCESS),
                })
            .catchError((error) {
          emit(AddFailed(error.toString()));
          if (error.toString().contains('Unauthorized Access') ||
              error.toString().contains('no credit left')) {}
          print('Add Jop Failed');
          print(error);
          showToast(msg: error.toString(), state: ToastedStates.ERROR);
        });
      }
    });
  }

  editJopCubit(GetJopModel? jopModel) {
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        ProductRepo.editJop(jopModel)
            .then((value) => {
                  print('Edit Jop Success'),
                  print(value),
                  emit(EditSuccess()),
                  showToast(msg: 'Edit Success', state: ToastedStates.SUCCESS),
                  descController.text = '',
                  noOfPostController.text = '',
                  salaryController.text = '',
                  titleController.text = '',
                  shiftController.text = '',
                })
            .catchError((error, stackTrace) => {
                  emit(EditFailed()),
                  print(error),
                  showToast(msg: error.toString(), state: ToastedStates.ERROR),
                  print('Edit Jop Failed'),
                });
      }
    });
  }

  deleteJopCubit(jopId) {
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        ProductRepo.deleteJop(jopId)
            .then((value) => {
                  print('Delete Jop Success'),
                  print(value),
                  emit(DeleteSuccess()),
                  showToast(
                      msg: 'Delete Success', state: ToastedStates.SUCCESS),
                })
            .catchError((error, stackTrace) => {
                  emit(DeleteFailed()),
                  print(error),
                  showToast(msg: error.toString(), state: ToastedStates.ERROR),
                  print('Delete Jop Failed'),
                });
      }
    });
  }
}
