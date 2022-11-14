part of'../view.dart';
class MyTable extends StatelessWidget {
  const MyTable({super.key});

  @override
  Widget build(BuildContext context) {
    return UploadedTableTitle(
      child: BlocConsumer<LoadsCubit,AddLoadStates>(
          listener: (BuildContext context, Object? state) {  },
          builder: (context,state) {
          return ListView.builder(
              itemCount: LoadsCubit.get(context).myloadList.length,

              itemBuilder: (context, index) {
              return Container(
                color: index.isEven ? Colors.grey[300] : Colors.white,
                child: UploadedTableDataRow(
                  origin:
                  "${LoadsCubit.get(context).myloadList[index].originCity == null ? "other" : LoadsCubit.get(context).myloadList[index].originCity!.title}"
                      " (${LoadsCubit.get(context).myloadList[index].originState == null ? "other" : LoadsCubit.get(context).myloadList[index].originState!.title} , "
                      "${LoadsCubit.get(context).myloadList[index].originCountry == null ? "other" : LoadsCubit.get(context).myloadList[index].originCountry!.title}) "
                      " → "
                      "${LoadsCubit.get(context).myloadList[index].destinationCity == null ? "other" : LoadsCubit.get(context).myloadList[index].destinationCity!.title}"
                      " (${LoadsCubit.get(context).myloadList[index].destinationState == null ? "other" : LoadsCubit.get(context).myloadList[index].destinationState!.title} , "
                      "${LoadsCubit.get(context).myloadList[index].destinationCountry == null ? "other" : LoadsCubit.get(context).myloadList[index].destinationCountry!.title}) ",
                  editFunc:(){
                   MagicRouter.navigateTo( AddVehiclesView(isLoadEdit: true,vehiclesModel:
                   LoadsCubit.get(context).myloadList[index],index:index));
                    //VehiclesCubit.get(context).editVehicleCubit(context:context,vehicleId:VehiclesCubit.get(context).vehicleList[index].id);

                  } ,
                  deleteFunc:(){
                    LoadsCubit.get(context).deleteLoadsCubit(LoadsCubit.get(context).myloadList[index].id);
                  } ,
                  tableWeight:"${LoadsCubit.get(context).myloadList[index].weight}" ,
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
