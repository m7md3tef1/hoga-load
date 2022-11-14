import '../../../../core/data/models/vehicle/Addvehicle_model.dart';
import '../../../../core/data/models/vehicle/vehicles.dart';

abstract class VehicleStates {}

class VehicleLoading extends VehicleStates {}

class ChangeBox extends VehicleStates {}

class AddingLoad extends VehicleStates {}

class AddSuccess extends VehicleStates {}

class AddFailed extends VehicleStates {
  String? error;
  AddFailed(this.error);
}

class AddTestFailed extends VehicleStates {
  String? error;
  AddTestFailed(this.error);
}

class EditSuccess extends VehicleStates {}

class EditFailed extends VehicleStates {}

class DeleteSuccess extends VehicleStates {}

class DeleteFailed extends VehicleStates {}

class Loading extends VehicleStates {}

class GetAttributesSuccess extends VehicleStates {
  List<AddVehicle> attributesList = [];
  GetAttributesSuccess(this.attributesList);
}

class GetAttributesFailed extends VehicleStates {
  final String msg;
  GetAttributesFailed(this.msg);
}

class GetEquipmentSuccess extends VehicleStates {
  List<AddVehicle> equipmentList = [];
  GetEquipmentSuccess(this.equipmentList);
}

class GetEquipmentFailed extends VehicleStates {
  final String msg;
  GetEquipmentFailed(this.msg);
}

class GetVehicleSizeSuccess extends VehicleStates {
  List<AddVehicle> vehicleSizeList = [];
  GetVehicleSizeSuccess(this.vehicleSizeList);
}

class GetVehicleSizeFailed extends VehicleStates {
  final String msg;
  GetVehicleSizeFailed(this.msg);
}

class GetVehiclesTypeSuccess extends VehicleStates {
  List<AddVehicle> vehiclesTypeList = [];
  GetVehiclesTypeSuccess(this.vehiclesTypeList);
}

class GetVehiclesTypeFailed extends VehicleStates {
  final String msg;
  GetVehiclesTypeFailed(this.msg);
}

class GetVehicleSuccess extends VehicleStates {
  List<Vehicles> vehicleList = [];
  GetVehicleSuccess(this.vehicleList);
}

class VehicleListEmpty extends VehicleStates {}

class GetVehicleFailed extends VehicleStates {
  final String msg;
  GetVehicleFailed(this.msg);
}

class GetSearchSuccess extends VehicleStates {
  List<Vehicles> vehicleList = [];
  GetSearchSuccess(this.vehicleList);
}

class GetSearchFailed extends VehicleStates {
  final String msg;
  GetSearchFailed(this.msg);
}

class NetworkFailed extends VehicleStates {
  final String msg;
  NetworkFailed(this.msg);
}
