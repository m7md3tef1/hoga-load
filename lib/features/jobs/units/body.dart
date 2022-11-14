part of '../view.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);
  List titlesList = [
    'Title',
    'Category',
    'Type',
    'Salary',
    'Vacancy',
    'Location',
    'Shift',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
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
                        itemCount: 7,
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
                  child: BlocConsumer<JopCubit, AddJopStates>(
                    builder: (context, state) {
                      if (state is GetJopFailed && state is GetSearchFailed) {
                        return Center(child: CustomText(text: state.msg));
                      } else if (state is GetSearchSuccess) {
                        return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.jopList.length,
                            itemBuilder: (context, index) {
                              print('jjjjjjjjjjj');

                              return Container(
                                color: index.isEven
                                    ? Colors.grey[300]
                                    : Colors.white,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: InkWell(
                                    onTap: () {
                                      MagicRouter.navigateTo(
                                          Detail(state.jopList[index]));
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          width: 0.2.sw,
                                          text: state.jopList[index].title,
                                          align: TextAlign.center,
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        CustomText(
//                                height: 20.h,o
                                            width: 0.2.sw,
                                            text:
                                                state.jopList[index].category ==
                                                        null
                                                    ? 'other'
                                                    : state.jopList[index]
                                                        .category!.title,
                                            align: TextAlign.center,
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w500),
                                        CustomText(
//                                  height: 20.h,
                                            width: 0.2.sw,
                                            text:
                                                state.jopList[index].jobType ==
                                                        null
                                                    ? 'other'
                                                    : state.jopList[index]
                                                        .jobType!.title,
                                            align: TextAlign.center,
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w500),
                                        CustomText(
                                            width: 0.2.sw,
                                            text: state.jopList[index].salary ==
                                                    null
                                                ? 'other'
                                                : state.jopList[index].salary!,
                                            fontSize: 8.sp,
                                            align: TextAlign.center,
                                            fontWeight: FontWeight.w500),
                                        CustomText(
                                            width: 0.2.sw,
//                                  height: 20.h,
                                            text: state.jopList[index]
                                                        .noOfPosts ==
                                                    null
                                                ? 'other'
                                                : state
                                                    .jopList[index].noOfPosts!
                                                    .toString(),
                                            align: TextAlign.center,
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w500),
                                        CustomText(
//                                  height: 30.h,
                                            width: 0.2.sw,
                                            text: state.jopList[index].state ==
                                                    null
                                                ? 'other'
                                                : state
                                                    .jopList[index].state!.title
                                                    .toString(),
                                            align: TextAlign.center,
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w500),
                                        CustomText(
                                            width: 0.2.sw,
//                                  height: 20.h,
                                            text: state.jopList[index]
                                                        .shiftTime ==
                                                    null
                                                ? 'other'
                                                : state
                                                    .jopList[index].shiftTime!,
                                            align: TextAlign.center,
                                            color: Colors.green,
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w500),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      } else if (state is GetJopSuccess) {
                        return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.jopList.length,
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
                                      MagicRouter.navigateTo(
                                          Detail(state.jopList[index]));
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          width: 0.2.sw,
                                          text: state.jopList[index].title
                                              .toString(),
                                          align: TextAlign.center,
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        CustomText(
//                                height: 20.h,o
                                            width: 0.2.sw,
                                            text:
                                                state.jopList[index].category ==
                                                        null
                                                    ? 'other'
                                                    : state.jopList[index]
                                                        .category!.title
                                                        .toString(),
                                            align: TextAlign.center,
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w500),
                                        CustomText(
//                                  height: 20.h,
                                            width: 0.2.sw,
                                            text:
                                                state.jopList[index].jobType ==
                                                        null
                                                    ? 'other'
                                                    : state.jopList[index]
                                                        .jobType!.title
                                                        .toString(),
                                            align: TextAlign.center,
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w500),
                                        CustomText(
                                            width: 0.2.sw,
                                            text: state.jopList[index].salary ==
                                                    null
                                                ? 'other'
                                                : state.jopList[index].salary!,
                                            fontSize: 8.sp,
                                            align: TextAlign.center,
                                            fontWeight: FontWeight.w500),
                                        CustomText(
                                            width: 0.2.sw,
                                            text: state.jopList[index]
                                                        .noOfPosts ==
                                                    null
                                                ? 'other'
                                                : state
                                                    .jopList[index].noOfPosts!
                                                    .toString(),
                                            align: TextAlign.center,
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w500),
                                        CustomText(
//                                  height: 30.h,
                                            width: 0.2.sw,
                                            text: state.jopList[index].state ==
                                                    null
                                                ? 'other'
                                                : state
                                                    .jopList[index].state!.title
                                                    .toString(),
                                            align: TextAlign.center,
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w500),
                                        CustomText(
                                            width: 0.2.sw,
//                                  height: 20.h,
                                            text: state.jopList[index]
                                                        .shiftTime ==
                                                    null
                                                ? 'other'
                                                : state
                                                    .jopList[index].shiftTime!
                                                    .toString(),
                                            align: TextAlign.center,
                                            color: Colors.green,
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w500),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      } else if (state is AddJopLoading) {
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
                                            baseColor: Colors.grey[300]!,
                                            highlightColor: Colors.grey[400]!,
                                            child: Container(
                                                width: 0.2.sw,
                                                height: 12.sp,
                                                color: Colors.grey[300]),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Shimmer.fromColors(
                                              enabled: true,
                                              baseColor: Colors.grey[300]!,
                                              highlightColor:
                                                  Colors.grey[400]!,
                                              child: Container(
                                                  width: 0.2.sw,
                                                  height: 12.sp,
                                                  color: Colors.grey[300])),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Shimmer.fromColors(
                                              enabled: true,
                                              baseColor: Colors.grey[300]!,
                                              highlightColor:
                                                  Colors.grey[400]!,
                                              child: Container(
                                                  width: 0.2.sw,
                                                  height: 12.sp,
                                                  color: Colors.grey[300])),
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
                            itemCount: JopCubit.get(context).jopList.length,
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
                                          JopCubit.get(context)
                                              .jopList[index]));
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          width: 0.2.sw,
                                          text: JopCubit.get(context)
                                              .jopList[index]
                                              .title,
                                          align: TextAlign.center,
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        CustomText(
//                                height: 20.h,o
                                            width: 0.2.sw,
                                            text: JopCubit.get(context)
                                                        .jopList[index]
                                                        .category ==
                                                    null
                                                ? 'other'
                                                : JopCubit.get(context)
                                                    .jopList[index]
                                                    .category!
                                                    .title,
                                            //   text: '',

                                            align: TextAlign.center,
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w500),
                                        CustomText(
//                                  height: 20.h,
                                            width: 0.2.sw,
                                            text: JopCubit.get(context)
                                                        .jopList[index]
                                                        .jobType ==
                                                    null
                                                ? 'other'
                                                : JopCubit.get(context)
                                                    .jopList[index]
                                                    .jobType!
                                                    .title,
                                            align: TextAlign.center,
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w500),
                                        CustomText(
                                            width: 0.2.sw,
                                            text: JopCubit.get(context)
                                                        .jopList[index]
                                                        .salary ==
                                                    null
                                                ? 'other'
                                                : JopCubit.get(context)
                                                    .jopList[index]
                                                    .salary!,
                                            fontSize: 8.sp,
                                            align: TextAlign.center,
                                            fontWeight: FontWeight.w500),
                                        CustomText(
                                            width: 0.2.sw,
//                                  height: 20.h,
                                            text: JopCubit.get(context)
                                                        .jopList[index]
                                                        .noOfPosts ==
                                                    null
                                                ? 'other'
                                                : JopCubit.get(context)
                                                    .jopList[index]
                                                    .noOfPosts!
                                                    .toString(),
                                            align: TextAlign.center,
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w500),
                                        CustomText(
//                                  height: 30.h,
                                            width: 0.2.sw,
                                            text: JopCubit.get(context)
                                                        .jopList[index]
                                                        .state ==
                                                    null
                                                ? 'other'
                                                : JopCubit.get(context)
                                                    .jopList[index]
                                                    .state!
                                                    .title,
                                            align: TextAlign.center,
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w500),
                                        CustomText(
                                            width: 0.2.sw,
//                                  height: 20.h,
                                            text: JopCubit.get(context)
                                                        .jopList[index]
                                                        .shiftTime ==
                                                    null
                                                ? 'other'
                                                : JopCubit.get(context)
                                                    .jopList[index]
                                                    .shiftTime!
                                                    .toString(),
                                            align: TextAlign.center,
                                            color: Colors.green,
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w500),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      }
                    },
                    listener: (BuildContext context, Object? state) {
                      print(JopCubit.get(context).jopList.toString().length);
                    },
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

BlocConsumer<JopCubit, AddJopStates>(
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

 */
