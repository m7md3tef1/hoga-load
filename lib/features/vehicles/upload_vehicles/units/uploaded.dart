part of'../view.dart';

class Uploaded extends StatefulWidget {
  const Uploaded({Key? key}) : super(key: key);

  @override
  State<Uploaded> createState() => _UploadedState();
}

class _UploadedState extends State<Uploaded> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    VehiclesCubit.get(context).addVehicleCubitTest();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VehiclesCubit, VehicleStates>(
        listener: (BuildContext context, Object? state) {},
        builder: (context, state) {
          print("is access token ${VehiclesCubit.get(context).isAccessToken}");

          return VehiclesCubit.get(context).testLoading
              ? Center(
                  child: CircularProgressIndicator(
                  color: ColorManager.yellow,
                ))
              : VehiclesCubit.get(context).isAccessToken
                  ? CustomCard(
                      widget: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 11.sp),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 18.h,
                            ),
                            CustomCardTitle(
                              text: 'UPLOADED Vehicles',
                            ),
                            VehiclesCubit.get(context).myVehiclesLoading
                                ? const Expanded(
                                    child: Center(
                                        child: CircularProgressIndicator(
                                    color: ColorManager.yellow,
                                  )))
                                : VehiclesCubit.get(context)
                                        .myVehicleList
                                        .isEmpty
                                    ? Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            CustomNoContainer(text: 'vehicles'),
                                          ],
                                        ),
                                      )
                                    : const MyTable(),
                            Button()
                          ],
                        ),
                      ),
                    )
                  : UpgradeMember();
        });
  }
}
