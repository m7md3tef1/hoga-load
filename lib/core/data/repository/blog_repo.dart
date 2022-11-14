import '../../keys/keys.dart';
import '../api/api.dart';
import '../local/cacheHelper.dart';
import '../models/blogs/blogs.dart';

class BlogRepo {
  static Future<List<Blogs>> getBlogs(token) async {
    var response = await Api().getHttp(url: 'blogs', authToken: token);

    List<Blogs> blogsList = [];
    for (int i = 0; i < response['records'].length; i++) {
      Blogs blogModel = Blogs.fromJson(response['records'][i]);
      blogsList.add(blogModel);
    }
    print(blogsList.length);

    return blogsList;
  }

  static addComment({comment, website, id}) async {
    String token = await CacheHelper.getString(SharedKeys.token);
    return await Api().postHttp(
        url: "comments/blog/upload",
        authToken: token,
        data: {"comment": comment, "website": website, "id": id});
  }

  static Future<List<Blogs>> searchBlogs(token, val) async {
    print("blog repo");
    print(val);
    var response = await Api()
        .getHttp(url: 'blogs', authToken: token, data: {"search": val});
    print(response);
    List<Blogs> blogsList = [];
    for (int i = 0; i < response['records'].length; i++) {
      Blogs blogModel = Blogs.fromJson(response['records'][i]);
      blogsList.add(blogModel);
    }
    print(response.length);
    print(blogsList.length);
    print("blog repo");
    return blogsList;
  }
}
