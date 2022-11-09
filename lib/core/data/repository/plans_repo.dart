
import 'package:hoga_load/core/data/models/plans/plans_model.dart';
import '../api/api.dart';

class PlansRepo{
  static Future< List <PlansModel>>  getPlans()async{
    var response= await Api().getHttp(url: 'subscription-plans');

    List<PlansModel>plansList=[];
    for(int i =0;i<response['records'].length;i++){
      PlansModel plansModel=PlansModel.fromJson(response['records'][i]);
      plansList.add(plansModel);

    }
    print(response.length);
    print(plansList.length);

    return plansList;


  }


}