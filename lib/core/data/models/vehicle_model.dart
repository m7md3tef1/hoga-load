class VehicleModel {
  VehicleModel({
    this.date,
    this.originCountry,
    this.originState,
    this.originCity,
    this.destinationCountry,
    this.destinationState,
    this.destinationCity,
    this.equipmentTypes,
    this.vehicleAttributes,
    this.vehicleTypes,
    this.vehicleSizes,
    this.weight,
    this.instructions,
   });

  VehicleModel.fromJson(dynamic json) {
    date = json['availability_date']??'';
    originCountry = json['origin_country']??'';
    originState = json['origin_state']??'';
    originCity = json['origin_city']??'';
    destinationCountry = json['destination_country']??'';
    destinationState = json['destination_state']??'';
    destinationCity = json['destination_city'];
    equipmentTypes = json['equipment_types']??'';
    vehicleAttributes = json['vehicle_attributes']??'';
    vehicleTypes = json['vehicle_types']??'';
    vehicleSizes = json['vehicle_sizes'];
    weight = json['weight'];
    instructions = json['instructions'];
  }
  var date;
  var originCountry;
  var originState;
  var originCity;
  var destinationCountry;
  var destinationState;
  var destinationCity;
  var equipmentTypes;
  var vehicleAttributes;
  var vehicleTypes;
  var vehicleSizes;
  String? weight;
  String? instructions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['availability_date'] = date;
    map['origin_country'] = originCountry;
    map['origin_state'] = originState;
    map['origin_city'] = originCity;
    map['destination_country'] = destinationCountry;
    map['destination_state'] = destinationState;
    map['destination_city'] = destinationState;
    map['equipment_types']=equipmentTypes;
    map['vehicle_attributes'] = vehicleAttributes;
    map['vehicle_types'] = vehicleTypes;
    map['vehicle_sizes'] = vehicleSizes;
    map['weight'] = weight;
    map['instructions']=instructions;
    return map;
  }

}