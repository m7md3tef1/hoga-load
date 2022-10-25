import '../../../core/data/models/Addvehicle_model.dart';

abstract class AddDataFormStates{}

class GetCountryLoading extends AddDataFormStates{}

class GetCountrySuccess extends AddDataFormStates{
  List<AddVehicle>addCountry=[];
  GetCountrySuccess(this.addCountry);
}
class GetCountryFailed extends AddDataFormStates{
}

class GetStateLoading extends AddDataFormStates{}

class GetStateSuccess extends AddDataFormStates{

  List<AddVehicle>addState=[];
  GetStateSuccess(this.addState);
}

class GetStateFailed extends AddDataFormStates{

  final String msg;
  GetStateFailed(this.msg);
}



class GetCitySuccess extends AddDataFormStates{

  List<AddVehicle>equipmentList=[];
  GetCitySuccess(this.equipmentList);
}

class GetCityFailed extends AddDataFormStates{

  final String msg;
  GetCityFailed(this.msg);
}

class NetworkFailed extends AddDataFormStates {

  final String msg;

  NetworkFailed(this.msg);
}