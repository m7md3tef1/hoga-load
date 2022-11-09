import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/features/jobs/upload_jop/units/table_jop_title.dart';
import 'package:hoga_load/features/search_product/cubit/getProduct_cubit.dart';
import 'package:hoga_load/features/upload_product/add_view.dart';
import '../../../../core/color_manager/color_manager.dart';
import '../../../../core/dialoges/delete_dialoge.dart';
import '../../../../core/router/router.dart';
import '../../../../widgets/widgets/custom_text.dart';
import '../../cubit/getJop_cubit.dart';
import '../add_view.dart';

class MyJopTable extends StatelessWidget {
  const MyJopTable({super.key});

  @override
  Widget build(BuildContext context) {
    return uploadedTableJop(
      child:  ListView.builder(
                itemCount: JopCubit.get(context).myJopList.length,

                itemBuilder: (context, index) {
                  return Container(
                    color: index.isEven ? Colors.grey[300] : Colors.white,
                    child: Padding(
                      padding:  const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: CustomText(
                              text:'${index+1}',
                              align: TextAlign.start,
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: CustomText(
                              text: JopCubit.get(context).myJopList[index].category!.title,
                              align: TextAlign.start,
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(
                            flex:2,
                            child: CustomText(
                              text:( '${JopCubit.get(context).myJopList[index].state!.title}→ ${JopCubit.get(context).myJopList[index].city!.title}'),
                              align: TextAlign.start,
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(
                            flex:2,
                            child: CustomText(
                              text:( '${JopCubit.get(context).myJopList[index].category!.title}${JopCubit.get(context).myJopList[index].jobType!.title}'),
                              align: TextAlign.start,
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(
                            flex:2,
                            child: Row(
                              children: [
                                InkWell(
                                  onTap:(){
                                    showDialog(context: context, builder:(context)=> DeleteEditDialog(function: (){
                                      Navigator.pop(context);
                                      MagicRouter.navigateTo( AddJopView(isEdit: true,productModel:
                                      JopCubit.get(context).myJopList[index],index:index));
                                    },btnText: 'Edit',));

                                  },
                                  child: CustomText(
                                    text: 'Edit',
                                    align: TextAlign.start,
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.w200,
                                    color: ColorManager.primaryColor,
                                  ),
                                ),
                                SizedBox(width: 5.sp,),
                                InkWell(
                                  onTap:(){
                                    showDialog(context: context, builder:(context)=> DeleteEditDialog(function: (){

                                      JopCubit.get(context).deleteJopCubit(JopCubit.get(context).myJopList[index].id);

                                    },btnText: 'Delete',));
                                  },
                                  child: CustomText(
                                    text: 'Delete',
                                    align: TextAlign.start,
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.red,
                                  ),
                                ),

                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  );
                }
            )

    );
  }
}