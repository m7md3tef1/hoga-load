part of'../view.dart';

class VehicleType extends StatelessWidget {
  bool value3 = false;
  Vehicles? vehiclesModel;
  bool? isEdit;
  VehicleType({super.key,this.vehiclesModel,this.isEdit=false});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomText(
              text: '  VEHICLE TYPES',
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            )
          ],
        ),
        SizedBox(
          height: 14.h,
        ),
        SizedBox(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 5),
            itemCount: VehiclesCubit.get(context).vehiclesTypeList.length,
            itemBuilder: (BuildContext context, int index) {
              return CustomCheckBox(
                  index: index,
                  boxKey: MasterKeys.vehicleTypes.name,
                 value:  isEdit!?
                 vehiclesModel!.vehicleTypes2!
                     .contains(VehiclesCubit.get(context).vehiclesTypeList[index].title)
                     ?true:value3: value3,
                 // value: VehiclesCubit.get(context).vehcleTypeBoxValue![index],
                  text:
                      VehiclesCubit.get(context).vehiclesTypeList[index].title);
            },
          ),
        ),
      ],
    );
  }
}
