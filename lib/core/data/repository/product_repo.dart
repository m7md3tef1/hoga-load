import 'package:hoga_load/core/data/models/jobs/GetJop_model.dart';

import '../../keys/keys.dart';
import '../api/api.dart';
import '../local/cacheHelper.dart';
import '../models/product/GetProduct_model.dart';

class ProductRepo{
  static Future<List<GetProductModel>> getProducts(url,self,{GetProductModel? productModel}) async {
    String token= await CacheHelper.getString(SharedKeys.token);
    var response = await Api().getHttp(url: url,authToken: token,self: self );

    List<GetProductModel> productsList = [];
    for (int i = 0; i < response['records'].length; i++) {
      GetProductModel blogModel =
      GetProductModel.fromJson(response['records'][i]);
      productsList.add(blogModel);
    }
    return productsList;
  }
  static Future<List<GetProductModel>> searchProduct(url,self,{GetProductModel? productModel}) async {
    String token= await CacheHelper.getString(SharedKeys.token);
    var response = await Api().getHttp(url: url,authToken: token,self: self,data:productModel!.toJson() );

    List<GetProductModel> productsList = [];
    for (int i = 0; i < response['records'].length; i++) {
      GetProductModel blogModel =
      GetProductModel.fromJson(response['records'][i]);
      productsList.add(blogModel);
    }
    return productsList;
  }


  static addProduct({context,GetProductModel? productModel})async{
    String token=await CacheHelper.getString(SharedKeys.token);
    return await Api().postHttp(url: "products/add",authToken:token,
        data:productModel!.toJson() );

  }
  static delete(productId)async{
    String token=await CacheHelper.getString(SharedKeys.token);
    return await Api().postHttp(url: "products/delete",authToken:token,
       data: {"id":productId} );

  }
  static addProductTest({context})async{
    String token=await CacheHelper.getString(SharedKeys.token);
    return await Api().postHttp(url: "products/add",authToken:token);

  }

  static editVehicle(GetProductModel? productModel)async{

    String token=await CacheHelper.getString(SharedKeys.token);
    return await Api().getHttp(url: "products/update",authToken:token, data:productModel!.toJson());

  }



  static addJop({context,GetJopModel? jopModel})async{
    String token=await CacheHelper.getString(SharedKeys.token);
    return await Api().postHttp(url: "jobs/add",authToken:token,
        data:jopModel!.toJson() );

  }
}