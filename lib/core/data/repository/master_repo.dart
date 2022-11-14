import '../api/api.dart';
import '../models/vehicle/Addvehicle_model.dart';

class MasterRepo{


  static Future< List <AddVehicle>>  getCountry(url)async{
    var response= await Api().getHttp(url: url);
    List<AddVehicle>list=[];
    for(int i =0;i<response['records'].length;i++){
      AddVehicle blogModel=AddVehicle.fromJson(response['records'][i]);
      list.add(blogModel);

    }
      print(response.length);
      print(list.length);
    return list;


  }

  static Future< List <AddVehicle>>  getCity(url,state)async{
    var response= await Api().getHttp(url: url);
    List<AddVehicle>list=[];
    print("city");
    for(int i =0;i<response['records'].length;i++){
      if(state==response['records'][i]['state']['title']){
        AddVehicle blogModel=AddVehicle.fromJson(response['records'][i]);
        list.add(blogModel);
      }


    }
      print(response.length);
    print(list.length);

    return list;


  }
  static Future< List <AddVehicle>>  getState(url,country)async{
    var response= await Api().getHttp(url: url,data: {"country":"$country"});
    List<AddVehicle>list=[];
    for(int i =0;i<response['records'].length;i++){
      AddVehicle blogModel=AddVehicle.fromJson(response['records'][i]);
      list.add(blogModel);

    }
      print("states");
    print(list.length);

    return list;


  }
  static Future< List <AddVehicle>>  getData(url)async{
    var response= await Api().getHttp(url: url);

    List<AddVehicle>attributesList=[];
    for(int i =0;i<response['records'].length;i++){
      AddVehicle blogModel=AddVehicle.fromJson(response['records'][i]);
      attributesList.add(blogModel);

    }
    //  print(response.length);
    //print(attributesList.length);

    return attributesList;


  }
  static Future< List <AddVehicle>>  getJop(url)async{
    var response= await Api().getHttp(url: url);

    List<AddVehicle>attributesList=[];
    for(int i =0;i<response['records'].length;i++){
      AddVehicle blogModel=AddVehicle.fromJson(response['records'][i]);
      attributesList.add(blogModel);
    }
    return attributesList;
  }


}