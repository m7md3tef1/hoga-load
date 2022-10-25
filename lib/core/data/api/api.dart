
import 'package:dio/dio.dart';

import '../../dialoges/toast.dart';
import '../models/response.dart';

class Api{
   String baseUrl='https://hegaload.com/api/';

   Future<dynamic> getHttp({required url,  data,authToken})async{
     try{

       var response=await Dio().get(baseUrl+'$url',options:
           Options(headers:{
           "Authorization":"Bearer $authToken"
           } ),
         queryParameters: data

     );

       if(response.statusCode==200){return  response.data;}
    }on DioError catch(e){
       ResponseModel responseModel=ResponseModel.fromJson(e.response);
     print('------------------------');
       print(responseModel.status);
       print(responseModel.message);
     print(e.response);



       print(e.response!.data['message']);
     showToast(msg: e.response!.data['message'].toString(), state: ToastedStates.ERROR);

     }
  }

   Future<dynamic> postHttp({required url, required data,authToken,queryParams })async{

    try{
      var response=await Dio().post(baseUrl+'$url',data: data,queryParameters:queryParams,options:
      Options(headers:{
        "Authorization":"Bearer $authToken"
      }, )
      );


      if(response.statusCode==200){
        print(response.data);
        print(response.statusCode);
        return  response.data;
      }

    }on DioError  catch(e){

//      ResponseModel responseModel=ResponseModel.fromJson(e.response!.data());
//      print('------------------------');
//      print(responseModel.status);
//      print(responseModel.message);
//      print('------------------------');
      print(e.response);
      print(e.response!.data['message']);
      showToast(msg: e.response!.data['message'].toString(), state: ToastedStates.ERROR);
      throw Exception();


    }
   }

   Future<dynamic> putHttp({required url, required data,authToken })async{

     try{
       var response=await Dio().patch(baseUrl+'$url',data: data,options:
       Options(headers:{
         "Authorization":"Bearer $authToken"
       } )
       );
       if(response.statusCode==200){
         print('-----------------------');
         print('success');
         print(response.data);
         return  response.data;
       }

     }on DioError catch(e){
       print('------------------------');
       print('faied');

       print(e.response);
       print(e.response!.data['message']);
       showToast(msg: e.response!.data['message'].toString(), state: ToastedStates.ERROR);


     }
   }


}
