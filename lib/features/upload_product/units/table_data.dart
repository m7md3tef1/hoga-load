import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/features/search_product/cubit/getProduct_cubit.dart';
import 'package:hoga_load/features/upload_product/add_view.dart';
import 'package:hoga_load/features/upload_product/units/table_product_title.dart';
import '../../../core/color_manager/color_manager.dart';
import '../../../core/dialoges/delete_dialoge.dart';
import '../../../core/router/router.dart';
import '../../../widgets/widgets/custom_text.dart';
class MyProductTable extends StatelessWidget {
  const MyProductTable({super.key});

  @override
  Widget build(BuildContext context) {
    return UploadedTableProduct(
      child:  ListView.builder(
                itemCount: ProductsCubit.get(context).myProductList.length,

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
                              text: ProductsCubit.get(context).myProductList[index].productName,
                              align: TextAlign.start,
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(
                            flex:2,
                            child: CustomText(
                              text: ProductsCubit.get(context).myProductList[index].productType!.title,
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
                                      MagicRouter.navigateTo( AddProductsView(isEdit: true,productModel:
                                      ProductsCubit.get(context).myProductList[index],index:index));
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
                                    print('id');
                                    print(ProductsCubit.get(context).myProductList[index].id);
                                    showDialog(context: context, builder:(context)=> DeleteEditDialog(function: (){

                                      ProductsCubit.get(context).deleteProductCubit(
                                          ProductsCubit.get(context).myProductList[index].id);

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