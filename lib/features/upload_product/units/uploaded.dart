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
    ProductsCubit.get(context).addProductCubitTest(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, AddProductStates>(
        listener: (BuildContext context, Object? state) {
      if (state is DeleteSuccess || state is EditSuccess) {
        Navigator.pop(context);
      }
    }, builder: (context, state) {
      return ProductsCubit.get(context).testLoading
          ? Center(
              child: CircularProgressIndicator(
              color: ColorManager.yellow,
            ))
          : ProductsCubit.get(context).isAccessToken
              ? CustomCard(
                  widget: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 11.sp),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 18.h,
                        ),
                        CustomCardTitle(
                          text: 'UPLOADED PRODUCTS',
                        ),
                        ProductsCubit.get(context).myProductList.isEmpty
                            ? Expanded(
                                child: Column(
                                  children: [
                                    CustomNoContainer(text: 'products'),
                                  ],
                                ),
                              )
                            : const MyProductTable(),
                        Button()
                      ],
                    ),
                  ),
                )
              : UpgradeMember();
    });
  }
}
