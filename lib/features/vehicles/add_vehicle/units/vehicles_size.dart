part of'../view.dart';

class VehiclesSize extends StatefulWidget {
  Vehicles? vehiclesModel;
  bool? isEdit;
  VehiclesSize({super.key, this.vehiclesModel, this.isEdit = false});

  @override
  State<VehiclesSize> createState() => _VehiclesSizeState();
}

class _VehiclesSizeState extends State<VehiclesSize> {
  bool value4 = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        width: 1.sw,
        child: const Divider(
          thickness: 1,
        ),
      ),
      Column(
        children: [
          Row(
            children: [
              CustomText(
                text: '  VEHICLE SIZES',
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
              itemCount: VehiclesCubit.get(context).vehicleSizeList.length,
              itemBuilder: (BuildContext context, int index) {
                widget.isEdit! &&
                        widget.vehiclesModel!.vehicleSizes2!.contains(
                            VehiclesCubit.get(context)
                                .vehicleSizeList[index]
                                .title)
                    ? VehiclesCubit.get(context).vehcleSize.add(
                        VehiclesCubit.get(context)
                            .vehicleSizeList[index]
                            .id!
                            .toString())
                    : null;
                return CustomCheckBox(
                    index: index,
                    boxKey: MasterKeys.vehicleSize.name,
                    // value: VehiclesCubit.get(context).vehcleSizeBoxValue![index],
                    value: widget.isEdit!
                        ? widget.vehiclesModel!.vehicleSizes2!.contains(
                                VehiclesCubit.get(context)
                                    .vehicleSizeList[index]
                                    .title)
                            ? true
                            : value4
                        : value4,
                    text: VehiclesCubit.get(context)
                        .vehicleSizeList[index]
                        .title);
              },
            ),
          ),
        ],
      )
    ]);
  }
}
