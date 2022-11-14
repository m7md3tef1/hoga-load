import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hoga_load/core/data/local/cacheHelper.dart';
import 'package:hoga_load/core/keys/keys.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/data/api/api.dart';
import '../../../core/dialoges/toast.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthLoading());

  static AuthCubit get(context) => BlocProvider.of(context);
  Connectivity connectivity = Connectivity();
  var image;

  signIn(loginModel) {
    var response = Api().postHttp(url: 'login', data: loginModel.toJson());
    print(response);
    print('login response');
    emit(SignInLoading());
    response
        .then((value) => {
              print('//////////////////////////////'),
              print(value),
              emit(SignInSuccess()),
              CacheHelper.putString(SharedKeys.token, value['auth_token']),
              print(value['auth_token']),
              print(response),
              print('Success'),
              showToast(
                  msg: 'login Successfully', state: ToastedStates.SUCCESS),
            })
        .onError((error, stackTrace) => {
              emit(SignInFailed()),
              showToast(msg: error.toString(), state: ToastedStates.ERROR),
              print('Failed'),
              print(error),
            });
  }

  signUp(userModel) {
    var response = Api().postHttp(url: 'register', data: userModel.toJson());
    emit(SignUpLoading());
    print(response);
    response
        .then((value) => {
              print(value),
              emit(SignUpSuccess()),
              showToast(
                  msg: 'Sign up successfully', state: ToastedStates.SUCCESS),
            })
        .onError((error, stackTrace) => {
              emit(SignUpFailed()),
              showToast(msg: error.toString(), state: ToastedStates.ERROR),
              print(error),
            });
  }

  pickFromCamera(BuildContext context) async {
    var img = await ImagePicker().pickImage(source: ImageSource.camera);
    image = File(img!.path);
    Navigator.of(context).pop();
    print(image);
    emit(ImageCamera());
  }

  pickFromGallery(BuildContext context) async {
    var img = await ImagePicker().pickImage(source: ImageSource.gallery);
    image = File(
      img!.path,
    );
    Navigator.of(context).pop();
    print('pppppppppppppppppppppppp');

    print(image);
    emit(ImageGallery());
  }

  notLogged(email) {
    var response =
        Api().postHttp(url: 'recover-password', data: {"username": "$email"});
    emit(RecoverPasswordLoading());
    response
        .then((value) => {
              print('//////////////////////////////'),
              print(value),
              emit(RecoverPassword(value['recover_password_link'])),
              print(response),
              print('Success'),
              showToast(
                  msg: 'Success!A password reset link has been sent',
                  state: ToastedStates.SUCCESS),
            })
        .onError((error, stackTrace) => {
              emit(SignInFailed()),
              showToast(msg: error.toString(), state: ToastedStates.ERROR),
              print('Failed'),
              print(error),
            });
  }
}
