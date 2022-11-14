import 'package:hoga_load/core/data/local/cacheHelper.dart';
import 'package:hoga_load/core/keys/keys.dart';
import 'package:hoga_load/core/master_cubit/getDataForm_cubit.dart';
import '../../../features/vehicles/get_vehicles/cubit/vehicle_cubit.dart';
import '../api/api.dart';
import '../models/Packages.dart';
import '../models/jobs/GetJop_model.dart';
import '../models/jobs/get_jop.dart';
import '../models/loads/GetLoads_model.dart';
import '../models/product/GetProduct_model.dart';
import '../models/vehicle/Addvehicle_model.dart';
import '../models/vehicle/user.dart';
import '../models/vehicle/vehicles.dart';

class VehicleRepo {
  static Future<List<AddVehicle>> getData(url) async {
    var response = await Api().getHttp(url: url);

    List<AddVehicle> attributesList = [];
    for (int i = 0; i < response['records'].length; i++) {
      AddVehicle blogModel = AddVehicle.fromJson(response['records'][i]);
      attributesList.add(blogModel);
    }
    return attributesList;
  }

  static Future<List<User>> getProfile(url) async {
    String token = await CacheHelper.getString(SharedKeys.token);
    var response = await Api().getHttp(url: url, authToken: token);

    List<User> getProfileList = [];
    for (int i = 0; i < response['records'].length; i++) {
      User blogModel = User.fromJson(response['records'][i]);
      getProfileList.add(blogModel);
      print('firstname...............');
      print(blogModel.firstName);
    }

    return getProfileList;
  }

  static Future<List<Vehicles>> getVehicles(self,
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
    var response;
    isFilter == true
        ? response =
            await Api().getHttp(url: 'vehicles', authToken: token, data: {
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
            url: 'vehicles',
            authToken: token,
            self: self,
            data: {"search": val});

    List<Vehicles> blogsList = [];
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
      for (var element in blogModel.vehicleTypes!) {
        blogModel.vehicleTypes2!.add(element.title!);
      }
      for (var element in blogModel.attributes!) {
        blogModel.attributes2!.add(element.title!);
        print('oooooo${element.title}');
        print(blogModel.equipmentTypes2);
      }
      blogsList.add(blogModel);
    }

    print(response.length);
    print(blogsList.length);

    return blogsList;
  }

  static Future<List<GetJop>> getJop(url) async {
    String token = await CacheHelper.getString(SharedKeys.token);
    var response = await Api().getHttp(url: url, authToken: token);

    List<GetJop> productsList = [];
    for (int i = 0; i < response['records'].length; i++) {
      GetJop blogModel = GetJop.fromJson(response['records'][i]);
      productsList.add(blogModel);
    }
    return productsList;
  }

  static Future<List<Packages>> getPackage() async {
    String token = await CacheHelper.getString(SharedKeys.token);
    var response =
        await Api().getHttp(url: 'advertisement-packages', authToken: token);

    List<Packages> packageList = [];
    for (int i = 0; i < response['records'].length; i++) {
      Packages blogModel = Packages.fromJson(response['records'][i]);
      packageList.add(blogModel);
    }
    print(response.length);
    print(packageList.length);

    return packageList;
  }

//  static Future<List<Vehicles>> searchVehicles(
//      {search,
//      equipmentSize,
//      attributes,
//      vehicleSize,
//      vehicleType,
//      context}) async {
//    String token = await CacheHelper.getString(SharedKeys.token);
//    print("repooo");
//    print(search);
////    print("equipment_types" + equipmentSize);
////    print("vehicle_attributes" + attributes);
////    print("vehicleSize" + vehicleSize);
////    print("vehicleType" + vehicleType);
////    print("origin_country_id" +
////        DataFormCubit.get(context).countryOriginID.toString());
////    print("origin_country_id" +
////        DataFormCubit.get(context).stateOriginID.toString());
////    print("origin_country_id" +
////        DataFormCubit.get(context).cityOriginID.toString());
////    print("origin_country_id" +
////        DataFormCubit.get(context).countryDestinationID.toString());
////    print("origin_country_id" +
////        DataFormCubit.get(context).stateDestinationID.toString());
//
//    var response =
//        await Api().getHttp(url: 'vehicles', authToken: token, data: {
////      "search": search??'',
////      "equipment_types": equipmentSize,
////      "vehicle_attributes": attributes,
////      "vehicle_sizes": vehicleSize,
////      "vehicle_types": vehicleType,
////      "origin_country_id": DataFormCubit.get(context).countryOriginID,
////      "origin_state_id": DataFormCubit.get(context).stateOriginID,
////      "origin_city_id": DataFormCubit.get(context).cityOriginID,
////      "destination_country_id": DataFormCubit.get(context).countryDestinationID,
////      "destination_state_id": DataFormCubit.get(context).stateDestinationID,
////      "destination_city_id": DataFormCubit.get(context).cityDestinationID,
//    });
//
//    List<Vehicles> searchList = [];
//
//    for (int i = 0; i < response['records'].length; i++) {
//      Vehicles blogModel = Vehicles.fromJson(response['records'][i]);
//
//      for (var element in blogModel.equipmentTypes!) {
//        blogModel.equipmentTypes2!.add(element.title!);
//        print('oooooo${element.title}');
//        print(blogModel.equipmentTypes2);
//      }
//      for (var element in blogModel.vehicleSizes!) {
//        blogModel.vehicleSizes2!.add(element.title!);
//        print('oooooo${element.title}');
//        print(blogModel.vehicleSizes2);
//      }
//      searchList.add(blogModel);
//    }
//
//    print(response.length);
//    print(searchList.length);
//
//    return searchList;
//  }

  static deleteVehicle(vehicleId) async {
    String token = await CacheHelper.getString(SharedKeys.token);
    return await Api().getHttp(
        url: "vehicles/delete", authToken: token, data: {"id": vehicleId});
  }

  static editVehicle({context, vehicleId}) async {
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

    return await Api()
        .postHttp(url: "vehicles/update", authToken: token, data: {
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

  static addVehicle({context, isLoad}) async {
    String token = await CacheHelper.getString(SharedKeys.token);
    return await Api().postHttp(
        url: isLoad ? "loads/add" : "vehicles/add",
        authToken: token,
        data: {
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
          "destination_country":
              DataFormCubit.get(context).countryDestinationID,
          "destination_state": DataFormCubit.get(context).stateDestinationID,
          "destination_city": DataFormCubit.get(context).cityDestinationID,
          "weight": VehiclesCubit.get(context).weightController.text,
          "instructions":
              VehiclesCubit.get(context).instructionsController.text,
        });
  }

  static addVehicleTest({context}) async {
    String token = await CacheHelper.getString(SharedKeys.token);
    return await Api().postHttp(url: "vehicles/add", authToken: token);
  }

  static addJop({context}) async {
    String token = await CacheHelper.getString(SharedKeys.token);
    return await Api().postHttp(url: "jobs/add", authToken: token, data: {
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
      "weight": VehiclesCubit.get(context).weightController,
      "instructions": VehiclesCubit.get(context).instructionsController,
    });
  }

  static addJopTest({context}) async {
    String token = await CacheHelper.getString(SharedKeys.token);
    return await Api().postHttp(url: "jobs/add", authToken: token);
  }
}
