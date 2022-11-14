import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/data/api/api.dart';
import '../../../core/data/local/cacheHelper.dart';
import '../../../core/dialoges/toast.dart';
import '../../../core/keys/keys.dart';
import 'changePass_state.dart';

class ChangePassCubit extends Cubit<ChangePassStates> {
  ChangePassCubit() : super(ChangePassLoading());

  static ChangePassCubit get(context) => BlocProvider.of(context);
  Connectivity connectivity = Connectivity();

  changePass(
    changePassModel,
  ) async {
    var token = await CacheHelper.getString(SharedKeys.token);
    var response = Api().postHttp(
        url: 'profile/change-password',
        data: changePassModel.toJson(),
        authToken: token);
    emit(ChangeLoading());
    print(response);
    response
        .then((value) => {
              print(value),
              emit(ChangePassSuccess()),
              showToast(
                  msg: 'Change Pass successfully',
                  state: ToastedStates.SUCCESS),
            })
        .onError((error, stackTrace) => {
              emit(ChangePassFailed()),
              print(error),
            });
  }
}
