import 'package:hoga_load/core/data/local/cacheHelper.dart';
import 'package:hoga_load/core/data/models/GetJop_model.dart';
import 'package:hoga_load/core/data/models/GetProduct_model.dart';

import '../../keys/keys.dart';
import '../api/api.dart';
import '../models/Addvehicle_model.dart';
import '../models/GetLoads_model.dart';
import '../models/GetVehicle_model.dart';
import '../models/Packages.dart';
import '../models/vehicles.dart';

class VehicleRepo {
  static Future<List<AddVehicle>> getData(url) async {
    var response = await Api().getHttp(url: url);

    List<AddVehicle> attributesList = [];
    for (int i = 0; i < response['records'].length; i++) {
      AddVehicle blogModel = AddVehicle.fromJson(response['records'][i]);
      attributesList.add(blogModel);
    }
    //  print(response.length);
    //print(attributesList.length);

    return attributesList;
  }

  static Future<List<GetVehicleModel>> getVehicle(url) async {
    var response = await Api().getHttp(url: url);

    List<GetVehicleModel> vehiclesList = [];
    for (int i = 0; i < response['records'].length; i++) {
      GetVehicleModel blogModel =
          GetVehicleModel.fromJson(response['records'][i]);
      vehiclesList.add(blogModel);
    }

    return vehiclesList;
  }

  static Future<List<Vehicles>> getVehicles() async {
    var response = await Api().getHttp(url: 'vehicles',authToken: CacheHelper.getString(SharedKeys.token));

    List<Vehicles> blogsList = [];

    for (int i = 0; i < response['records'].length; i++) {
      Vehicles blogModel = Vehicles.fromJson(response['records'][i]);
      blogsList.add(blogModel);
    }

    return blogsList;
  }

  static Future<List<GetLoadsModel>> getLoads(url) async {
    var response = await Api().getHttp(url: url);

    List<GetLoadsModel> loadsList = [];
    for (int i = 0; i < response['records'].length; i++) {
      GetLoadsModel blogModel = GetLoadsModel.fromJson(response['records'][i]);
      loadsList.add(blogModel);
    }

    return loadsList;
  }

  static Future<List<GetProductModel>> getProducts(url) async {
    var response = await Api().getHttp(url: url);

    List<GetProductModel> productsList = [];
    for (int i = 0; i < response['records'].length; i++) {
      GetProductModel blogModel =
          GetProductModel.fromJson(response['records'][i]);
      productsList.add(blogModel);
    }
    return productsList;
  }

  static Future<List<GetJopModel>> getJop(url) async {
    var response = await Api().getHttp(url: url);

    List<GetJopModel> productsList = [];
    for (int i = 0; i < response['records'].length; i++) {
      GetJopModel blogModel = GetJopModel.fromJson(response['records'][i]);
      productsList.add(blogModel);
    }
    return productsList;
  }

  static Future<List<Packages>> getPackage() async {
    var response = await Api().getHttp(url: 'advertisement-packages');

    List<Packages> packageList = [];
    for (int i = 0; i < response['records'].length; i++) {
      Packages blogModel = Packages.fromJson(response['records'][i]);
      packageList.add(blogModel);
    }
    print(response.length);
    print(packageList.length);

    return packageList;
  }
}
