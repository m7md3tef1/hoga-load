import '../data/models/vehicle/Addvehicle_model.dart';

abstract class AddDataFormStates{}

class GetCountryLoading extends AddDataFormStates{}
class DataFormStatesLoading extends AddDataFormStates{}

class GetCountrySuccess extends AddDataFormStates{
  List<AddVehicle>addCountry=[];
  GetCountrySuccess(this.addCountry);
}
class GetCountryFailed extends AddDataFormStates{
}
class GetCityLoading extends AddDataFormStates{}


class GetStateLoading extends AddDataFormStates{}

class GetStateSuccess extends AddDataFormStates{

  List<AddVehicle>addState=[];
  GetStateSuccess(this.addState);
}

class GetStateFailed extends AddDataFormStates{

  final String msg;
  GetStateFailed(this.msg);
}

class GetDestintionStateLoading extends AddDataFormStates{}

class GetDestintionStateSuccess extends AddDataFormStates{

  List<AddVehicle>addState=[];
  GetDestintionStateSuccess(this.addState);
}

class GetDestintionStateFailed extends AddDataFormStates{

  final String msg;
  GetDestintionStateFailed(this.msg);
}

class GetDestintionCityLoading extends AddDataFormStates{}

class GetDestintionCitySuccess extends AddDataFormStates{

  List<AddVehicle>addState=[];
  GetDestintionCitySuccess(this.addState);
}

class GetDestintionCityFailed extends AddDataFormStates{

  final String msg;
  GetDestintionCityFailed(this.msg);
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
class GetProductTypeSuccess extends AddDataFormStates{

  List<AddVehicle>equipmentList=[];
  GetProductTypeSuccess(this.equipmentList);
}

class GetProductTypeFailed extends AddDataFormStates{

  final String msg;
  GetProductTypeFailed(this.msg);
}