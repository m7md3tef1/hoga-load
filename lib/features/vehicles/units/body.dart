part of '../view.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VehiclesCubit, AddVehicleStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetSearchFailed) {
            return Center(child: CustomText(text: state.msg));
          } else if (state is GetSearchSuccess) {
            return Container(
              height: .9.sh,
              width: 1.sw,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: DataTable2(
                    columnSpacing: 1,
                    horizontalMargin: 0,
                    dataRowHeight:
                        state.vehicleList.length <= 10 ? .06.sh : .11.sh,
                    minWidth: 890,
                    columns: const [
                      DataColumn2(
                        label: Center(child: Text('Available')),
                        size: ColumnSize.L,
                      ),
                      DataColumn(
                        label: Center(child: Text('Origin')),
                      ),
                      DataColumn(
                        label: Center(child: Text('State')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Destination')),
                      ),
                      DataColumn(
                        label: Center(child: Text('State')),
                      ),
                      DataColumn2(
                        label: Center(child: Text('Type')),
                        size: ColumnSize.L,
                      ),
                      DataColumn(
                        label: Center(child: Text('Size')),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                        state.vehicleList.length,
                        (index)

                        {final vehicle = state.vehicleList[index];
                             return DataRow(
                                  color: MaterialStateColor.resolveWith(
                                      (states) => index.isEven
                                          ? const Color(0xFFE0E0E0)
                                          : Colors.white),
                                  cells: [
                                    DataCell(InkWell(
                                      onTap: () {
                                        MagicRouter.navigateTo(
                                            VehicleDetail(vehicle));
                                      },
                                      child: Center(
                                          child: Text(VehiclesCubit.get(context)
                                              .vehicleList[index]
                                              .availabilityDate!)),
                                    )),
                                    DataCell(Center(
                                        child: Text(state.vehicleList[index]
                                            .originCountry!.title!))),
                                    DataCell(Center(
                                        child: Text(state.vehicleList[index]
                                            .originState!.title!))),
                                    DataCell(Center(
                                        child: Text(state.vehicleList[index]
                                                    .destinationCity ==
                                                null
                                            ? 'other'
                                            : state.vehicleList[index]
                                                .destinationCity!.title!))),
                                    DataCell(Center(
                                        child: Text(state.vehicleList[index]
                                            .destinationState!.title!))),
                                    DataCell(Center(
                                        child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16.0),
                                      child: Center(
                                        child: ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: state.vehicleList[index]
                                                .equipmentTypes?.length,
                                            itemBuilder: (context, i) => Center(
                                                child: Text(state
                                                    .vehicleList[index]
                                                    .equipmentTypes![i]
                                                    .title
                                                    .toString()))),
                                      ),
                                    ))),
                                    DataCell(Center(
                                        child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16.0),
                                      child: Center(
                                        child: ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: state.vehicleList[index]
                                                .vehicleSizes?.length,
                                            itemBuilder: (context, i) => Center(
                                                child: Text(state
                                                    .vehicleList[index]
                                                    .vehicleSizes![i]
                                                    .title
                                                    .toString()))),
                                      ),
                                    ))),
                                  ]);
                            })),
              ),
            );
          } else if (state is AddVehicleLoading) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Center(
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                ),
              ],
            );
          } else if (state is GetVehicleSuccess) {
            return Container(
              height: .9.sh,
              width: 1.sw,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: DataTable2(
                    columnSpacing: 1,
                    horizontalMargin: 0,
                    dataRowHeight:
                    state.vehicleList.length <= 10 ? .06.sh : .11.sh,
                    minWidth: 890,
                    columns: const [
                      DataColumn2(
                        label: Center(child: Text('Available')),
                        size: ColumnSize.L,
                      ),
                      DataColumn(
                        label: Center(child: Text('Origin')),
                      ),
                      DataColumn(
                        label: Center(child: Text('State')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Destination')),
                      ),
                      DataColumn(
                        label: Center(child: Text('State')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Type')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Size')),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                        VehiclesCubit.get(context).vehicleList.length, (index) {
                      final vehicle = state.vehicleList[index];
                      return DataRow(
                          color: MaterialStateColor.resolveWith((states) =>
                              index.isEven
                                  ? const Color(0xFFE0E0E0)
                                  : Colors.white),

                          cells: [
                            DataCell(InkWell(
                              onTap:(){
                                MagicRouter.navigateTo(VehicleDetail(vehicle));
                              },
                              child: Center(
                                  child: Text(VehiclesCubit.get(context)
                                      .vehicleList[index]
                                      .availabilityDate!)),
                            )),
                            DataCell(Center(
                                child: Text(VehiclesCubit.get(context)
                                    .vehicleList[index]
                                    .originCountry!
                                    .title!))),
                            DataCell(Center(
                                child: Text(VehiclesCubit.get(context)
                                    .vehicleList[index]
                                    .originState!
                                    .title!))),
                            DataCell(Center(
                                child: Text(VehiclesCubit.get(context)
                                            .vehicleList[index]
                                            .destinationCity ==
                                        null
                                    ? 'other'
                                    : VehiclesCubit.get(context)
                                        .vehicleList[index]
                                        .destinationCity!
                                        .title!))),
                            DataCell(Center(
                                child: Text(VehiclesCubit.get(context)
                                    .vehicleList[index]
                                    .destinationState!
                                    .title!))),
                            DataCell(Center(
                                child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: Center(
                                child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: VehiclesCubit.get(context)
                                        .vehicleList[index]
                                        .equipmentTypes
                                        ?.length,
                                    itemBuilder: (context, i) => Center(
                                        child: Text(VehiclesCubit.get(context)
                                            .vehicleList[index]
                                            .equipmentTypes![i]
                                            .title
                                            .toString()))),
                              ),
                            ))),
                            DataCell(Center(
                                child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: Center(
                                child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: VehiclesCubit.get(context)
                                        .vehicleList[index]
                                        .vehicleSizes
                                        ?.length,
                                    itemBuilder: (context, i) => Center(
                                        child: Text(VehiclesCubit.get(context)
                                            .vehicleList[index]
                                            .vehicleSizes![i]
                                            .title
                                            .toString()))),
                              ),
                            ))),
                          ]);
                    })),
              ),
            );
          } else {
            return Container(
              height: .9.sh,
              width: 1.sw,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: DataTable2(
                    columnSpacing: 1,
                    horizontalMargin: 0,
                    dataRowHeight:

                        VehiclesCubit.get(context).vehicleList.length >= 10
                            ? .06.sh
                            : .11.sh,
                    minWidth: 890,
                    columns: const [
                      DataColumn2(
                        label: Center(child: Text('Available')),
                        size: ColumnSize.L,
                      ),
                      DataColumn(
                        label: Center(child: Text('Origin')),
                      ),
                      DataColumn(
                        label: Center(child: Text('State')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Destination')),
                      ),
                      DataColumn(
                        label: Center(child: Text('State')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Type')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Size')),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                        VehiclesCubit.get(context).vehicleList.length,
                        (index) => DataRow(
                                color: MaterialStateColor.resolveWith(
                                    (states) => index.isEven
                                        ? const Color(0xFFE0E0E0)
                                        : Colors.white),
                                cells: [
                                  DataCell(Center(
                                      child: Text(VehiclesCubit.get(context)
                                          .vehicleList[index]
                                          .availabilityDate!))),
                                  DataCell(Center(
                                      child: Text(VehiclesCubit.get(context)
                                          .vehicleList[index]
                                          .originCountry!
                                          .title!))),
                                  DataCell(Center(
                                      child: Text(VehiclesCubit.get(context)
                                          .vehicleList[index]
                                          .originState!
                                          .title!))),
                                  DataCell(Center(
                                      child: Text(VehiclesCubit.get(context)
                                                  .vehicleList[index]
                                                  .destinationCity ==
                                              null
                                          ? 'other'
                                          : VehiclesCubit.get(context)
                                              .vehicleList[index]
                                              .destinationCity!
                                              .title!))),
                                  DataCell(Center(
                                      child: Text(VehiclesCubit.get(context)
                                          .vehicleList[index]
                                          .destinationState!
                                          .title!))),
                                  DataCell(Center(
                                      child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 16.sp),
                                    child: Center(
                                      child: ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: VehiclesCubit.get(context)
                                              .vehicleList[index]
                                              .equipmentTypes
                                              ?.length,
                                          itemBuilder: (context, i) => Center(
                                              child: Text(
                                                  VehiclesCubit.get(context)
                                                      .vehicleList[index]
                                                      .equipmentTypes![i]
                                                      .title
                                                      .toString()))),
                                    ),
                                  ))),
                                  DataCell(Center(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: Center(
                                      child: ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: VehiclesCubit.get(context)
                                              .vehicleList[index]
                                              .vehicleSizes
                                              ?.length,
                                          itemBuilder: (context, i) => Center(
                                              child: Text(VehiclesCubit.get(
                                                              context)
                                                          .vehicleList[index]
                                                          .vehicleSizes ==
                                                      null
                                                  ? 'other'
                                                  : VehiclesCubit.get(context)
                                                      .vehicleList[index]
                                                      .vehicleSizes![i]
                                                      .title!))),
                                    ),
                                  ))),
                                ]))),
              ),
            );
          }
        });
  }
}
