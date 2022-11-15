part of'../view.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);
  List titlesList = [
    'Available',
    'Origin',
    'State',
    'Destination',
    'State',
    'Type',
    'Size'
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(children: [
        Container(
          height: 0.7.sh,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                    child: Container(
                      height: 43.h,
                      width: 0.2.sw * 7,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15))),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: 0.2.sw,
                              child: CustomText(
                                text: titlesList[index],
                                fontSize: 9.sp,
                                align: TextAlign.center,
                                fontWeight: FontWeight.w700,
                              ),
                            );
                          }),
                    ),
                  ),
                  Container(
                    height: 0.6.sh,
                    width: 0.2.sw * 7,
                    child: BlocConsumer<VehiclesCubit, VehicleStates>(
                      builder: (context, state) {
                        if (state is GetSearchFailed) {
                          return Center(
                              child: CustomText(
                            text: state.msg,
                            fontSize: 30,
                          ));
                        } else if (state is GetSearchSuccess) {
                          return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.vehicleList.length,
                              itemBuilder: (context, index) {
                                print(state.vehicleList[index].equipmentTypes2!
                                    .toString());
                                final vehicle = state.vehicleList[index];
                                return Container(
                                  color: index.isEven
                                      ? Colors.grey[300]
                                      : Colors.white,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: InkWell(
                                      onTap: () {
                                        MagicRouter.navigateTo(Detail(vehicle));
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            width: 0.2.sw,
                                            text: state.vehicleList[index]
                                                .availabilityDate,
                                            align: TextAlign.center,
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          CustomText(
//                                height: 20.h,o
                                              width: 0.2.sw,
                                              text: state.vehicleList[index]
                                                          .originCity ==
                                                      null
                                                  ? 'other'
                                                  : state.vehicleList[index]
                                                      .originCity!.title,
                                              //   text: '',

                                              align: TextAlign.center,
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w500),
                                          CustomText(
//                                  height: 20.h,
                                              width: 0.2.sw,
                                              text: state.vehicleList[index]
                                                          .originState ==
                                                      null
                                                  ? 'other'
                                                  : state.vehicleList[index]
                                                      .originState!.title,
                                              align: TextAlign.center,
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w500),
                                          CustomText(
                                              width: 0.2.sw,
                                              text: state.vehicleList[index]
                                                          .destinationCity ==
                                                      null
                                                  ? 'other'
                                                  : state.vehicleList[index]
                                                      .destinationCity!.title,
                                              fontSize: 8.sp,
                                              align: TextAlign.center,
                                              fontWeight: FontWeight.w500),
                                          CustomText(
                                              width: 0.2.sw,
//                                  height: 20.h,
                                              text: state.vehicleList[index]
                                                          .destinationState ==
                                                      null
                                                  ? 'other'
                                                  : state.vehicleList[index]
                                                      .destinationState!.title,
                                              align: TextAlign.center,
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w500),
                                          CustomText(
//                                  height: 30.h,
                                              width: 0.2.sw,
                                              text: state.vehicleList[index]
                                                      .equipmentTypes2!.isEmpty
                                                  ? 'other'
                                                  : state.vehicleList[index]
                                                      .equipmentTypes2!
                                                      .toString(),
                                              align: TextAlign.center,
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w500),
                                          CustomText(
                                              width: 0.2.sw,
//                                  height: 20.h,
                                              text: state.vehicleList[index]
                                                      .vehicleSizes2!.isEmpty
                                                  ? 'other'
                                                  : state.vehicleList[index]
                                                      .vehicleSizes2!
                                                      .toString(),
                                              align: TextAlign.center,
                                              color: Colors.green,
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w500),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        } else if (state is GetVehicleSuccess) {
                          return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.vehicleList.length,
                              itemBuilder: (context, index) {
                                print('this');
                                print(state.vehicleList[index].equipmentTypes2!
                                    .toString());
                                print('nnnnnnnnnnnnn');
                                final vehicle = state.vehicleList[index];
                                return Container(
                                  color: index.isEven
                                      ? Colors.grey[300]
                                      : Colors.white,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: InkWell(
                                      onTap: () {
                                        MagicRouter.navigateTo(Detail(vehicle));
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            width: 0.2.sw,
                                            text: state.vehicleList[index]
                                                .availabilityDate,
                                            align: TextAlign.center,
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          CustomText(
//                                height: 20.h,o
                                              width: 0.2.sw,
                                              text: state.vehicleList[index]
                                                          .originCity ==
                                                      null
                                                  ? 'other'
                                                  : state.vehicleList[index]
                                                      .originCity!.title,
                                              align: TextAlign.center,
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w500),
                                          CustomText(
//                                  height: 20.h,
                                              width: 0.2.sw,
                                              text: state.vehicleList[index]
                                                          .originState ==
                                                      null
                                                  ? 'other'
                                                  : state.vehicleList[index]
                                                      .originState!.title,
                                              align: TextAlign.center,
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w500),
                                          CustomText(
                                              width: 0.2.sw,
                                              text: state.vehicleList[index]
                                                          .destinationCity ==
                                                      null
                                                  ? 'other'
                                                  : state.vehicleList[index]
                                                      .destinationCity!.title,
                                              fontSize: 8.sp,
                                              align: TextAlign.center,
                                              fontWeight: FontWeight.w500),
                                          CustomText(
                                              width: 0.2.sw,
//                                  height: 20.h,
                                              text: state.vehicleList[index]
                                                          .destinationState ==
                                                      null
                                                  ? 'other'
                                                  : state.vehicleList[index]
                                                      .destinationState!.title,
                                              align: TextAlign.center,
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w500),
                                          CustomText(
//                                  height: 30.h,
                                              width: 0.2.sw,
                                              text: state.vehicleList[index]
                                                      .equipmentTypes2!.isEmpty
                                                  ? 'other'
                                                  : state.vehicleList[index]
                                                      .equipmentTypes2!
                                                      .toString(),
                                              align: TextAlign.center,
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w500),
                                          CustomText(
                                              width: 0.2.sw,
//                                  height: 20.h,
                                              text: state.vehicleList[index]
                                                      .equipmentTypes2!.isEmpty
                                                  ? 'other'
                                                  : state.vehicleList[index]
                                                      .equipmentTypes2!
                                                      .toString(),
                                              align: TextAlign.center,
                                              color: Colors.green,
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w500),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        } else if (state is VehicleLoading) {
                          return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                print('loading');

                                return Container(
                                  color: index.isEven
                                      ? Colors.grey[300]
                                      : Colors.white,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: InkWell(
                                      onTap: () {},
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Shimmer.fromColors(
                                              enabled: true,
                                              baseColor: Colors.grey[300]!,
                                              highlightColor: Colors.grey[400]!,
                                              child: Container(
                                                  width: 0.2.sw,
                                                  height: 12.sp,
                                                  color: Colors.grey[300]),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Shimmer.fromColors(
                                                enabled: true,
                                                baseColor: Colors.grey[300]!,
                                                highlightColor:
                                                    Colors.grey[400]!,
                                                child: Container(
                                                    width: 0.2.sw,
                                                    height: 12.sp,
                                                    color: Colors.grey[300])),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Shimmer.fromColors(
                                                enabled: true,
                                                baseColor: Colors.grey[300]!,
                                                highlightColor:
                                                    Colors.grey[400]!,
                                                child: Container(
                                                    width: 0.2.sw,
                                                    height: 12.sp,
                                                    color: Colors.grey[300])),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Shimmer.fromColors(
                                                enabled: true,
                                                baseColor: Colors.grey[300]!,
                                                highlightColor:
                                                    Colors.grey[400]!,
                                                child: Container(
                                                    width: 0.2.sw,
                                                    height: 12.sp,
                                                    color: Colors.grey[300])),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Shimmer.fromColors(
                                                enabled: true,
                                                baseColor: Colors.grey[300]!,
                                                highlightColor:
                                                    Colors.grey[400]!,
                                                child: Container(
                                                    width: 0.2.sw,
                                                    height: 12.sp,
                                                    color: Colors.grey[300])),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        } else {
                          return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  VehiclesCubit.get(context).vehicleList.length,
                              itemBuilder: (context, index) {
                                print(VehiclesCubit.get(context)
                                    .vehicleList[index]
                                    .equipmentTypes2!
                                    .toString());

                                return Container(
                                  color: index.isEven
                                      ? Colors.grey[300]
                                      : Colors.white,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: InkWell(
                                      onTap: () {
                                        MagicRouter.navigateTo(Detail(
                                            VehiclesCubit.get(context)
                                                .vehicleList[index]));
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            width: 0.2.sw,
                                            text: VehiclesCubit.get(context)
                                                .vehicleList[index]
                                                .availabilityDate,
                                            align: TextAlign.center,
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          CustomText(
//                                height: 20.h,o
                                              width: 0.2.sw,
                                              text: VehiclesCubit.get(context)
                                                          .vehicleList[index]
                                                          .originCity ==
                                                      null
                                                  ? 'other'
                                                  : VehiclesCubit.get(context)
                                                      .vehicleList[index]
                                                      .originCity!
                                                      .title,
                                              //   text: '',

                                              align: TextAlign.center,
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w500),
                                          CustomText(
//                                  height: 20.h,
                                              width: 0.2.sw,
                                              text: VehiclesCubit.get(context)
                                                          .vehicleList[index]
                                                          .originState ==
                                                      null
                                                  ? 'other'
                                                  : VehiclesCubit.get(context)
                                                      .vehicleList[index]
                                                      .originState!
                                                      .title,
                                              align: TextAlign.center,
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w500),
                                          CustomText(
                                              width: 0.2.sw,
                                              text: VehiclesCubit.get(context)
                                                          .vehicleList[index]
                                                          .destinationCity ==
                                                      null
                                                  ? 'other'
                                                  : VehiclesCubit.get(context)
                                                      .vehicleList[index]
                                                      .destinationCity!
                                                      .title,
                                              fontSize: 8.sp,
                                              align: TextAlign.center,
                                              fontWeight: FontWeight.w500),
                                          CustomText(
                                              width: 0.2.sw,
//                                  height: 20.h,
                                              text: VehiclesCubit.get(context)
                                                          .vehicleList[index]
                                                          .destinationState ==
                                                      null
                                                  ? 'other'
                                                  : VehiclesCubit.get(context)
                                                      .vehicleList[index]
                                                      .destinationState!
                                                      .title,
                                              align: TextAlign.center,
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w500),
                                          CustomText(
//                                  height: 30.h,
                                              width: 0.2.sw,
                                              text: VehiclesCubit.get(context)
                                                      .vehicleList[index]
                                                      .equipmentTypes2!
                                                      .isEmpty
                                                  ? 'other'
                                                  : VehiclesCubit.get(context)
                                                      .vehicleList[index]
                                                      .equipmentTypes2!
                                                      .toString(),
                                              align: TextAlign.center,
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w500),
                                          CustomText(
                                              width: 0.2.sw,
//                                  height: 20.h,
                                              text: VehiclesCubit.get(context)
                                                      .vehicleList[index]
                                                      .vehicleSizes2!
                                                      .isEmpty
                                                  ? 'other'
                                                  : VehiclesCubit.get(context)
                                                      .vehicleList[index]
                                                      .vehicleSizes2!
                                                      .toString(),
                                              align: TextAlign.center,
                                              color: Colors.green,
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w500),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        }
                      },
                      listener: (BuildContext context, Object? state) {},
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
