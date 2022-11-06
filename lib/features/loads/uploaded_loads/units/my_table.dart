part of '../view.dart';
class MyTable extends StatelessWidget {
  const MyTable({super.key});

  @override
  Widget build(BuildContext context) {
    return UploadedTableTitle(
      child: BlocConsumer<LoadsCubit,AddLoadStates>(
          listener: (BuildContext context, Object? state) {  },
          builder: (context,state) {
          return ListView.builder(
              itemCount: LoadsCubit.get(context).myVehicleList.length,

              itemBuilder: (context, index) {
              return Container(
                color: index.isEven ? Colors.grey[300] : Colors.white,
                child: UploadedTableDataRow(
                  origin:"${LoadsCubit.get(context).myVehicleList[index].originCity!.title??"other"}"
                      " (${LoadsCubit.get(context).myVehicleList[index].originState!.title??"other"} , "
                      "${LoadsCubit.get(context).myVehicleList[index].originCountry!.title??"other"}) "
                      " → ""${LoadsCubit.get(context).myVehicleList[index].destinationCity!.title??"other"}"
                      " (${LoadsCubit.get(context).myVehicleList[index].destinationState!.title??"other"} , "
                      "${LoadsCubit.get(context).myVehicleList[index].destinationCountry!.title??"other"}) ",
                  editFunc:(){
//                    MagicRouter.navigateTo( AddVehiclesView(isEdit: true,vehiclesModel:
//                    LoadsCubit.get(context).myVehicleList[index],index:index));
                    //VehiclesCubit.get(context).editVehicleCubit(context:context,vehicleId:VehiclesCubit.get(context).vehicleList[index].id);

                  } ,
                  deleteFunc:(){
                    LoadsCubit.get(context).deleteLoadsCubit(LoadsCubit.get(context).myVehicleList[index].id);
                  } ,
                  tableWeight:"${LoadsCubit.get(context).myVehicleList[index].weight}" ,
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
