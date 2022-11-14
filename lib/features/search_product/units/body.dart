part of'../view.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);
  List titlesList = ['Buy / Sell', 'Product', 'Type', 'Price', ' '];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.7.sh,
      child: Scrollbar(
        thickness: 15,
        trackVisibility: true,
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
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 0.2.sw,
                            child: CustomText(
                              text: titlesList[index],
                              fontSize: 9.sp,
                              align: TextAlign.start,
                              fontWeight: FontWeight.w700,
                            ),
                          );
                        }),
                  ),
                ),
                Container(
                  height: 0.6.sh,
                  width: 0.2.sw * 7,
                  child: BlocConsumer<ProductsCubit, AddProductStates>(
                    builder: (context, state) {
                      if (state is GetProductsFailed &&
                          state is GetSearchFailed) {
                        return Center(child: CustomText(text: state.msg));
                      } else if (state is GetSearchSuccess) {
                        return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.productList.length,
                            itemBuilder: (context, index) {
                              print('lllllllllll');

                              return Container(
                                color: index.isEven
                                    ? Colors.grey[300]
                                    : Colors.white,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 0),
                                  child: InkWell(
                                    onTap: () {
                                      MagicRouter.navigateTo(Detail(
                                          ProductsCubit.get(context)
                                              .productList[index]));
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CustomText(
                                          width: 0.2.sw,
                                          text: state
                                              .productList[index].buyOrSell,
                                          align: TextAlign.start,
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        CustomText(
//                                height: 20.h,o
                                            width: 0.2.sw,
                                            text: state.productList[index]
                                                    .productName ??
                                                'other',
                                            //   text: '',

                                            align: TextAlign.start,
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w500),
                                        CustomText(
//                                  height: 20.h,
                                            width: 0.2.sw,
                                            text: state.productList[index]
                                                        .productType ==
                                                    null
                                                ? 'other'
                                                : state.productList[index]
                                                    .productType!.title,
                                            align: TextAlign.start,
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w500),
                                        CustomText(
                                            width: 0.2.sw,
                                            text:
                                                '\$ ${state.productList[index].price!} ' ??
                                                    'other',
                                            fontSize: 8.sp,
                                            align: TextAlign.start,
                                            fontWeight: FontWeight.w500),
                                        Image(
                                          height: 50,
                                          width: 0.2.sw,
                                          image: NetworkImage(state
                                                      .productList[index]
                                                      .productImage ==
                                                  null
                                              ? 'https://hegaload.com/uploads/product-images/1657431690.jpg'
                                              : state.productList[index]
                                                  .productImage!),
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Container(
                                              width: 0.2.sw,
                                              child: Center(
                                                  child: Icon(Icons.error)),
                                            );
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      } else if (state is GetProductsSuccess) {
                        return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.productList.length,
                            itemBuilder: (context, index) {
                              return Container(
                                color: index.isEven
                                    ? Colors.grey[300]
                                    : Colors.white,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 0),
                                  child: InkWell(
                                    onTap: () {
                                      MagicRouter.navigateTo(Detail(
                                          ProductsCubit.get(context)
                                              .productList[index]));
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CustomText(
                                          width: 0.2.sw,
                                          text: state
                                              .productList[index].buyOrSell,
                                          align: TextAlign.start,
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        CustomText(
//                                height: 20.h,o
                                            width: 0.2.sw,
                                            text: state.productList[index]
                                                    .productName ??
                                                'other',
                                            //   text: '',

                                            align: TextAlign.start,
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w500),
                                        CustomText(
//                                  height: 20.h,
                                            width: 0.2.sw,
                                            text: state.productList[index]
                                                        .productType ==
                                                    null
                                                ? 'other'
                                                : state.productList[index]
                                                    .productType!.title,
                                            align: TextAlign.start,
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w500),
                                        CustomText(
                                            width: 0.2.sw,
                                            text:
                                                '\$ ${state.productList[index].price!} ' ??
                                                    'other',
                                            fontSize: 8.sp,
                                            align: TextAlign.start,
                                            fontWeight: FontWeight.w500),
                                        CachedNetworkImage(
                                          height: 50,
                                          width: 0.2.sw,
                                          imageUrl: state
                                              .productList[index].productImage!,
                                          // placeholder: (context, url) =>
                                          //     Container(
                                          //         height: 15,
                                          //         width: 15,
                                          //         margin: EdgeInsets.all(5),
                                          //         child: Center(
                                          //           child:
                                          //               CircularProgressIndicator(
                                          //             strokeWidth: 2,
                                          //             color: Colors.orange,
                                          //           ),
                                          //         )),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      } else if (state is AddProductLoading) {
                        return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              print('llllllll');

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
                                            child: Container(
                                                width: 0.2.sw,
                                                height: 12.sp,
                                                color: Colors.grey[300]),
                                            baseColor: Colors.grey[300]!,
                                            highlightColor: Colors.grey[400]!,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Shimmer.fromColors(
                                              enabled: true,
                                              child: Container(
                                                  width: 0.2.sw,
                                                  height: 12.sp,
                                                  color: Colors.grey[300]),
                                              baseColor: Colors.grey[300]!,
                                              highlightColor:
                                                  Colors.grey[400]!),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Shimmer.fromColors(
                                              enabled: true,
                                              child: Container(
                                                  width: 0.2.sw,
                                                  height: 12.sp,
                                                  color: Colors.grey[300]),
                                              baseColor: Colors.grey[300]!,
                                              highlightColor:
                                                  Colors.grey[400]!),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Shimmer.fromColors(
                                              enabled: true,
                                              child: Container(
                                                  width: 0.2.sw,
                                                  height: 12.sp,
                                                  color: Colors.grey[300]),
                                              baseColor: Colors.grey[300]!,
                                              highlightColor:
                                                  Colors.grey[400]!),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Shimmer.fromColors(
                                              enabled: true,
                                              child: Container(
                                                  width: 0.2.sw,
                                                  height: 12.sp,
                                                  color: Colors.grey[300]),
                                              baseColor: Colors.grey[300]!,
                                              highlightColor:
                                                  Colors.grey[400]!),
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
                                ProductsCubit.get(context).productList.length,
                            itemBuilder: (context, index) {
                              print('llllllll');

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
                                          ProductsCubit.get(context)
                                              .productList[index]));
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          width: 0.2.sw,
                                          text: ProductsCubit.get(context)
                                              .productList[index]
                                              .buyOrSell,
                                          align: TextAlign.start,
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        CustomText(
//                                height: 20.h,o
                                            width: 0.2.sw,
                                            text: ProductsCubit.get(context)
                                                    .productList[index]
                                                    .productName ??
                                                'other',
                                            //   text: '',

                                            align: TextAlign.start,
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w500),
                                        CustomText(
//                                  height: 20.h,
                                            width: 0.2.sw,
                                            text: ProductsCubit.get(context)
                                                        .productList[index]
                                                        .productType ==
                                                    null
                                                ? 'other'
                                                : ProductsCubit.get(context)
                                                    .productList[index]
                                                    .productType!
                                                    .title,
                                            align: TextAlign.start,
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w500),
                                        CustomText(
                                            width: 0.2.sw,
                                            text:
                                                '\$ ${ProductsCubit.get(context).productList[index].price!} ',
                                            fontSize: 8.sp,
                                            align: TextAlign.start,
                                            fontWeight: FontWeight.w500),
                                        Image(
                                            height: 50,
                                            width: 0.2.sw,
                                            image: NetworkImage(ProductsCubit
                                                            .get(context)
                                                        .productList[index]
                                                        .productImage ==
                                                    null
                                                ? 'https://hegaload.com/uploads/product-images/1657431690.jpg'
                                                : ProductsCubit.get(context)
                                                    .productList[index]
                                                    .productImage!))
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
    );
  }
}
/*
BlocConsumer<ProductsCubit, AddProductStates>(
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
                        state.productList.length >= 10 ? .06.sh : .09.sh,
                    minWidth: 780,
                    columns: const [
                      DataColumn2(
                        label: Center(child: Text('Buy / Sell')),
                        size: ColumnSize.L,
                      ),
                      DataColumn(
                        label: Center(child: Text('Product')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Type')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Type')),
                      ),
                      DataColumn(
                        label: Center(child: Text(' ')),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                        state.productList.length,
                        (index) => DataRow(
                                color: MaterialStateColor.resolveWith(
                                    (states) => index.isEven
                                        ? const Color(0xFFE0E0E0)
                                        : Colors.white),
                                cells: [
                                  DataCell(Center(
                                      child: Text(state
                                          .productList[index].buyOrSell!))),
                                  DataCell(Center(
                                      child: Text(state
                                          .productList[index].productName!))),
                                  DataCell(Center(
                                      child: Text(state.productList[index]
                                          .productType!.title!))),
                                  DataCell(Center(
                                      child: Text(
                                          '\$ ${state.productList[index].price!} '))),
                                  DataCell(Center(
                                      child: Image(
                                          image: NetworkImage(state
                                                      .productList[index]
                                                      .productImage ==
                                                  null
                                              ? 'https://hegaload.com/uploads/product-images/1657431690.jpg'
                                              : state.productList[index]
                                                  .productImage!)))),
                                ]))),
              ),
            );
          } else if (state is AddProductLoading) {
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
          } else if (state is GetProductsSuccess) {
            return Container(
              height: .9.sh,
              width: 1.sw,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: DataTable2(
                    columnSpacing: 1,
                    horizontalMargin: 0,
                    dataRowHeight:
                        ProductsCubit.get(context).productList.length >= 10
                            ? .06.sh
                            : .09.sh,
                    minWidth: 780,
                    columns: const [
                      DataColumn2(
                        label: Center(child: Text('Buy / Sell')),
                        size: ColumnSize.L,
                      ),
                      DataColumn(
                        label: Center(child: Text('Product')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Type')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Price')),
                      ),
                      DataColumn(
                        label: Center(child: Text(' ')),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                        ProductsCubit.get(context).productList.length,
                        (index) => DataRow(
                                color: MaterialStateColor.resolveWith(
                                    (states) => index.isEven
                                        ? const Color(0xFFE0E0E0)
                                        : Colors.white),
                                cells: [
                                  DataCell(Center(
                                      child: Text(ProductsCubit.get(context)
                                          .productList[index]
                                          .buyOrSell!))),
                                  DataCell(Center(
                                      child: Text(ProductsCubit.get(context)
                                          .productList[index]
                                          .productName!))),
                                  DataCell(Center(
                                      child: Text(ProductsCubit.get(context)
                                          .productList[index]
                                          .productType!
                                          .title!))),
                                  DataCell(Center(
                                      child: Text(
                                          '\$ ${ProductsCubit.get(context).productList[index].price!} '))),
                                  DataCell(Center(
                                      child: Image(
                                          image: NetworkImage(
                                              ProductsCubit.get(context)
                                                  .productList[index]
                                                  .productImage!)))),
                                ]))),
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
                        ProductsCubit.get(context).productList.length >= 10
                            ? .06.sh
                            : .09.sh,
                    minWidth: 780,
                    columns: const [
                      DataColumn2(
                        label: Center(child: Text('Buy / Sell')),
                        size: ColumnSize.L,
                      ),
                      DataColumn(
                        label: Center(child: Text('Product')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Type')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Price')),
                      ),
                      DataColumn(
                        label: Center(child: Text(' ')),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                        ProductsCubit.get(context).productList.length,
                        (index) => DataRow(
                                color: MaterialStateColor.resolveWith(
                                    (states) => index.isEven
                                        ? const Color(0xFFE0E0E0)
                                        : Colors.white),
                                cells: [
                                  DataCell(Center(
                                      child: Text(ProductsCubit.get(context)
                                          .productList[index]
                                          .buyOrSell!))),
                                  DataCell(Center(
                                      child: Text(ProductsCubit.get(context)
                                          .productList[index]
                                          .productName!))),
                                  DataCell(Center(
                                      child: Text(ProductsCubit.get(context)
                                          .productList[index]
                                          .productType!
                                          .title!))),
                                  DataCell(Center(
                                      child: Text(
                                          '\$ ${ProductsCubit.get(context).productList[index].price!} '))),
                                  DataCell(Center(
                                      child: Image(
                                          image: NetworkImage(
                                              ProductsCubit.get(context)
                                                  .productList[index]
                                                  .productImage!)))),
                                ]))),
              ),
            );
          }
        });
 */
