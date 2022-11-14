//part of '../add_load_view.dart';
//class Instructions extends StatelessWidget {
//  const Instructions({super.key});
//
//  @override
//  Widget build(BuildContext context) {
//    return Column(
//      children: [
//        SizedBox(
//          width: 1.sw,
//          child: const Divider(thickness: 1,),),
//        CustomTextField(
//          height: 64.h,
//          hintText: 'Weight ( in Kilogram )',
//          controller: LoadsCubit.get(context).weightController,
//
//          suffixIcon: Icon(
//            Icons.expand_more,
//            size: 30.sp,
//            color: ColorManager.blackColor,
//          ),
//        ),
//        CustomTextField(
//          height: 147.h,
//          lines: 4,
//          hintText: 'Instructions',
//          controller: LoadsCubit.get(context).instructionsController,
//        ),
//        SizedBox(
//          height: 23.h,
//        ),
//        CustomButton(text: 'Add new load', color: ColorManager.yellow),      ],
//    );
//  }
//}
