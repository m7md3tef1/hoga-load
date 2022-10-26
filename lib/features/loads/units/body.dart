part of '../view.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoadsCubit, AddLoadStates>(
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
                        state.loadList.length >= 10 ? .06.sh : .09.sh,
                    minWidth: 890,
                    columns: const [
                      DataColumn2(
                        label: Center(child: Text('Available')),
                        size: ColumnSize.L,
                      ),
                      DataColumn(
                        label: Center(child: Text('Origin')),
                      ),
                      DataColumn(
                        label: Center(child: Text('State')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Destination')),
                      ),
                      DataColumn(
                        label: Center(child: Text('State')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Type')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Size')),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                        state.loadList.length,
                        (index) => DataRow(

                                color: MaterialStateColor.resolveWith(
                                    (states) => index.isEven
                                        ? const Color(0xFFE0E0E0)
                                        : Colors.white),
                                cells: [
                                  DataCell(Center(
                                      child: Text(state
                                          .loadList[index].availabilityDate!))),
                                  DataCell(Center(
                                      child: Text(state.loadList[index]
                                          .originCountry!.title!))),
                                  DataCell(Center(
                                      child: Text(state.loadList[index]
                                          .originState!.title!))),
                                  DataCell(Center(
                                      child: Text(state.loadList[index]
                                                  .destinationCity ==
                                              null
                                          ? 'other'
                                          : state.loadList[index]
                                              .destinationCity!.title!))),
                                  DataCell(Center(
                                      child: Text(state.loadList[index]
                                          .destinationState!.title!))),
                                  DataCell(Center(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: Center(
                                      child: ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: state.loadList[index]
                                              .equipmentTypes?.length,
                                          itemBuilder: (context, i) => Center(
                                              child: Text(state.loadList[index]
                                                  .equipmentTypes![i].title
                                                  .toString()))),
                                    ),
                                  ))),
                                  DataCell(Center(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: Center(
                                      child: ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: state.loadList[index]
                                              .vehicleSizes?.length,
                                          itemBuilder: (context, i) => Center(
                                              child: Text(state
                                                      .loadList[index]
                                                      .vehicleSizes![i]
                                                      .title!
                                                      .isEmpty
                                                  ? 'other'
                                                  : state.loadList[index]
                                                      .vehicleSizes![i].title
                                                      .toString()))),
                                    ),
                                  ))),
                                ]))),
              ),
            );
          } else if (state is AddLoadLoading) {
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
          } else if (state is GetLoadsSuccess)  {
            return Container(
              height: .9.sh,
              width: 1.sw,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: DataTable2(
                    columnSpacing: 1,
                    horizontalMargin: 0,
                    dataRowHeight: LoadsCubit.get(context).loadList.length >= 10
                        ? .06.sh
                        : .09.sh,
                    minWidth: 890,
                    columns: const [
                      DataColumn2(
                        label: Center(child: Text('Available')),
                        size: ColumnSize.L,
                      ),
                      DataColumn(
                        label: Center(child: Text('Origin')),
                      ),
                      DataColumn(
                        label: Center(child: Text('State')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Destination')),
                      ),
                      DataColumn(
                        label: Center(child: Text('State')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Type')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Size')),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                        LoadsCubit.get(context).loadList.length,
                        (index) => DataRow(
                                color: MaterialStateColor.resolveWith(
                                    (states) => index.isEven
                                        ? const Color(0xFFE0E0E0)
                                        : Colors.white),
                                cells: [
                                  DataCell(Center(
                                      child: Text(LoadsCubit.get(context)
                                          .loadList[index]
                                          .availabilityDate!))),
                                  DataCell(Center(
                                      child: Text(LoadsCubit.get(context)
                                          .loadList[index]
                                          .originCountry!
                                          .title!))),
                                  DataCell(Center(
                                      child: Text(LoadsCubit.get(context)
                                          .loadList[index]
                                          .originState!
                                          .title!))),
                                  DataCell(Center(
                                      child: Text(state.loadList[index]
                                          .destinationCity ==
                                          null
                                          ? 'other'
                                          : state.loadList[index]
                                          .destinationCity!.title!))),
                                  DataCell(Center(
                                      child: Text(LoadsCubit.get(context)
                                          .loadList[index]
                                          .destinationState!
                                          .title!))),
                                  DataCell(Center(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: Center(
                                      child: ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: LoadsCubit.get(context)
                                              .loadList[index]
                                              .equipmentTypes
                                              ?.length,
                                          itemBuilder: (context, i) => Center(
                                              child: Text(
                                                  LoadsCubit.get(context)
                                                      .loadList[index]
                                                      .equipmentTypes![i]
                                                      .title
                                                      .toString()))),
                                    ),
                                  ))),
                                  DataCell(Center(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: Center(
                                      child: ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: LoadsCubit.get(context)
                                              .loadList[index]
                                              .vehicleSizes
                                              ?.length,
                                          itemBuilder: (context, i) => Center(
                                              child: Text(
                                                  LoadsCubit.get(context)
                                                              .loadList[index]
                                                              .vehicleSizes ==
                                                          null
                                                      ? 'other'
                                                      : LoadsCubit.get(context)
                                                          .loadList[index]
                                                          .vehicleSizes![i]
                                                          .title!))),
                                    ),
                                  ))),
                                ]))),
              ),
            );
          } else{
          return  Container(
              height: .9.sh,
              width: 1.sw,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: DataTable2(
                    columnSpacing: 1,
                    horizontalMargin: 0,
                    dataRowHeight: LoadsCubit.get(context).loadList.length >= 10
                        ? .06.sh
                        : .09.sh,
                    minWidth: 890,
                    columns: const [
                      DataColumn2(
                        label: Center(child: Text('Available')),
                        size: ColumnSize.L,
                      ),
                      DataColumn(
                        label: Center(child: Text('Origin')),
                      ),
                      DataColumn(
                        label: Center(child: Text('State')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Destination')),
                      ),
                      DataColumn(
                        label: Center(child: Text('State')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Type')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Size')),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                        LoadsCubit.get(context).loadList.length,
                            (index) => DataRow(
                            color: MaterialStateColor.resolveWith(
                                    (states) => index.isEven
                                    ? const Color(0xFFE0E0E0)
                                    : Colors.white),
                            cells: [
                              DataCell(Center(
                                  child: Text(LoadsCubit.get(context)
                                      .loadList[index]
                                      .availabilityDate!))),
                              DataCell(Center(
                                  child: Text(LoadsCubit.get(context)
                                      .loadList[index]
                                      .originCountry!
                                      .title!))),
                              DataCell(Center(
                                  child: Text(LoadsCubit.get(context)
                                      .loadList[index]
                                      .originState!
                                      .title!))),
                              DataCell(Center(
                                  child: Text(LoadsCubit.get(context).loadList[index]
                                      .destinationCity ==
                                      null
                                      ? 'other'
                                      : LoadsCubit.get(context).loadList[index]
                                      .destinationCity!.title!))),
                              DataCell(Center(
                                  child: Text(LoadsCubit.get(context)
                                      .loadList[index]
                                      .destinationState!
                                      .title!))),
                              DataCell(Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: Center(
                                      child: ListView.builder(
                                          physics:
                                          const NeverScrollableScrollPhysics(),
                                          itemCount: LoadsCubit.get(context)
                                              .loadList[index]
                                              .equipmentTypes
                                              ?.length,
                                          itemBuilder: (context, i) => Center(
                                              child: Text(
                                                  LoadsCubit.get(context)
                                                      .loadList[index]
                                                      .equipmentTypes![i]
                                                      .title
                                                      .toString()))),
                                    ),
                                  ))),
                              DataCell(Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: Center(
                                      child: ListView.builder(
                                          physics:
                                          const NeverScrollableScrollPhysics(),
                                          itemCount: LoadsCubit.get(context)
                                              .loadList[index]
                                              .vehicleSizes
                                              ?.length,
                                          itemBuilder: (context, i) => Center(
                                              child: Text(
                                                  LoadsCubit.get(context)
                                                      .loadList[index]
                                                      .vehicleSizes ==
                                                      null
                                                      ? 'other'
                                                      : LoadsCubit.get(context)
                                                      .loadList[index]
                                                      .vehicleSizes![i]
                                                      .title!))),
                                    ),
                                  ))),
                            ]))),
              ),
            );
          }
        });
  }
}
