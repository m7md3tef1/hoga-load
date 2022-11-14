import 'package:hoga_load/core/data/models/vehicle/Attributes.dart';
import 'package:hoga_load/core/data/models/vehicle/user.dart';

import '../master/DestinationCity.dart';
import '../master/DestinationCountry.dart';
import '../master/DestinationState.dart';
import '../master/EquipmentTypes.dart';
import '../master/OriginCity.dart';
import '../master/OriginCountry.dart';
import '../master/OriginState.dart';
import 'VehicleSizes.dart';
import 'VehicleTypes.dart';
import 'ViewdBy.dart';

class Vehicles {
  Vehicles({
    this.id,
    this.availabilityDate,
    this.originCountry,
    this.originState,
    this.originCity,
    this.destinationCountry,
    this.destinationState,
    this.destinationCity,
    this.equipmentTypes,
    this.equipmentTypes2,
    this.attributes,
    this.attributes2,
    this.vehicleSizes,
    this.vehicleSizes2,
    this.vehicleTypes,
    this.vehicleTypes2,
    this.weight,
    this.instructions,
    this.viewdBy,
    this.user,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,});

  Vehicles.fromJson(Map<dynamic, dynamic>json) {
    id = json['id'];
    availabilityDate = json['availability_date'];
    originCountry = json['origin_country'] != null ? OriginCountry.fromJson(json['origin_country']) : null;
    originState = json['origin_state'] != null ? OriginState.fromJson(json['origin_state']) : null;
    originCity = json['origin_city'] != null ? OriginCity.fromJson(json['origin_city']) : null;
    destinationCountry = json['destination_country'] != null ? DestinationCountry.fromJson(json['destination_country']) : null;
    destinationState = json['destination_state'] != null ? DestinationState.fromJson(json['destination_state']) : null;
    destinationCity = json['destination_city'] != null ? DestinationCity.fromJson(json['destination_city']) : null;
    if (json['equipment_types'] != null) {
      equipmentTypes = [];
      json['equipment_types'].forEach((v) {
        equipmentTypes!.add(EquipmentTypes.fromJson(v));
      });
    }
    if (json['attributes'] != null) {
      attributes = [];
      json['attributes'].forEach((v) {
        attributes!.add(Attributes.fromJson(v));
      });
    }
    if (json['vehicle_sizes'] != null) {
      vehicleSizes = [];
      json['vehicle_sizes'].forEach((v) {
        vehicleSizes!.add(VehicleSizes.fromJson(v));
      });
    }
    if (json['vehicle_types'] != null) {
      vehicleTypes = [];
      json['vehicle_types'].forEach((v) {
        vehicleTypes!.add(VehicleTypes.fromJson(v));
      });
    }
    weight = json['weight'];
    instructions = json['instructions'];

    user = (json['user'] != null ? User.fromJson(json['user']) : null)!;

    if (json['viewd_by'] != null) {
      viewdBy = [];
      json['viewd_by'].forEach((v) {
        viewdBy!.add(ViewdBy.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }
  int? id;
  String? availabilityDate;
  OriginCountry? originCountry;
  OriginState? originState;
  OriginCity? originCity;
  DestinationCountry? destinationCountry;
  DestinationState? destinationState;
  DestinationCity? destinationCity;
  List<EquipmentTypes>? equipmentTypes;
  List<Attributes>? attributes;
  List<VehicleSizes>? vehicleSizes;
  List<VehicleTypes>? vehicleTypes;
  List<String>? equipmentTypes2=[];
  List<String>? vehicleSizes2=[];
  List<String>? attributes2=[];
  List<String>? vehicleTypes2=[];


  User? user;
  String? weight;
  dynamic instructions;
  List<ViewdBy>? viewdBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['availability_date'] = availabilityDate;
    if (originCountry != null) {
      map['origin_country'] = originCountry!.id!;
    }
    if (originState != null) {
      map['origin_state'] = originState!.id;
    }
    if (originCity != null) {
      map['origin_city'] = originCity!.id;
    }
    if (destinationCountry != null) {
      map['destination_country'] = destinationCountry!.id;
    }
    if (destinationState != null) {
      map['destination_state'] = destinationState!.id;
    }
    if (destinationCity != null) {
      map['destination_city'] = destinationCity!.id;
    }
    if (equipmentTypes != null) {
      map['equipment_types'] = equipmentTypes!.map((v) => v.toJson()).toList();
    }
    if (attributes != null) {
      map['attributes'] = attributes!.map((v) => v.toJson()).toList();
    }
    if (vehicleSizes != null) {
      map['vehicle_sizes'] = vehicleSizes!.map((v) => v.toJson()).toList();
    }
    if (vehicleTypes != null) {
      map['vehicle_types'] = vehicleTypes!.map((v) => v.toJson()).toList();
    }
    map['weight'] = weight;
    map['instructions'] = instructions;


    if (user != null) {
      map['user'] = user!.toJson();
    }
    map['user'] = user;
    if (viewdBy != null) {
      map['viewd_by'] = viewdBy!.map((v) => v.toJson()).toList();
    }
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deleted_at'] = deletedAt;
    return map;
  }

}