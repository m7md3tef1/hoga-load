import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/data/local/cacheHelper.dart';
import '../../../core/data/models/blogs/blogs.dart';
import '../../../core/data/repository/blog_repo.dart';
import '../../../core/dialoges/toast.dart';
import '../../../core/keys/keys.dart';
import 'blog_states.dart';

class BlogsCubit extends Cubit<BlogsState> {
  BlogsCubit() : super(BlogLoading());

  static BlogsCubit get(context) => BlocProvider.of(context);
  Connectivity connectivity = Connectivity();
  List<Blogs> searchList = [];
  List<Blogs> blogList = [];
  getBlogsCubit(token) {
    print(token);
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        BlogRepo.getBlogs(token)
            .then((value) => {
                  print('..................................'),
                  blogList = value,
                  print("this value--------Blog"),
                  print(value),
                  //  print(value[1].title),
                  emit(GetBlogSuccess(value))
                })
            .onError((error, stackTrace) =>
                {emit(GetBlogFailed(error.toString())), print(error)});
      }
    });
  }

  addComment(comment, id, {website}) {
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
        showToast(
            msg: "Check your internet connection and try again",
            state: ToastedStates.ERROR);
      } else {
        BlogRepo.addComment(comment: comment, website: website, id: id)
            .then((value) => {
                  print('Add  Success'),
                  print(value),
                  emit(AddSuccess()),
                  showToast(msg: 'Add Success', state: ToastedStates.SUCCESS),
                })
            .catchError((error) => {
                  emit(AddFailed()),
                  print('Add  Failed'),
                  print(error),
                  showToast(msg: error.toString(), state: ToastedStates.ERROR),
                });
      }
    });
  }

  searchBlogs(val) async {
    String token = await CacheHelper.getString(SharedKeys.token);
    searchList.clear();
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        BlogRepo.searchBlogs(token, val)
            .then((value) => {
                  print('..................................'),
                  searchList = value,
                  print("this value--------SearchBlog"),
                  print(value),
                  if (searchList != null || searchList.length != 0)
                    {
                      emit(GetSearchSuccess(searchList)),
                    }
                  else
                    {emit(GetSearchFailed('list is empty'))}
                })
            .catchError((error, stackTrace) => {
                  emit(GetSearchFailed(error.toString())),
                  print(stackTrace),
                  print(error)
                });
      }
    });
  }
}
