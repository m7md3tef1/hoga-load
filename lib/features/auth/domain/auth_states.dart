abstract class AuthStates{
}

class AuthLoading extends AuthStates{}

class SignInLoading extends AuthStates{}
class SignInSuccess extends AuthStates{}
class SignInFailed extends AuthStates{}

class RecoverPasswordLoading extends AuthStates{}
class RecoverPassword extends AuthStates{
  String?recoverLink;
  RecoverPassword(this.recoverLink);
}

class SignUpLoading extends AuthStates{}
class SignUpSuccess extends AuthStates{}
class SignUpFailed extends AuthStates{}

class ImageCamera extends AuthStates{}
class ImageGallery extends AuthStates{}


