import '../api/api.dart';
import '../models/Packages.dart';

class PackageRepo{
  static Future< List <Packages>>  getPackage()async{
    var response= await Api().getHttp(url: 'advertisement-packages');

    List<Packages>packageList=[];
    for(int i =0;i<response['records'].length;i++){
      Packages blogModel=Packages.fromJson(response['records'][i]);
      packageList.add(blogModel);

    }
    print(response.length);
    print(packageList.length);

    return packageList;


  }

}