

import 'package:shared_preferences/shared_preferences.dart';

import '../../keys/keys.dart';

class CacheHelper{
 static late SharedPreferences sharedPreferences ;


 //بدل ما استدعيها كذا مره لا انا هحطها ف المين
 // هنا هحقق السنجلتون  عشان هو كود واحد هستخدمه ف كل الابلكيشن مره واحده
 
 static init()async{
    sharedPreferences = await SharedPreferences.getInstance();
 }
 
static putBool(SharedKeys key,value){
   sharedPreferences.setBool(key.name, value??'');
 }
 static getBool(SharedKeys key){
  return sharedPreferences.getBool( key.name)??false;
 }

 static putString(SharedKeys key,value){
   sharedPreferences.setString(key.name, value??'');
 }
 static getString(SharedKeys key){
   return sharedPreferences.getString(key.name)??"";
 }
}