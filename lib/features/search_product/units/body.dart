part of '../view.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, AddProductStates>(
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
                    minWidth: 900,
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
                                          image: NetworkImage(state.productList[index].productImage ==null?'https://hegaload.com/uploads/product-images/1657431690.jpg':state.productList[index].productImage!
                                          
                                          ) ))),
                                ]))),
              ),
            );
          }
          else if (state is AddProductLoading) {
            return  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:const [
                 Center(
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                ),
              ],
            );
          }
          else if (state is GetSearchSuccess) {
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
                    minWidth: 890,
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
                                  child: Text(ProductsCubit.get(context)
                                      .productList[index]
                                      .price!))),
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
          else {
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
                    minWidth: 890,
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
                                      child: Text(ProductsCubit.get(context)
                                          .productList[index]
                                          .price!))),
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
  }
}
