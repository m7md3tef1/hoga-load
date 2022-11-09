part of '../view.dart';
class MyTable extends StatelessWidget {
  const MyTable({super.key});

  @override
  Widget build(BuildContext context) {
    return UploadedTableTitle(
      child: BlocConsumer<VehiclesCubit,VehicleStates>(
          listener: (BuildContext context, Object? state) {  },
          builder: (context,state) {
          return ListView.builder(
              itemCount: VehiclesCubit.get(context).myVehicleList.length,

              itemBuilder: (context, index) {
              return Container(
                color: index.isEven ? Colors.grey[300] : Colors.white,
                child: UploadedTableDataRow(
                  origin:"${VehiclesCubit.get(context).myVehicleList[index].originCity!.title??"other"}"
                      " (${VehiclesCubit.get(context).myVehicleList[index].originState!.title??"other"} , "
                      "${VehiclesCubit.get(context).myVehicleList[index].originCountry!.title??"other"}) "
                      " → ""${VehiclesCubit.get(context).myVehicleList[index].destinationCity!.title??"other"}"
                      " (${VehiclesCubit.get(context).myVehicleList[index].destinationState!.title??"other"} , "
                      "${VehiclesCubit.get(context).myVehicleList[index].destinationCountry!.title??"other"}) ",
                  editFunc:(){
                    MagicRouter.navigateTo( AddVehiclesView(isEdit: true,vehiclesModel:
                    VehiclesCubit.get(context).myVehicleList[index],index:index));
                    //VehiclesCubit.get(context).editVehicleCubit(context:context,vehicleId:VehiclesCubit.get(context).vehicleList[index].id);

                  } ,
                  deleteFunc:(){
                    VehiclesCubit.get(context).deleteVehicleCubit(VehiclesCubit.get(context).myVehicleList[index].id);
                  } ,
                  tableWeight:"${VehiclesCubit.get(context).myVehicleList[index].weight}" ,
                  tableNumber: "${index+1}",
                ),
              );
            }
          );
        }
      ),
    );
  }
}
