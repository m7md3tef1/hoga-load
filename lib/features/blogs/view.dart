import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hoga_load/widgets/widgets/custom_appbar.dart';
import 'package:hoga_load/widgets/widgets/custom_container_blog.dart';
import 'package:hoga_load/widgets/widgets/custom_scaffold.dart';

import '../../core/app_images/app_images.dart';
import '../../core/color_manager/color_manager.dart';
import '../../widgets/widgets/custom_row.dart';
import '../../widgets/widgets/custom_text.dart';
import 'bloc/blog_cubit.dart';
import 'bloc/blog_states.dart';

part 'units/body.dart';
class BlogsView extends StatelessWidget {
  const BlogsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BlogsCubit,BlogsState>(
      listener: (context,state){},
      builder:(context,state)=> CustomScaffold(
        body: SafeArea(
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomAppbar(title: 'Blogs',icon: const Icon(Icons.search),),
              const CustomSearchRow2(),
              const Expanded(child: Body()),
            ],
          ),
        ),
      ),
    );
  }
}
class CustomSearchRow2 extends StatelessWidget {
  const CustomSearchRow2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.sp),
      child: Row(
        children: [

          Expanded(
            child: Container(
                height: 50.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: Colors.white),
                child: Center(
                  child: TextFormField(
                    onFieldSubmitted: (val){
                      print('hhhhhhhhhhhhhhhhhhhhhhhhh');
                      print(val);

                      BlogsCubit.get(context).searchBlogs(val, context);

                    },
                    decoration:  InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search_outlined,
                        ),
                        hintText: 'Enter keywords to search',
                        hintStyle: TextStyle(color: ColorManager.lightGrey,fontSize:14.sp ),
                        border: InputBorder.none),
                  ),
                )),
          ),
          SizedBox(width: 10.sp,),
          Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.orangeAccent
            ),
            child: Center(
              child: SvgPicture.asset(AppImages.slider),
            ),
          )
        ],
      ),
    );
  }
}
