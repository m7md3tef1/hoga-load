//part of '../add_load_view.dart';
//class Equipment extends StatelessWidget {
//  var value=false;
//
//  @override
//  Widget build(BuildContext context) {
//    return Column(
//      children: [
//        Row(
//          children: [
//            CustomText(text: '  EQUIPMENT TYPES', fontSize: 14.sp,fontWeight: FontWeight.w600,)
//          ],
//        ),
//        SizedBox(height: 14.h,),
//        SizedBox(
//          child: GridView.builder(
//            shrinkWrap: true,
//            physics: const NeverScrollableScrollPhysics(),
//            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                crossAxisCount: 2, childAspectRatio: 5),
//            itemCount: VehiclesCubit.get(context).equipmentList.length,
//            itemBuilder: (BuildContext context, int index) {
//              return CustomCheckBox(
//                  value: value,
//                  text: VehiclesCubit.get(context).equipmentList[index].title);
//            },
//          ),
//        ),
//      ],
//    );
//  }
//}
