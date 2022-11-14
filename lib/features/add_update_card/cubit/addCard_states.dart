abstract class AddCardStates {}

class AddingCardLoading extends AddCardStates {}

class AddingCardSuccess extends AddCardStates {}

class AddingCardFailed extends AddCardStates {
  final String msg;
  AddingCardFailed(this.msg);
}

class NetworkFailed extends AddCardStates {
  final String msg;
  NetworkFailed(this.msg);
}
