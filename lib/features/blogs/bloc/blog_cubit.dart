import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/data/models/blogs/blogs.dart';
import '../../../core/data/repository/blog_repo.dart';
import 'blog_states.dart';

class BlogsCubit  extends Cubit<BlogsState> {
  BlogsCubit() : super(BlogLoading());

  static BlogsCubit get(context) => BlocProvider.of(context);
  Connectivity connectivity =  Connectivity();
  List<Blogs>searchList=[];
  List<Blogs>blogList=[];
  getBlogsCubit(token){
    print(token);
    connectivity.checkConnectivity().then((value)async{
      if(ConnectivityResult.none == value){
        emit(NetworkFailed("Check your internet connection and try again"));
      }else{
        BlogRepo.getBlogs(token).then((value) => {
          print('..................................'),
          blogList=value,
          print("this value--------Blog"),
          print(value),
        //  print(value[1].title),
          emit(GetBlogSuccess(value))
        }).onError((error, stackTrace) => {
          emit(GetBlogFailed(error.toString())),
          print(error)

        });
      }

    });
  }

  getBlogCategory(){

  }
  searchBlogs(val,context) {
    searchList.clear();
    BlogsCubit.get(context).blogList.forEach((i) {
      if(i.title!.toLowerCase().contains(val)||i.title!.contains(val)){
        searchList.add(i);
      }
      else{
        null;

      }

      if(searchList!=null||searchList.length!=0){
        emit(GetSearchSuccess(searchList));

      }else{
        emit(GetSearchFailed('list is empty'));

      }
    });
  }

}