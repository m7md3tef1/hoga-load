import 'package:hoga_load/core/data/models/master/OriginCity.dart';

import '../master/DestinationCity.dart';
import '../master/DestinationCountry.dart';
import '../master/DestinationState.dart';
import '../master/EquipmentTypes.dart';
import '../master/OriginCountry.dart';
import '../master/OriginState.dart';
import '../vehicle/Attributes.dart';
import '../vehicle/VehicleSizes.dart';
import '../vehicle/VehicleTypes.dart';
import '../vehicle/ViewdBy.dart';
import '../vehicle/user.dart';

class GetLoadsModel {
  GetLoadsModel({
    this.id,
    this.availabilityDate,
    this.originCountry,
    this.originState,
    this.originCity,
    this.destinationCountry,
    this.destinationState,
    this.destinationCity,
    this.equipmentTypes,
    this.attributes,
    this.attributes2,
    this.vehicleSizes,
    this.vehicleTypes,
    this.vehicleTypes2,
    this.equipmentTypes2,
    this.vehicleSizes2,
    this.weight,
    this.instructions,
    this.user,
    this.viewdBy,
  });

  GetLoadsModel.fromJson(dynamic json) {
    id = json['id'];
    availabilityDate = json['availability_date'];
    originCountry = json['origin_country'] != null
        ? OriginCountry.fromJson(json['origin_country'])
        : null;
    originState = json['origin_state'] != null
        ? OriginState.fromJson(json['origin_state'])
        : null;
    originCity = json['origin_city'] != null
        ? OriginCity.fromJson(json['origin_city'])
        : null;
    destinationCountry = json['destination_country'] != null
        ? DestinationCountry.fromJson(json['destination_country'])
        : null;
    destinationState = json['destination_state'] != null
        ? DestinationState.fromJson(json['destination_state'])
        : null;
    destinationCity = json['destination_city'] != null
        ? DestinationCity.fromJson(json['destination_city'])
        : null;
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
  List<String>? equipmentTypes2 = [];
  List<String>? vehicleSizes2 = [];
  String? weight;
  dynamic instructions;
  User? user;
  List<ViewdBy>? viewdBy;
  List<String>?vehicleTypes2=[];
  List<String>?attributes2=[];


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['availability_date'] = availabilityDate;
    if (originCountry != null) {
      map['origin_country'] = originCountry!.toJson();
    }
    if (originState != null) {
      map['origin_state'] = originState!.toJson();
    }
    map['origin_city'] = originCity;
    if (destinationCountry != null) {
      map['destination_country'] = destinationCountry!.toJson();
    }
    if (destinationState != null) {
      map['destination_state'] = destinationState!.toJson();
    }
    if (destinationCity != null) {
      map['destination_city'] = destinationCity!.toJson();
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
    return map;
  }
}
