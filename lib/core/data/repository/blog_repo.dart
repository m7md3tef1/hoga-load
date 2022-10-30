

import '../api/api.dart';
import '../models/blogs/blogs.dart';

class BlogRepo{
  static Future< List <Blogs>>  getBlogs(token)async{
    var response= await Api().getHttp(url: 'blogs',authToken: token);

    List<Blogs>blogsList=[];
    for(int i =0;i<response['records'].length;i++){
      Blogs blogModel=Blogs.fromJson(response['records'][i]);
      blogsList.add(blogModel);

    }
    print(response.length);
    print(blogsList.length);

    return blogsList;


  }


}