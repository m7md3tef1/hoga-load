import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/core/color_manager/color_manager.dart';
import 'package:hoga_load/widgets/widgets/custom_container_blog.dart';
import 'package:hoga_load/widgets/widgets/custom_text.dart';

import '../../core/data/models/blogs/blogs.dart';
class BlogDetails extends StatelessWidget {
  final Blogs? blogs;
  const BlogDetails({super.key,this.blogs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomContainerBlog(blogs!,

        widgetDetails:
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20.h,),
              SingleChildScrollView(child: CustomText(text: blogs!.blogContent!,color: ColorManager.darkGrey,)),
              const Padding(
                padding: EdgeInsets.only(top: 25,bottom: 10),
                child: Divider(color: ColorManager.greyColor,thickness: 2,),

              ),
              Row(
                children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(Icons.folder_open,color: ColorManager.primaryColor,),
                      SizedBox(width: 6,),
                      CustomText(text: blogs!.keywords!,fontWeight: FontWeight.normal,)
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Icon(Icons.bookmark_border,color: ColorManager.primaryColor,),
                      SizedBox(width: 6,),
                      CustomText(text: blogs!.keywords!,fontWeight: FontWeight.normal,)
                    ],
                  ),
                ),


              ],),

            ],
          ),
        )

        ),
    );
  }
}
