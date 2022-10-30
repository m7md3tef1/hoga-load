import '../../../core/data/models/vehicle/Addvehicle_model.dart';
import '../../../core/data/models/vehicle/vehicles.dart';



abstract class AddVehicleStates{}

class VehicleLoading extends AddVehicleStates{}
class ChangeBox extends AddVehicleStates{}


class AddSuccess extends AddVehicleStates{
}
class AddFailed extends AddVehicleStates{
}

class AddVehicleLoading extends AddVehicleStates{}

class GetAttributesSuccess extends AddVehicleStates{

  List<AddVehicle>attributesList=[];
  GetAttributesSuccess(this.attributesList);
}

class GetAttributesFailed extends AddVehicleStates{

  final String msg;
  GetAttributesFailed(this.msg);
}



class GetEquipmentSuccess extends AddVehicleStates{

  List<AddVehicle>equipmentList=[];
  GetEquipmentSuccess(this.equipmentList);
}

class GetEquipmentFailed extends AddVehicleStates{

  final String msg;
  GetEquipmentFailed(this.msg);
}



class GetVehicleSizeSuccess extends AddVehicleStates{

  List<AddVehicle>vehicleSizeList=[];
  GetVehicleSizeSuccess(this.vehicleSizeList);
}

class GetVehicleSizeFailed extends AddVehicleStates{

  final String msg;
  GetVehicleSizeFailed(this.msg);
}


class GetVehiclesTypeSuccess extends AddVehicleStates{

  List<AddVehicle>vehiclesTypeList=[];
  GetVehiclesTypeSuccess(this.vehiclesTypeList);
}

class GetVehiclesTypeFailed extends AddVehicleStates{

  final String msg;
  GetVehiclesTypeFailed(this.msg);
}
class GetVehicleSuccess extends AddVehicleStates{

  List<Vehicles>vehicleList=[];
  GetVehicleSuccess(this.vehicleList);
}

class GetVehicleFailed extends AddVehicleStates{

  final String msg;
  GetVehicleFailed(this.msg);
}
class GetSearchSuccess extends AddVehicleStates{

  List<Vehicles>vehicleList=[];
  GetSearchSuccess(this.vehicleList);
}

class GetSearchFailed extends AddVehicleStates{

  final String msg;
  GetSearchFailed(this.msg);
}

class NetworkFailed extends AddVehicleStates{

  final String msg;
  NetworkFailed(this.msg);
}