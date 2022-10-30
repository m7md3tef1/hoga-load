part of '../view.dart';

class FormInfo extends StatefulWidget {
   FormInfo({Key? key,this.isFilter=false}) : super(key: key);
bool isFilter;
  @override
  State<FormInfo> createState() => _FormInfoState();
}

class _FormInfoState extends State<FormInfo> {
  var countryOrigin = '';
  var stateOrigin = '';
  var cityOrigin = '';
  var countryDestination = '';
  var stateDestination = '';
  var cityDestination = '';
  var day = '';
  var month = '';
  var year = '';
  String date = '';

  DateTime dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      widget: BlocConsumer<DataFormCubit,AddDataFormStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, state) {

          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 17.h, horizontal: 14.w),
                child:widget.isFilter?
                const SizedBox():
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(Icons.arrow_back_sharp),
                    Expanded(
                      child: CustomText(
                        text: 'ADD VEHICLE',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ),
              widget.isFilter?
              const SizedBox(): SizedBox(
                width: 1.sw,
                child: const Divider(
                  thickness: 1,
                ),
              ),
              widget.isFilter?
              const SizedBox():CustomTextField(
                height: 64.h,
                readOnly: true,
                name: 'Availability Date',
                hintText:
                    date == '' ? 'dd-mm-yy' : date,
                suffixIcon: InkWell(
                    onTap: () async {
                      DateTime? newDate = await showDatePicker(
                          context: context,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                          initialDate: dateTime);
                      if (newDate == null) return;
                      day = newDate.day.toString();
                      month = newDate.month.toString();
                      year = newDate.year.toString();

                      date = '$day/$month/$year';
                      setState(() {
                        dateTime = newDate;
                      });
                    },
                    child: const Icon(Icons.date_range_outlined)),
              ),

              CustomTextField(
                  height: 64.h,
                  readOnly: true,
                  name: 'Original Country',
                  hintText:
                      countryOrigin == '' ? 'Select a Country' : countryOrigin,
                  suffixIcon: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return ListView.builder(
                              itemCount:
                                  DataFormCubit.get(context).countryList.length,
                              itemBuilder: (context, index) => Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            countryOrigin =
                                                DataFormCubit.get(context)
                                                    .countryList[index]
                                                    .title!;
                                            Navigator.of(context).pop();
                                            DataFormCubit.get(context).countryOriginID=DataFormCubit.get(context)
                                                .countryList[index]
                                                .id!.toString();
                                          });
                                          DataFormCubit.get(context).getState(
                                              DataFormCubit.get(context)
                                              .countryList[index]
                                              .id!);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child:DataFormCubit.get(context).countryList[index].title==null?
                                          const Center(child: CircularProgressIndicator(color: Colors.green,),): Text(
                                            DataFormCubit.get(context)
                                                .countryList[index]
                                                .title!,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20.sp),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ));
                        },
                      );
                    },
                    child: Icon(
                      Icons.expand_more,
                      size: 30.sp,
                      color: ColorManager.blackColor,
                    ),
                  )),
          state is GetStateLoading?
          CustomText(text: 'Loading....',):
          CustomTextField(
                  height: 64.h,
                  readOnly: true,
                  name: 'Original State',
                  hintText: stateOrigin == '' ? 'Select a state' : stateOrigin,
                  suffixIcon: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return ListView.builder(
                              itemCount:
                                  DataFormCubit.get(context).stateList.length,
                              itemBuilder: (context, index) => Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            stateOrigin = DataFormCubit.get(context)
                                                .stateList[index]
                                                .title!;
                                            Navigator.of(context).pop();
                                            DataFormCubit.get(context).stateOriginID=DataFormCubit.get(context)
                                                .stateList[index]
                                                .id!.toString();
                                          });
                                          print('sssssssss');
                                          DataFormCubit.get(context).getCity
                                            (DataFormCubit.get(context)
                                              .stateList[index]
                                              .title!);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: DataFormCubit.get(context)
                                                      .stateList[index]
                                                      .title ==
                                                  null
                                              ? const Center(
                                                  child: CircularProgressIndicator(
                                                    color: Colors.green,
                                                  ),
                                                )
                                              : Text(
                                                  DataFormCubit.get(context)
                                                      .stateList[index]
                                                      .title!,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20.sp),
                                                ),
                                        ),
                                      ),
                                    ],
                                  ));
                        },
                      );
                    },
                    child: Icon(
                      Icons.expand_more,
                      size: 30.sp,
                      color: ColorManager.blackColor,
                    ),
                  )),
              state is GetCityLoading?
              CustomText(text: 'Loading....',):
                CustomTextField(
                  height: 64.h,
                  readOnly: true,
                  name: 'Original City',
                  hintText: cityOrigin == '' ? 'Select a city' : cityOrigin,
                  suffixIcon: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return ListView.builder(
                              itemCount: DataFormCubit.get(context).cityList.length,
                              itemBuilder: (context, index) => Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            cityOrigin = DataFormCubit.get(context)
                                                .cityList[index]
                                                .title!;
                                            Navigator.of(context).pop();
                                            DataFormCubit.get(context).cityOriginID=DataFormCubit.get(context)
                                                .cityList[index]
                                                .id!.toString();
                                          });

                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: DataFormCubit.get(context)
                                                      .cityList[index]
                                                      .title ==
                                                  null
                                              ? const Center(
                                                  child: CircularProgressIndicator(
                                                    color: Colors.green,
                                                  ),
                                                )
                                              : Text(
                                                  DataFormCubit.get(context)
                                                      .cityList[index]
                                                      .title!,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20.sp),
                                                ),
                                        ),
                                      ),
                                    ],
                                  ));
                        },
                      );
                    },
                    child: Icon(
                      Icons.expand_more,
                      size: 30.sp,
                      color: ColorManager.blackColor,
                    ),
                  )),
              CustomTextField(
                  height: 64.h,
                  readOnly: true,
                  name: 'Destination Country',
                  hintText: countryDestination == ''
                      ? 'Select a country'
                      : countryDestination,
                  suffixIcon: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return ListView.builder(
                              itemCount:
                                  DataFormCubit.get(context).countryList.length,
                              itemBuilder: (context, index) => Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            countryDestination =
                                                DataFormCubit.get(context)
                                                    .countryList[index]
                                                    .title!;
                                            Navigator.of(context).pop();
                                            DataFormCubit.get(context).countryDestinationID=DataFormCubit.get(context)
                                                .countryList[index]
                                                .id!.toString();
                                          });
                                          DataFormCubit.get(context).getDestintionState( DataFormCubit.get(context)
                                              .countryList[index]
                                              .id!);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: DataFormCubit.get(context)
                                                      .countryList[index]
                                                      .title ==
                                                  null
                                              ? const Center(
                                                  child: CircularProgressIndicator(
                                                    color: Colors.green,
                                                  ),
                                                )
                                              : Text(
                                                  DataFormCubit.get(context)
                                                      .countryList[index]
                                                      .title!,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20.sp),
                                                ),
                                        ),
                                      ),
                                    ],
                                  ));
                        },
                      );
                    },
                    child: Icon(
                      Icons.expand_more,
                      size: 30.sp,
                      color: ColorManager.blackColor,
                    ),
                  )),
              state is GetDestintionStateLoading?
              CustomText(text: 'Loading....',):CustomTextField(
                  height: 64.h,
                  readOnly: true,
                  name: 'Destination State',
                  hintText:
                      stateDestination == '' ? 'Select a state' : stateDestination,
                  suffixIcon: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return ListView.builder(
                              itemCount:
                                  DataFormCubit.get(context).stateList.length,
                              itemBuilder: (context, index) => Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            stateDestination =
                                                DataFormCubit.get(context)
                                                    .stateList[index]
                                                    .title!;
                                            Navigator.of(context).pop();
                                            DataFormCubit.get(context).stateDestinationID=DataFormCubit.get(context)
                                                .stateList[index]
                                                .id!.toString();
                                          });
                                          DataFormCubit.get(context).getDestintionCity( DataFormCubit.get(context)
                                              .stateList[index]
                                              .title!);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: DataFormCubit.get(context)
                                                      .stateList[index]
                                                      .title ==
                                                  null
                                              ? const Center(
                                                  child: CircularProgressIndicator(
                                                    color: Colors.green,
                                                  ),
                                                )
                                              : Text(
                                                  DataFormCubit.get(context)
                                                      .stateList[index]
                                                      .title!,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20.sp),
                                                ),
                                        ),
                                      ),
                                    ],
                                  ));
                        },
                      );
                    },
                    child: Icon(
                      Icons.expand_more,
                      size: 30.sp,
                      color: ColorManager.blackColor,
                    ),
                  )),
              state is GetDestintionCityLoading?
              CustomText(text: 'Loading....',):CustomTextField(
                  height: 64.h,
                  name: 'Destination City',
                  hintText:
                      cityDestination == '' ? 'Select a city' : cityDestination,
                  readOnly: true,
                  suffixIcon: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (ctx) {
                          return ListView.builder(
                              itemCount: DataFormCubit.get(context).cityList.length,
                              itemBuilder: (context, index) => Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            cityDestination =
                                                DataFormCubit.get(context)
                                                    .cityList[index]
                                                    .title!;
                                            Navigator.of(context).pop();
                                            DataFormCubit.get(context).cityDestinationID=DataFormCubit.get(context)
                                                .cityList[index]
                                                .id!.toString();
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: DataFormCubit.get(context)
                                                      .cityList[index]
                                                      .title ==
                                                  null
                                              ? const Center(
                                                  child: CircularProgressIndicator(
                                                    color: Colors.green,
                                                  ),
                                                )
                                              : Text(
                                                  DataFormCubit.get(context)
                                                      .cityList[index]
                                                      .title!,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20.sp),
                                                ),
                                        ),
                                      ),
                                    ],
                                  ));
                        },
                      );
                    },
                    child: Icon(
                      Icons.expand_more,
                      size: 30.sp,
                      color: ColorManager.blackColor,
                    ),
                  )),

              SizedBox(
                width: 1.sw,
                child: const Divider(
                  thickness: 1,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
