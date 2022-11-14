part of '../view.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BlogsCubit, BlogsState>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          if (state is GetSearchFailed) {
            return Center(child: CustomText(text: state.msg));
          }
         else if (state is GetSearchSuccess) {
            return ListView.builder(
                itemCount: state.blogList.length,
                itemBuilder: (context, index) {
                  return CustomContainerBlog(state.blogList[index]);
                });
          }
          else {
            return ListView.builder(
                itemCount: BlogsCubit.get(context).blogList.length,
                itemBuilder: (context, index) {
                  return CustomContainerBlog(BlogsCubit.get(context).blogList[index]);
                });
          }
        }
    );
  }
}