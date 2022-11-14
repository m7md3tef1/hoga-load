import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/data/api/api.dart';
import '../../../core/data/local/cacheHelper.dart';
import '../../../core/data/models/vehicle/user.dart';
import '../../../core/data/repository/vehicle_repo.dart';
import '../../../core/dialoges/toast.dart';
import '../../../core/keys/keys.dart';
import '../../../core/master_cubit/getDataForm_state.dart';
import 'UpdateProfile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileStates> {
  UpdateProfileCubit() : super(UpdateProfileLoading());

  static UpdateProfileCubit get(context) => BlocProvider.of(context);
  Connectivity connectivity = Connectivity();
  List<User>? profileList = [];
  User profileData = User();

  updateProfile(
    updateProfileModel,
  ) async {
    var token = await CacheHelper.getString(SharedKeys.token);
    var response = Api().postHttp(
        url: 'profile/update',
        data: updateProfileModel.toJson(),
        authToken: token);
    emit(UpdateLoading());
    print(response);
    response
        .then((value) => {
              print(value),
              profileData = User.fromJson(value['record']),
              emit(UpdateProfileSuccess(User.fromJson(value['record']))),
              showToast(
                  msg: 'update Profile successfully',
                  state: ToastedStates.SUCCESS),
            })
        .onError((error, stackTrace) => {
              emit(UpdateProfileFailed()),
              print(error),
            });
  }

  getUserProfileData() async {
    var token = await CacheHelper.getString(SharedKeys.token);
    var response = Api().getHttp(
      url: 'profile',
      authToken: token,
    );
    emit(GetUserProfileLoading());
    print(response);
    response
        .then((value) => {
              print('**********'),
              print(value),
              profileData = User.fromJson(value['record']),
              emit(GetUserProfileSuccess(User.fromJson(value['record']))),
            })
        .onError((error, stackTrace) => {
              emit(GetUserProfileFailed(error.toString())),
              print(error),
            });
  }

  getVehicleTypesCubit() {
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(FailedNetwork("Check your internet connection and try again"));
      } else {
        VehicleRepo.getProfile('profile')
            .then((value) => {
                  print('..................................'),
                  print(value),
                  profileList = value,
                  emit(GetProfileSuccess(value))
                })
            .onError((error, stackTrace) =>
                {emit(GetProfileFailed(error.toString())), print(error)});
      }
    });
  }
}
