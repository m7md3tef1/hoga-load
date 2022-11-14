import 'package:hoga_load/core/data/models/loads/GetLoads_model.dart';
import 'package:hoga_load/core/data/models/vehicle/vehicles.dart';
import 'package:hoga_load/features/loads/cubit/getLoad_cubit.dart';

import '../../../features/vehicles/get_vehicles/cubit/vehicle_cubit.dart';
import '../../keys/keys.dart';
import '../../master_cubit/getDataForm_cubit.dart';
import '../api/api.dart';
import '../local/cacheHelper.dart';

class LoadsRepo {
  static Future<List<Vehicles>> getLoads(self,
      {val,
      equipmentSize,
      attributes,
      vehicleSize,
      vehicleType,
      context,
      isFilter}) async {
    String token = await CacheHelper.getString(SharedKeys.token);
    print(token);
    print(self);
    print(vehicleSize);
    var response;
    isFilter
        ? response = await Api()
            .getHttp(url: 'loads', authToken: token, self: self, data: {
            "equipment_types": equipmentSize,
            "vehicle_attributes": attributes,
            "vehicle_sizes": vehicleSize,
            "vehicle_types": vehicleType,
            "origin_country_id": DataFormCubit.get(context).countryOriginID,
            "origin_state_id": DataFormCubit.get(context).stateOriginID,
            "origin_city_id": DataFormCubit.get(context).cityOriginID,
            "destination_country_id":
                DataFormCubit.get(context).countryDestinationID,
            "destination_state_id":
                DataFormCubit.get(context).stateDestinationID,
            "destination_city_id": DataFormCubit.get(context).cityDestinationID,
          })
        : response = await Api().getHttp(
            url: 'loads', authToken: token, self: self, data: {"search": val});

    List<Vehicles> loadsList = [];
    for (int i = 0; i < response['records'].length; i++) {
      Vehicles blogModel = Vehicles.fromJson(response['records'][i]);

      for (var element in blogModel.equipmentTypes!) {
        blogModel.equipmentTypes2!.add(element.title!);
        print('${element.title}');
        print(blogModel.equipmentTypes2);
      }
      for (var element in blogModel.vehicleSizes!) {
        blogModel.vehicleSizes2!.add(element.title!);
        print('${element.title}');
        print(blogModel.vehicleSizes2);
      }
      for (var element in blogModel.vehicleTypes!) {
        blogModel.vehicleTypes2!.add(element.title!);
      }
      for (var element in blogModel.attributes!) {
        blogModel.attributes2!.add(element.title!);
        print('oooooo${element.title}');
        print(blogModel.equipmentTypes2);
      }
      loadsList.add(blogModel);
    }

    return loadsList;
  }

  static Future<List<Vehicles>> searchLoads(
      {search,
      equipmentSize,
      attributes,
      vehicleSize,
      vehicleType,
      context}) async {
    String token = await CacheHelper.getString(SharedKeys.token);
    print("repooo");
    print("equipment_types" + equipmentSize);
    print("vehicle_attributes" + attributes);
    print("vehicleSize" + vehicleSize);
    print("vehicleType" + vehicleType);
    print("origin_country_id" +
        DataFormCubit.get(context).countryOriginID.toString());
    print("origin_country_id" +
        DataFormCubit.get(context).stateOriginID.toString());
    print("origin_country_id" +
        DataFormCubit.get(context).cityOriginID.toString());
    print("origin_country_id" +
        DataFormCubit.get(context).countryDestinationID.toString());
    print("origin_country_id" +
        DataFormCubit.get(context).stateDestinationID.toString());

    var response = await Api().getHttp(url: 'loads', authToken: token, data: {
      "search": search,
      "equipment_types": equipmentSize,
      "vehicle_attributes": attributes,
      "vehicle_sizes": vehicleSize,
      "vehicle_types": vehicleType,
      "origin_country_id": DataFormCubit.get(context).countryOriginID,
      "origin_state_id": DataFormCubit.get(context).stateOriginID,
      "origin_city_id": DataFormCubit.get(context).cityOriginID,
      "destination_country_id": DataFormCubit.get(context).countryDestinationID,
      "destination_state_id": DataFormCubit.get(context).stateDestinationID,
      "destination_city_id": DataFormCubit.get(context).cityDestinationID,
    });

    List<Vehicles> searchList = [];

    for (int i = 0; i < response['records'].length; i++) {
      Vehicles blogModel = Vehicles.fromJson(response['records'][i]);

      for (var element in blogModel.equipmentTypes!) {
        blogModel.equipmentTypes2!.add(element.title!);
        print('oooooo${element.title}');
        print(blogModel.equipmentTypes2);
      }
      for (var element in blogModel.vehicleSizes!) {
        blogModel.vehicleSizes2!.add(element.title!);
        print('oooooo${element.title}');
        print(blogModel.vehicleSizes2);
      }
      searchList.add(blogModel);
    }

    print(response.length);
    print(searchList.length);

    return searchList;
  }

  static deleteLoads(vehicleId) async {
    String token = await CacheHelper.getString(SharedKeys.token);
    return await Api().getHttp(
        url: "loads/delete", authToken: token, data: {"id": vehicleId});
  }

  static editLoads({context, vehicleId}) async {
    print("repooo");
    print("equipment_types" + DataFormCubit.get(context).dateTime.toString());
    print("vehicle_attributes" +
        VehiclesCubit.get(context).attributes.toString());
    print("vehicleSize" + VehiclesCubit.get(context).vehcleSize.toString());
    print("vehicleType" + VehiclesCubit.get(context).vehcleType.toString());
    print("origin_country_id" +
        DataFormCubit.get(context).countryOriginID.toString());
    print("origin_country_id" +
        DataFormCubit.get(context).stateOriginID.toString());
    print("origin_country_id" +
        DataFormCubit.get(context).cityOriginID.toString());
    print("origin_country_id" +
        DataFormCubit.get(context).countryDestinationID.toString());
    print("origin_country_id" +
        DataFormCubit.get(context).stateDestinationID.toString());
    String token = await CacheHelper.getString(SharedKeys.token);

    return await Api().postHttp(url: "loads/update", authToken: token, data: {
      "id": vehicleId,
      "availability_date": DataFormCubit.get(context).dateTime.toString(),
      "equipment_types": VehiclesCubit.get(context)
          .equipmentType
          .toString()
          .replaceAll(",", "-")
          .replaceAll("[", "")
          .replaceAll("]", "")
          .replaceAll(" ", ""),
      "vehicle_attributes": VehiclesCubit.get(context)
          .attributes
          .toString()
          .replaceAll(",", "-")
          .replaceAll("[", "")
          .replaceAll("]", "")
          .replaceAll(" ", ""),
      "vehicle_sizes": VehiclesCubit.get(context)
          .vehcleSize
          .toString()
          .replaceAll(",", "-")
          .replaceAll("[", "")
          .replaceAll("]", "")
          .replaceAll(" ", ""),
      "vehicle_types": VehiclesCubit.get(context)
          .vehcleType
          .toString()
          .replaceAll(",", "-")
          .replaceAll("[", "")
          .replaceAll("]", "")
          .replaceAll(" ", ""),
      "origin_country": DataFormCubit.get(context).countryOriginID,
      "origin_state": DataFormCubit.get(context).stateOriginID,
      "origin_city": DataFormCubit.get(context).cityOriginID,
      "destination_country": DataFormCubit.get(context).countryDestinationID,
      "destination_state": DataFormCubit.get(context).stateDestinationID,
      "destination_city": DataFormCubit.get(context).cityDestinationID,
      "weight": VehiclesCubit.get(context).weightController.text,
      "instructions": VehiclesCubit.get(context).instructionsController.text,
    });
  }

  static addLoads({context}) async {
//    print("equipment_types"+DataFormCubit.get(context).dateTime.toString());
//    print("vehicle_attributes"+VehiclesCubit.get(context).attributes.toString());
//    print("vehicleSize"+VehiclesCubit.get(context).vehcleSize.toString());
//    print("vehicleType"+VehiclesCubit.get(context).vehcleType.toString());
//    print("origin_country_id"+DataFormCubit.get(context).countryOriginID.toString());
//    print("origin_country_id"+DataFormCubit.get(context).stateOriginID.toString());
//    print("origin_country_id"+DataFormCubit.get(context).cityOriginID.toString());
//    print("origin_country_id"+DataFormCubit.get(context).countryDestinationID.toString());
//    print("origin_country_id"+DataFormCubit.get(context).stateDestinationID.toString());
    String token = await CacheHelper.getString(SharedKeys.token);
    return await Api().postHttp(url: "loads/add", authToken: token, data: {
      "availability_date": DataFormCubit.get(context).dateTime.toString(),
      "equipment_types": VehiclesCubit.get(context)
          .equipmentType
          .toString()
          .replaceAll(",", "-")
          .replaceAll("[", "")
          .replaceAll("]", "")
          .replaceAll(" ", ""),
      "vehicle_attributes": VehiclesCubit.get(context)
          .attributes
          .toString()
          .replaceAll(",", "-")
          .replaceAll("[", "")
          .replaceAll("]", "")
          .replaceAll(" ", ""),
      "vehicle_sizes": VehiclesCubit.get(context)
          .vehcleSize
          .toString()
          .replaceAll(",", "-")
          .replaceAll("[", "")
          .replaceAll("]", "")
          .replaceAll(" ", ""),
      "vehicle_types": VehiclesCubit.get(context)
          .vehcleType
          .toString()
          .replaceAll(",", "-")
          .replaceAll("[", "")
          .replaceAll("]", "")
          .replaceAll(" ", ""),
      "origin_country": DataFormCubit.get(context).countryOriginID,
      "origin_state": DataFormCubit.get(context).stateOriginID,
      "origin_city": DataFormCubit.get(context).cityOriginID,
      "destination_country": DataFormCubit.get(context).countryDestinationID,
      "destination_state": DataFormCubit.get(context).stateDestinationID,
      "destination_city": DataFormCubit.get(context).cityDestinationID,
      "weight": VehiclesCubit.get(context).weightController.text,
      "instructions": VehiclesCubit.get(context).instructionsController.text,

      "availability_date": 22,
      "equipment_types": '1',
      "vehicle_attributes": '1',
      "vehicle_sizes": '1',
      "vehicle_types": '1',
      "origin_country": '1',
      "origin_state": 14,
      "origin_city": 36,
      "destination_country": 1,
      "destination_state": 14,
      "destination_city": 36,
      "weight": 5678,
      // "instructions":VehiclesCubit.get(context).instructionsController.text,
    });
  }

  static addLoadsTest({context}) async {
    String token = await CacheHelper.getString(SharedKeys.token);
    return await Api().postHttp(url: "loads/add", authToken: token);
  }
}
