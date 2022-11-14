part of'../view.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      widget: Column(
        children: [
          SizedBox(
            height: 18.h,
          ),
          CustomCardTitle(
            text: 'PURCHASE ADVERTISEMENT PACKAGE',
          ),
          SizedBox(
            height: 8.h,
          ),
          BlocConsumer<PackageCubit, PackageStates>(
            builder: (context, state) {
              if (state is GetPackageSuccess) {
                return SizedBox(
                  height: .69.sh,
                  width: 1.sw,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: PackageCubit.get(context).packageList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            CustomPackage(
                              index: index,
                              text1: PackageCubit.get(context)
                                  .packageList[index]
                                  .title,
                              price:
                                  '${PackageCubit.get(context).packageList[index].pricePerDay} / Day',
                              text2: PackageCubit.get(context)
                                  .packageList[index]
                                  .description,
                              conttext1: PackageCubit.get(context)
                                          .packageList[index]
                                          .title ==
                                      "Per Day Package"
                                  ? '2022-08-07'
                                  : null,
                              conttext2: PackageCubit.get(context)
                                          .packageList[index]
                                          .title ==
                                      "Per Day Package"
                                  ? 'Total Payable'
                                  : null,
                              totalprice:
                                  '${PackageCubit.get(context).packageList[index].duration! * int.parse(PackageCubit.get(context).packageList[index].pricePerDay!)}',
                            ),
                            index ==
                                    PackageCubit.get(context)
                                            .packageList
                                            .length -
                                        1
                                ? Column(
                                    children: [
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 41.w, right: 13.w),
                                        child: CustomButton(
                                          function: () =>
                                              MagicRouter.navigateTo(
                                                  const AddUpdateCardView()),
                                          text: 'BUY NOW',
                                          colortext: const Color(0xFFFDC52F),
                                          colorborder: const Color(0xFFFDC52F),
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30.h,
                                      ),
                                    ],
                                  )
                                : Container()
                          ],
                        );
                      }),
                );
              } else if (state is PackageLoading) {
                return SizedBox(
                    height: .9.sh,
                    width: 1.sw,
                    child: const Center(
                        child: CircularProgressIndicator(
                      color: Colors.orange,
                    )));
              } else {
                return const Text('No data');
              }
            },
            listener: (BuildContext context, state) {},
          ),
        ],
      ),
    );
  }
}
