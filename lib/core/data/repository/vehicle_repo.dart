import 'package:hoga_load/core/data/local/cacheHelper.dart';
import 'package:hoga_load/core/keys/keys.dart';
import 'package:hoga_load/core/master_cubit/getDataForm_cubit.dart';

import '../api/api.dart';
import '../models/Packages.dart';
import '../models/jobs/GetJop_model.dart';
import '../models/loads/GetLoads_model.dart';
import '../models/product/GetProduct_model.dart';
import '../models/vehicle/Addvehicle_model.dart';
import '../models/vehicle/GetVehicle_model.dart';
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
    String token= await CacheHelper.getString(SharedKeys.token);
    var response = await Api().getHttp(
        url: url, authToken: token);

    List<User> getProfileList = [];
    for (int i = 0; i < response['records'].length; i++) {
      User blogModel = User.fromJson(response['records'][i]);
      getProfileList.add(blogModel);
      print('firstname...............');
      print(blogModel.firstName);
    }

    return getProfileList;
  }

  static Future<List<Vehicles>> getVehicles() async {
    String token= await CacheHelper.getString(SharedKeys.token);
    var response = await Api().getHttp(url: 'vehicles',authToken: token);

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
      blogsList.add(blogModel);
    }

    print(response.length);
    print(blogsList.length);

    return blogsList;
  }

  static Future<List<GetLoadsModel>> getLoads(url) async {
    String token= await CacheHelper.getString(SharedKeys.token);
    var response = await Api().getHttp(url: url,authToken: token);

    List<GetLoadsModel> loadsList = [];
    for (int i = 0; i < response['records'].length; i++) {
      GetLoadsModel blogModel = GetLoadsModel.fromJson(response['records'][i]);

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
      loadsList.add(blogModel);
    }

    return loadsList;
  }

  static Future<List<GetProductModel>> getProducts(url) async {
    String token= await CacheHelper.getString(SharedKeys.token);
    var response = await Api().getHttp(url: url,authToken: token);

    List<GetProductModel> productsList = [];
    for (int i = 0; i < response['records'].length; i++) {
      GetProductModel blogModel =
          GetProductModel.fromJson(response['records'][i]);
      productsList.add(blogModel);
    }
    return productsList;
  }

  static Future<List<GetJopModel>> getJop(url) async {
    String token= await CacheHelper.getString(SharedKeys.token);
    var response = await Api().getHttp(url: url,authToken:  token);

    List<GetJopModel> productsList = [];
    for (int i = 0; i < response['records'].length; i++) {
      GetJopModel blogModel = GetJopModel.fromJson(response['records'][i]);
      productsList.add(blogModel);
    }
    return productsList;
  }

  static Future<List<Packages>> getPackage() async {
    String token= await CacheHelper.getString(SharedKeys.token);
    var response = await Api().getHttp(url: 'advertisement-packages',authToken:  token);

    List<Packages> packageList = [];
    for (int i = 0; i < response['records'].length; i++) {
      Packages blogModel = Packages.fromJson(response['records'][i]);
      packageList.add(blogModel);
    }
    print(response.length);
    print(packageList.length);

    return packageList;
  }

  static Future<List<Vehicles>> searchVehicles(
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

    var response =
        await Api().getHttp(url: 'vehicles', authToken: token, data: {
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
}
