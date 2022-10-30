import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/data/api/api.dart';
import '../../../core/data/local/cacheHelper.dart';
import '../../../core/dialoges/toast.dart';
import '../../../core/keys/keys.dart';
import 'UpdateProfile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileStates> {
  UpdateProfileCubit() : super(UpdateProfileLoading());

  static UpdateProfileCubit get(context) => BlocProvider.of(context);
  Connectivity connectivity = Connectivity();

  updateProfile(updateProfileModel,) async {
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
              emit(UpdateProfileSuccess()),
              showToast(
                  msg: 'update Profile successfully',
                  state: ToastedStates.SUCCESS),
            })
        .onError((error, stackTrace) => {
              emit(UpdateProfileFailed()),
              print(error),
            });
  }
}
