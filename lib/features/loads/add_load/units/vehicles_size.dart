//part of '../add_load_view.dart';

//class VehiclesSize extends StatelessWidget {
//  bool value4 = false;
//
//  VehiclesSize({super.key});
//  @override
//  Widget build(BuildContext context) {
//    return Column(children: [
//      SizedBox(
//        width: 1.sw,
//        child: const Divider(
//          thickness: 1,
//        ),
//      ),
//      Column(
//        children: [
//          Row(
//            children: [
//              CustomText(
//                text: '  VEHICLE SIZES',
//                fontSize: 14.sp,
//                fontWeight: FontWeight.w600,
//              )
//            ],
//          ),
//          SizedBox(
//            height: 14.h,
//          ),
//          SizedBox(
//            child: GridView.builder(
//              shrinkWrap: true,
//              physics: const NeverScrollableScrollPhysics(),
//              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                  crossAxisCount: 2, childAspectRatio: 5),
//              itemCount: VehiclesCubit.get(context).vehicleSizeList.length,
//              itemBuilder: (BuildContext context, int index) {
//                return CustomCheckBox(
//                    value: value4,
//                    text: VehiclesCubit.get(context).vehicleSizeList[index].title);
//              },
//            ),
//          ),
//        ],
//      )
//    ]);
//  }
//}
