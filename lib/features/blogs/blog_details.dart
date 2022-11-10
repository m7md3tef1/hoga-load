import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/core/color_manager/color_manager.dart';
import 'package:hoga_load/features/auth/units/customer_button.dart';
import 'package:hoga_load/features/auth/units/customer_text_field.dart';
import 'package:hoga_load/features/blogs/bloc/blog_cubit.dart';
import 'package:hoga_load/widgets/widgets/custom_container_blog.dart';
import 'package:hoga_load/widgets/widgets/custom_text.dart';

import '../../core/data/models/blogs/blogs.dart';
class BlogDetails extends StatelessWidget {
  TextEditingController comment=TextEditingController();
  TextEditingController website=TextEditingController();

  final Blogs? blogs;
   BlogDetails({super.key,this.blogs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: CustomContainerBlog(blogs!,

          widgetDetails:
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        CustomText(text: blogs!.blogCategory!,fontWeight: FontWeight.normal,)
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top:25.0),
                    child: CustomText(text: 'Leave a Reply',color: ColorManager.darkGrey,fontSize: 18.sp,
                      align: TextAlign.start,),
                  ),
                ),
                CustomTextFormField(
                  hintText: 'Your WebSite (optional)',
                  controller: website,
                ),
                CustomTextFormField(
                  hintText: 'Yout Comment (required)',
                  controller: comment,
                ),
                CustomButton(text: 'Send', function: ()async{
                 await  BlogsCubit.get(context).addComment(comment.text,blogs!.id,website: website.text);
                 Navigator.pop(context);
                })


              ],
            ),
          )

          ),
      ),
    );
  }
}
