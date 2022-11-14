part of'../view.dart';

class MyTable extends StatelessWidget {
  const MyTable({super.key});

  @override
  Widget build(BuildContext context) {
    return UploadedTableTitle(

      child: BlocConsumer<VehiclesCubit, VehicleStates>(
          listener: (BuildContext context, Object? state) {},
          builder: (context, state) {
            return ListView.builder(
                itemCount: VehiclesCubit.get(context).myVehicleList.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: index.isEven ? Colors.grey[300] : Colors.white,
                    child: UploadedTableDataRow(
                      origin:
                          "${VehiclesCubit.get(context).myVehicleList[index].originCity == null ? "other" : VehiclesCubit.get(context).myVehicleList[index].originCity!.title}"
                          " (${VehiclesCubit.get(context).myVehicleList[index].originState == null ? "other" : VehiclesCubit.get(context).myVehicleList[index].originState!.title} , "
                          "${VehiclesCubit.get(context).myVehicleList[index].originCountry == null ? "other" : VehiclesCubit.get(context).myVehicleList[index].originCountry!.title}) "
                          " → "
                          "${VehiclesCubit.get(context).myVehicleList[index].destinationCity == null ? "other" : VehiclesCubit.get(context).myVehicleList[index].destinationCity!.title}"
                          " (${VehiclesCubit.get(context).myVehicleList[index].destinationState == null ? "other" : VehiclesCubit.get(context).myVehicleList[index].destinationState!.title} , "
                          "${VehiclesCubit.get(context).myVehicleList[index].destinationCountry == null ? "other" : VehiclesCubit.get(context).myVehicleList[index].destinationCountry!.title}) ",
                      editFunc: () {
                        MagicRouter.navigateTo(AddVehiclesView(
                            isEdit: true,
                            vehiclesModel:
                                VehiclesCubit.get(context).myVehicleList[index],
                            index: index));
                        //VehiclesCubit.get(context).editVehicleCubit(context:context,vehicleId:VehiclesCubit.get(context).vehicleList[index].id);
                      },
                      deleteFunc: () {
                        VehiclesCubit.get(context).deleteVehicleCubit(
                            VehiclesCubit.get(context).myVehicleList[index].id);
                      },
                      tableWeight:
                          "${VehiclesCubit.get(context).myVehicleList[index].weight}",
                      tableNumber: "${index + 1}",
                    ),
                  );
                });
          }),

    );
  }
}
