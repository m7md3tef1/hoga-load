

import '../../../core/data/models/blogs/blogs.dart';

abstract class BlogsState{}

class BlogLoading extends BlogsState{}

class GetBlogSuccess extends BlogsState{

  final List<Blogs>blogList;
  GetBlogSuccess(this.blogList);
}

class GetBlogFailed extends BlogsState{

  final String msg;
  GetBlogFailed(this.msg);
}
class GetSearchSuccess extends BlogsState{

  List<Blogs>blogList=[];
  GetSearchSuccess(this.blogList);
}

class GetSearchFailed extends BlogsState{

  final String msg;
  GetSearchFailed(this.msg);
}

class NetworkFailed extends BlogsState{

  final String msg;
  NetworkFailed(this.msg);
}
class AddSuccess extends BlogsState{

}
class AddFailed extends BlogsState{

}