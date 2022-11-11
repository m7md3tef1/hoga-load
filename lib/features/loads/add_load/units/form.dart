//part of '../add_load_view.dart';

//class FormInfo extends StatefulWidget {
//  FormInfo({Key? key,this.isFilter=false,this.loadsModel,this.isEdit=false,this.index}) : super(key: key);
//  bool isFilter;
//  GetLoadsModel? loadsModel;
//  bool isEdit;
//  int? index;
//
//  @override
//  State<FormInfo> createState() => _FormInfoState();
//}
//
//class _FormInfoState extends State<FormInfo> {
//  var countryOrigin = '';
//
//  var stateOrigin = '';
//
//  var cityOrigin = '';
//
//  var countryDestination = '';
//
//  var stateDestination = '';
//
//  var cityDestination = '';
//  var day = '';
//  var month = '';
//  var year = '';
//  var date = '';
//
//  DateTime dateTime = DateTime.now();
//
//  @override
//  Widget build(BuildContext context) {
//    return CustomCard(
//      widget: Column(
//        children: [
//          Padding(
//            padding: EdgeInsets.symmetric(vertical: 17.h, horizontal: 14.w),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              children: [
//                const Icon(Icons.arrow_back_sharp),
//                Expanded(
//                  child: CustomText(
//                    text: 'ADD LOAD',
//                    fontSize: 18.sp,
//                    fontWeight: FontWeight.w700,
//                  ),
//                )
//              ],
//            ),
//          ),
//          SizedBox(
//            width: 1.sw,
//            child: const Divider(
//              thickness: 1,
//            ),
//          ),
//          CustomTextField(
//            height: 64.h,
//            readOnly: true,
//            name: 'Availability Date',
//            hintText: date == '' ? 'dd-mm-yy' : date,
//            suffixIcon: InkWell(
//                onTap: () async {
//                  DateTime? newDate = await showDatePicker(
//                      initialEntryMode: DatePickerEntryMode.calendarOnly,
//                      context: context,
//                      firstDate: DateTime(2000),
//                      lastDate: DateTime(2100),
//                      initialDate: dateTime);
//                  if (newDate == null) return;
//                  setState(() {
//                    day = newDate.day.toString();
//                    month = newDate.month.toString();
//                    year = newDate.year.toString();
//
//                    date = '$day/$month/$year';
//                  });
//                },
//                child: const Icon(Icons.date_range_outlined)),
//          ),
//          CustomTextField(
//              height: 64.h,
//              readOnly: true,
//              name: 'Original Country',
//              hintText:
//                  countryOrigin == '' ? 'Select a Country' : countryOrigin,
//              suffixIcon: InkWell(
//                onTap: () {
//                  showModalBottomSheet(
//                    context: context,
//                    builder: (context) {
//                      return ListView.builder(
//                          itemCount:
//                              DataFormCubit.get(context).countryList.length,
//                          itemBuilder: (context, index) => Column(
//                                mainAxisAlignment: MainAxisAlignment.center,
//                                children: [
//                                  InkWell(
//                                    onTap: () {
//                                      setState(() {
//                                        countryOrigin =
//                                            DataFormCubit.get(context)
//                                                .countryList[index]
//                                                .title!;
//                                        Navigator.of(context).pop();
//                                      });
//                                    },
//                                    child: Padding(
//                                      padding: const EdgeInsets.all(8.0),
//                                      child: DataFormCubit.get(context)
//                                                  .countryList[index]
//                                                  .title ==
//                                              null
//                                          ? const Center(
//                                              child: CircularProgressIndicator(
//                                                color: Colors.green,
//                                              ),
//                                            )
//                                          : Text(
//                                              DataFormCubit.get(context)
//                                                  .countryList[index]
//                                                  .title!,
//                                              style: TextStyle(
//                                                  color: Colors.black,
//                                                  fontSize: 20.sp),
//                                            ),
//                                    ),
//                                  ),
//                                ],
//                              ));
//                    },
//                  );
//                },
//                child: Icon(
//                  Icons.expand_more,
//                  size: 30.sp,
//                  color: ColorManager.blackColor,
//                ),
//              )),
//          CustomTextField(
//              height: 64.h,
//              readOnly: true,
//              name: 'Original State',
//              hintText: stateOrigin == '' ? 'Select a state' : stateOrigin,
//              suffixIcon: InkWell(
//                onTap: () {
//                  showModalBottomSheet(
//                    context: context,
//                    builder: (context) {
//                      return ListView.builder(
//                          itemCount:
//                              DataFormCubit.get(context).stateList.length,
//                          itemBuilder: (context, index) => Column(
//                                mainAxisAlignment: MainAxisAlignment.center,
//                                children: [
//                                  InkWell(
//                                    onTap: () {
//                                      setState(() {
//                                        stateOrigin = DataFormCubit.get(context)
//                                            .stateList[index]
//                                            .title!;
//                                        Navigator.of(context).pop();
//                                      });
//                                    },
//                                    child: Padding(
//                                      padding: const EdgeInsets.all(8.0),
//                                      child: DataFormCubit.get(context)
//                                                  .stateList[index]
//                                                  .title ==
//                                              null
//                                          ? const Center(
//                                              child: CircularProgressIndicator(
//                                                color: Colors.green,
//                                              ),
//                                            )
//                                          : Text(
//                                              DataFormCubit.get(context)
//                                                  .stateList[index]
//                                                  .title!,
//                                              style: TextStyle(
//                                                  color: Colors.black,
//                                                  fontSize: 20.sp),
//                                            ),
//                                    ),
//                                  ),
//                                ],
//                              ));
//                    },
//                  );
//                },
//                child: Icon(
//                  Icons.expand_more,
//                  size: 30.sp,
//                  color: ColorManager.blackColor,
//                ),
//              )),
//          CustomTextField(
//              height: 64.h,
//              readOnly: true,
//              name: 'Original City',
//              hintText: cityOrigin == '' ? 'Select a city' : cityOrigin,
//              suffixIcon: InkWell(
//                onTap: () {
//                  showModalBottomSheet(
//                    context: context,
//                    builder: (context) {
//                      return ListView.builder(
//                          itemCount: DataFormCubit.get(context).cityList.length,
//                          itemBuilder: (context, index) => Column(
//                                mainAxisAlignment: MainAxisAlignment.center,
//                                children: [
//                                  InkWell(
//                                    onTap: () {
//                                      setState(() {
//                                        cityOrigin = DataFormCubit.get(context)
//                                            .cityList[index]
//                                            .title!;
//                                        Navigator.of(context).pop();
//                                      });
//                                    },
//                                    child: Padding(
//                                      padding: const EdgeInsets.all(8.0),
//                                      child: DataFormCubit.get(context)
//                                                  .cityList[index]
//                                                  .title ==
//                                              null
//                                          ? const Center(
//                                              child: CircularProgressIndicator(
//                                                color: Colors.green,
//                                              ),
//                                            )
//                                          : Text(
//                                              DataFormCubit.get(context)
//                                                  .cityList[index]
//                                                  .title!,
//                                              style: TextStyle(
//                                                  color: Colors.black,
//                                                  fontSize: 20.sp),
//                                            ),
//                                    ),
//                                  ),
//                                ],
//                              ));
//                    },
//                  );
//                },
//                child: Icon(
//                  Icons.expand_more,
//                  size: 30.sp,
//                  color: ColorManager.blackColor,
//                ),
//              )),
//          CustomTextField(
//              height: 64.h,
//              readOnly: true,
//              name: 'Destination Country',
//              hintText: countryDestination == ''
//                  ? 'Select a country'
//                  : countryDestination,
//              suffixIcon: InkWell(
//                onTap: () {
//                  showModalBottomSheet(
//                    context: context,
//                    builder: (context) {
//                      return ListView.builder(
//                          itemCount:
//                              DataFormCubit.get(context).countryList.length,
//                          itemBuilder: (context, index) => Column(
//                                mainAxisAlignment: MainAxisAlignment.center,
//                                children: [
//                                  InkWell(
//                                    onTap: () {
//                                      setState(() {
//                                        countryDestination =
//                                            DataFormCubit.get(context)
//                                                .countryList[index]
//                                                .title!;
//                                        Navigator.of(context).pop();
//                                      });
//                                    },
//                                    child: Padding(
//                                      padding: const EdgeInsets.all(8.0),
//                                      child: DataFormCubit.get(context)
//                                                  .countryList[index]
//                                                  .title ==
//                                              null
//                                          ? const Center(
//                                              child: CircularProgressIndicator(
//                                                color: Colors.green,
//                                              ),
//                                            )
//                                          : Text(
//                                              DataFormCubit.get(context)
//                                                  .countryList[index]
//                                                  .title!,
//                                              style: TextStyle(
//                                                  color: Colors.black,
//                                                  fontSize: 20.sp),
//                                            ),
//                                    ),
//                                  ),
//                                ],
//                              ));
//                    },
//                  );
//                },
//                child: Icon(
//                  Icons.expand_more,
//                  size: 30.sp,
//                  color: ColorManager.blackColor,
//                ),
//              )),
//          CustomTextField(
//              height: 64.h,
//              readOnly: true,
//              name: 'Destination State',
//              hintText:
//                  stateDestination == '' ? 'Select a state' : stateDestination,
//              suffixIcon: InkWell(
//                onTap: () {
//                  showModalBottomSheet(
//                    context: context,
//                    builder: (context) {
//                      return ListView.builder(
//                          itemCount:
//                              DataFormCubit.get(context).stateList.length,
//                          itemBuilder: (context, index) => Column(
//                                mainAxisAlignment: MainAxisAlignment.center,
//                                children: [
//                                  InkWell(
//                                    onTap: () {
//                                      setState(() {
//                                        stateDestination =
//                                            DataFormCubit.get(context)
//                                                .stateList[index]
//                                                .title!;
//                                        Navigator.of(context).pop();
//                                      });
//                                    },
//                                    child: Padding(
//                                      padding: const EdgeInsets.all(8.0),
//                                      child: DataFormCubit.get(context)
//                                                  .stateList[index]
//                                                  .title ==
//                                              null
//                                          ? const Center(
//                                              child: CircularProgressIndicator(
//                                                color: Colors.green,
//                                              ),
//                                            )
//                                          : Text(
//                                              DataFormCubit.get(context)
//                                                  .stateList[index]
//                                                  .title!,
//                                              style: TextStyle(
//                                                  color: Colors.black,
//                                                  fontSize: 20.sp),
//                                            ),
//                                    ),
//                                  ),
//                                ],
//                              ));
//                    },
//                  );
//                },
//                child: Icon(
//                  Icons.expand_more,
//                  size: 30.sp,
//                  color: ColorManager.blackColor,
//                ),
//              )),
//          CustomTextField(
//              height: 64.h,
//              name: 'Destination City',
//              hintText:
//                  cityDestination == '' ? 'Select a city' : cityDestination,
//              readOnly: true,
//              suffixIcon: InkWell(
//                onTap: () {
//                  showModalBottomSheet(
//                    context: context,
//                    builder: (ctx) {
//                      return ListView.builder(
//                          itemCount: DataFormCubit.get(context).cityList.length,
//                          itemBuilder: (context, index) => Column(
//                                mainAxisAlignment: MainAxisAlignment.center,
//                                children: [
//                                  InkWell(
//                                    onTap: () {
//                                      setState(() {
//                                        cityDestination =
//                                            DataFormCubit.get(context)
//                                                .cityList[index]
//                                                .title!;
//                                        Navigator.of(context).pop();
//                                      });
//                                    },
//                                    child: Padding(
//                                      padding: const EdgeInsets.all(8.0),
//                                      child: DataFormCubit.get(context)
//                                                  .cityList[index]
//                                                  .title ==
//                                              null
//                                          ? const Center(
//                                              child: CircularProgressIndicator(
//                                                color: Colors.green,
//                                              ),
//                                            )
//                                          : Text(
//                                              DataFormCubit.get(context)
//                                                  .cityList[index]
//                                                  .title!,
//                                              style: TextStyle(
//                                                  color: Colors.black,
//                                                  fontSize: 20.sp),
//                                            ),
//                                    ),
//                                  ),
//                                ],
//                              ));
//                    },
//                  );
//                },
//                child: Icon(
//                  Icons.expand_more,
//                  size: 30.sp,
//                  color: ColorManager.blackColor,
//                ),
//              )),
//          SizedBox(
//            width: 1.sw,
//            child: const Divider(
//              thickness: 1,
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}
