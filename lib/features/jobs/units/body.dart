part of '../view.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JopCubit, AddJopStates>(
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
                    dataRowHeight: state.jopList.length >= 10 ? .06.sh : .09.sh,
                    minWidth: 900,
                    columns: const [
                      DataColumn2(
                        label: Center(child: Text('Title')),
                        size: ColumnSize.L,
                      ),
                      DataColumn(
                        label: Center(child: Text('Category')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Type')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Salary')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Vacancy')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Location')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Shift')),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                        state.jopList.length,
                        (index) => DataRow(
                                color: MaterialStateColor.resolveWith(
                                    (states) => index.isEven
                                        ? const Color(0xFFE0E0E0)
                                        : Colors.white),
                                cells: [
                                  DataCell(Center(
                                      child: Text(
                                          state.jopList[index].title == null
                                              ? 'other'
                                              : state.jopList[index].title
                                                  .toString()))),
                                  DataCell(Center(
                                      child: Text(
                                          state.jopList[index].category == null
                                              ? 'other'
                                              : state.jopList[index].category!
                                                  .title
                                                  .toString()))),
                                  DataCell(Center(
                                      child: Text(
                                          state.jopList[index].jobType == null
                                              ? 'other'
                                              : state
                                                  .jopList[index].jobType!.title
                                                  .toString()))),
                                  DataCell(Center(
                                      child: Text(
                                          state.jopList[index].salary == null
                                              ? 'other'
                                              : state.jopList[index].salary!
                                                  .toString()))),
                                  DataCell(Center(
                                      child: Text(
                                          state.jopList[index].noOfPosts == null
                                              ? 'other'
                                              : state.jopList[index].noOfPosts!
                                                  .toString()))),
                                  DataCell(Center(
                                      child: Text(state.jopList[index].state ==
                                              null
                                          ? 'other'
                                          : state.jopList[index].state!.title
                                              .toString()))),
                                  DataCell(Center(
                                      child: Text(
                                          state.jopList[index].shiftTime == null
                                              ? 'other'
                                              : state
                                                  .jopList[index].shiftTime!))),
                                ]))),
              ),
            );
          } else if (state is AddJopLoading) {
            return  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Center(
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                ),
              ],
            );
          }else if (state is GetJopSuccess)  {
            return Container(
              height: .9.sh,
              width: 1.sw,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: DataTable2(
                    columnSpacing: 1,
                    horizontalMargin: 0,
                    dataRowHeight: JopCubit.get(context).jopList.length >= 10
                        ? .06.sh
                        : .09.sh,
                    minWidth: 890,
                    columns: const [
                      DataColumn2(
                        label: Center(child: Text('Title')),
                        size: ColumnSize.L,
                      ),
                      DataColumn(
                        label: Center(child: Text('Category')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Type')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Salary')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Vacancy')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Location')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Shift')),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                        JopCubit.get(context).jopList.length,
                            (index) => DataRow(
                            color: MaterialStateColor.resolveWith(
                                    (states) => index.isEven
                                    ? const Color(0xFFE0E0E0)
                                    : Colors.white),
                            cells: [
                              DataCell(Center(
                                  child: Text(JopCubit.get(context).jopList[index].title ==null?'other':JopCubit.get(context).jopList[index].title!.toString()))),
                              DataCell(Center(
                                  child: Text(JopCubit.get(context).jopList[index].category ==null?'other':JopCubit.get(context).jopList[index].category!.title.toString()))),
                              DataCell(Center(
                                  child: Text(JopCubit.get(context).jopList[index].jobType ==null?'other':JopCubit.get(context).jopList[index].jobType!.title!.toString()))),
                              DataCell(Center(
                                  child: Text(JopCubit.get(context).jopList[index].salary ==null?'other':JopCubit.get(context).jopList[index].salary!.toString()))),
                              DataCell(Center(
                                  child: Text(JopCubit.get(context).jopList[index].noOfPosts ==null?'other':JopCubit.get(context).jopList[index].noOfPosts!.toString()))),
                              DataCell(Center(
                                  child: Text(JopCubit.get(context).jopList[index].state ==null?'other':JopCubit.get(context).jopList[index].state!.title.toString()))),
                              DataCell(Center(
                                  child: Text(JopCubit.get(context).jopList[index].shiftTime ==null?'other':JopCubit.get(context).jopList[index].shiftTime!.toString()))),
                            ]))),
              ),
            );
          }
          else  {
            return Container(
              height: .9.sh,
              width: 1.sw,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: DataTable2(
                    columnSpacing: 1,
                    horizontalMargin: 0,
                    dataRowHeight: JopCubit.get(context).jopList.length >= 10
                        ? .06.sh
                        : .09.sh,
                    minWidth: 890,
                    columns: const [
                      DataColumn2(
                        label: Center(child: Text('Title')),
                        size: ColumnSize.L,
                      ),
                      DataColumn(
                        label: Center(child: Text('Category')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Type')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Salary')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Vacancy')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Location')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Shift')),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                        JopCubit.get(context).jopList.length,
                        (index) => DataRow(
                                color: MaterialStateColor.resolveWith(
                                    (states) => index.isEven
                                        ? const Color(0xFFE0E0E0)
                                        : Colors.white),
                                cells: [
                                  DataCell(Center(
                                      child: Text(JopCubit.get(context).jopList[index].title ==null?'other':JopCubit.get(context).jopList[index].title!.toString()))),
                                  DataCell(Center(
                                      child: Text(JopCubit.get(context).jopList[index].category ==null?'other':JopCubit.get(context).jopList[index].category!.title.toString()))),
                                  DataCell(Center(
                                      child: Text(JopCubit.get(context).jopList[index].jobType ==null?'other':JopCubit.get(context).jopList[index].jobType!.title!.toString()))),
                                  DataCell(Center(
                                      child: Text(JopCubit.get(context).jopList[index].salary ==null?'other':JopCubit.get(context).jopList[index].salary!.toString()))),
                                  DataCell(Center(
                                      child: Text(JopCubit.get(context).jopList[index].noOfPosts ==null?'other':JopCubit.get(context).jopList[index].noOfPosts!.toString()))),
                                  DataCell(Center(
                                      child: Text(JopCubit.get(context).jopList[index].state ==null?'other':JopCubit.get(context).jopList[index].state!.title.toString()))),
                                  DataCell(Center(
                                      child: Text(JopCubit.get(context).jopList[index].shiftTime ==null?'other':JopCubit.get(context).jopList[index].shiftTime!.toString()))),
                                ]))),
              ),
            );
          }
        });
  }
}
