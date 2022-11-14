part of'../view.dart';

class UploadedLoad extends StatefulWidget {
  const UploadedLoad({Key? key}) : super(key: key);

  @override
  State<UploadedLoad> createState() => _UploadedLoadState();
}

class _UploadedLoadState extends State<UploadedLoad> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadsCubit.get(context).addLoadsCubitTest();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoadsCubit, AddLoadStates>(
        listener: (BuildContext context, Object? state) {},
        builder: (context, state) {
          print("is access token ${LoadsCubit.get(context).isAccessToken}");

          return LoadsCubit.get(context).testLoading
              ? Center(
                  child: CircularProgressIndicator(
                  color: ColorManager.yellow,
                ))
              : LoadsCubit.get(context).isAccessToken
                  ? CustomCard(
                      widget: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 11.sp),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 18.h,
                            ),
                            CustomCardTitle(
                              text: 'UPLOADED LOADS',
                            ),
//                  LoadsCubit.get(context).myVehiclesLoading?
//                  const Expanded(child: Center(child: CircularProgressIndicator(color: ColorManager.yellow,))):
                            LoadsCubit.get(context).myloadList.isEmpty
                                ? Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CustomNoContainer(text: 'loads'),
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
