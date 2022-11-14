//part of '../add_load_view.dart';

//class Attributes extends StatelessWidget {
//  bool value2=false;
//  @override
//  Widget build(BuildContext context) {
//    return Column(children: [
//      SizedBox(
//        width: 1.sw,
//        child: const Divider(thickness: 1,),),
//      Column(
//        children: [
//          Row(
//            children: [
//              CustomText(text: '  ATTRIBUTES', fontSize: 14.sp,fontWeight: FontWeight.w600,)
//            ],
//          ),
//          SizedBox(height: 14.h,),
//          SizedBox(
//            child: GridView.builder(
//              shrinkWrap: true,
//              physics: const NeverScrollableScrollPhysics(),
//              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                  crossAxisCount: 2, childAspectRatio: 5),
//              itemCount: VehiclesCubit.get(context).attributesList.length,
//              itemBuilder: (BuildContext context, int index) {
//                return CustomCheckBox(
//                    value: value2,
//                    text: VehiclesCubit.get(context).attributesList[index].title);
//              },
//            ),
//          ),
//        ],
//      ),
//      SizedBox(
//        width: 1.sw,
//        child: const Divider(thickness: 1,),),
//    ],);
//  }
//}
