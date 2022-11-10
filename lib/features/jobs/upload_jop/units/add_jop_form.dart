part of '../add_view.dart';

class FormInfo extends StatefulWidget {
  FormInfo({Key? key,this.isFilter=false,this.jopModel,this.isEdit=false,this.index}) : super(key: key);
  bool isFilter;
  GetJop? jopModel;
  bool isEdit;
  int? index;
  @override
  State<FormInfo> createState() => _FormInfoState();
}

class _FormInfoState extends State<FormInfo> {
  String country = '';
  String state = '';
  String city = '';
  String? jopCategory = '';
  String? jopTitle='';
  String? jopType='';


  int? jopCategoryId;
  int? jopTypeId1;
  int? countryId;
  int? stateId;
  int? cityId;
  @override
  void initState() {
    super.initState();
    if(widget.isEdit){
      country=widget.jopModel!.country!.title!;
      state=widget.jopModel!.state!.title!;
      city=widget.jopModel!.city!.title!;
      jopCategory=widget.jopModel!.country!.title!;
    //  jopTitle=widget.jopModel!.title!;
      jopType=widget.jopModel!.jobType!.title!;

      jopCategoryId =widget.jopModel!.category!.id!;
      jopTypeId1 =widget.jopModel!.jobType!.id!;
      countryId =widget.jopModel!.country!.id!;
      stateId =widget.jopModel!.state!.id!;
      cityId =widget.jopModel!.city!.id!;


      JopCubit.get(context).descController.text=widget.jopModel!.description!;
      JopCubit.get(context).titleController.text=widget.jopModel!.title!;
      JopCubit.get(context).shiftController.text=widget.jopModel!.shiftTime!;
      JopCubit.get(context).salaryController.text=widget.jopModel!.salary!;
      JopCubit.get(context).noOfPostController.text=widget.jopModel!.noOfPosts!.toString();


//     VehiclesCubit.get(context).equipmentBoxValue![widget.index!]==null?true:null;
//     VehiclesCubit.get(context).attributesBoxValue![widget.index!]==null?true:null;
//     //VehiclesCubit.get(context).vehcleSizeBoxValue![widget.index!]==null?true:null;
//     print(VehiclesCubit.get(context).vehcleSizeBoxValue!.length);
//     print(widget.index!);
//     print('nda');

      // VehiclesCubit.get(context).vehcleTypeBoxValue![widget.index!]=true;




    }else{
      //VehiclesCubit.get(context).equipmentBoxValue=List.filled(VehiclesCubit.get(context).equipmentList.length,false);
      //  VehiclesCubit.get(context).attributesBoxValue=List.filled(VehiclesCubit.get(context).attributesList.length,false);
      //  VehiclesCubit.get(context).vehcleTypeBoxValue=List.filled(VehiclesCubit.get(context).vehiclesTypeList.length,false);
      //  VehiclesCubit.get(context).vehcleSizeBoxValue=List.filled(VehiclesCubit.get(context).vehicleSizeList.length,false);

    }
  }
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      widget: BlocConsumer<DataFormCubit, AddDataFormStates>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, s) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.arrow_back_sharp,
                      ),
                      Expanded(
                        child: CustomText(
                          text: 'ADD JOP',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 1.sw,
                  child: const Divider(
                    thickness: 1,
                  ),
                ),
                CustomTextField(
                    height: 64.h,
                    readOnly: false,
                    lines: 1,
                    name: 'Jop Title',
                    hintText: jopTitle == '' ? 'Enter jop title' : jopTitle,
                    controller: JopCubit.get(context).titleController,
                ),

                CustomTextField(
                    height: 64.h,
                    readOnly: true,
                    name: 'Country',
                    hintText: country == '' ? '--SELECT A COUNTRY--' : country,
                    suffixIcon: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return ListView.builder(
                                itemCount: DataFormCubit.get(context)
                                    .countryList
                                    .length,
                                itemBuilder: (context, index) => Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              countryId =
                                                  DataFormCubit.get(context)
                                                      .countryList[index]
                                                      .id!;
                                              country =
                                                  DataFormCubit.get(context)
                                                      .countryList[index]
                                                      .title!;
                                              Navigator.of(context).pop();
                                              city = '';
                                              state = '';
                                            });
                                            DataFormCubit.get(context).getState(
                                                DataFormCubit.get(context)
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
                                                    child:
                                                        CircularProgressIndicator(
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
                s is GetStateLoading
                    ? CustomText(
                        text: 'Loading....',
                      )
                    : CustomTextField(
                        height: 64.h,
                        readOnly: true,
                        name: 'state',
                        hintText: state == '' ? '--SELECT A STATE--' : state,
                        suffixIcon: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return ListView.builder(
                                    itemCount: DataFormCubit.get(context)
                                        .stateList
                                        .length,
                                    itemBuilder: (context, index) => Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  stateId =
                                                      DataFormCubit.get(context)
                                                          .stateList[index]
                                                          .id!;
                                                  state =
                                                      DataFormCubit.get(context)
                                                          .stateList[index]
                                                          .title!;
                                                  Navigator.of(context).pop();
                                                  city = '';
                                                });
                                                DataFormCubit.get(context)
                                                    .getCity(DataFormCubit.get(
                                                            context)
                                                        .stateList[index]
                                                        .title!);
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: DataFormCubit.get(
                                                                context)
                                                            .stateList[index]
                                                            .title ==
                                                        null
                                                    ? const Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: Colors.green,
                                                        ),
                                                      )
                                                    : Text(
                                                        DataFormCubit.get(
                                                                context)
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
                s is GetCityLoading
                    ? CustomText(
                        text: 'Loading....',
                      )
                    : CustomTextField(
                    height: 64.h,
                    readOnly: true,
                    name: 'City',
                    hintText: city == '' ? '--SELECT A CITY--' : city,
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
                                          cityId= DataFormCubit.get(context)
                                              .cityList[index]
                                              .id!;
                                          city = DataFormCubit.get(context)
                                              .cityList[index]
                                              .title!;
                                          Navigator.of(context).pop();
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
                  width: 322.w,
                  child: const Divider(
                    thickness: 1,
                  ),
                ),

                CustomTextField(
                    height: 64.h,
                    readOnly: true,
                    name: 'Jop Category',
                    hintText: jopCategory == ''
                        ? '--SELECT A JOP CATEGORY--'
                        : jopCategory,
                    suffixIcon: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return ListView.builder(
                                itemCount: DataFormCubit.get(context)
                                    .jopCategoryList
                                    .length,
                                itemBuilder: (context, index) => Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              jopCategoryId =
                                                  DataFormCubit.get(context)
                                                      .jopCategoryList[index]
                                                      .id!;
                                              jopCategory =
                                                  DataFormCubit.get(context)
                                                      .jopCategoryList[index]
                                                      .title!;
                                              Navigator.of(context).pop();
                                            });
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: DataFormCubit.get(context)
                                                        .jopCategoryList[index]
                                                        .title ==
                                                    null
                                                ? const Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: Colors.green,
                                                    ),
                                                  )
                                                : Text(
                                                    DataFormCubit.get(context)
                                                        .jopCategoryList[index]
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
                    name: 'Jop Type',
                    hintText: jopType == ''
                        ? '--SELECT A JOP Type--'
                        : jopType,
                    suffixIcon: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return ListView.builder(
                                itemCount: DataFormCubit.get(context)
                                    .jopTypeList
                                    .length,
                                itemBuilder: (context, index) => Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              jopTypeId1 =
                                                  DataFormCubit.get(context)
                                                      .jopTypeList[index]
                                                      .id!;
                                              jopType =
                                                  DataFormCubit.get(context)
                                                      .jopTypeList[index]
                                                      .title!;
                                              Navigator.of(context).pop();
                                            });
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: DataFormCubit.get(context)
                                                        .jopTypeList[index]
                                                        .title ==
                                                    null
                                                ? const Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: Colors.green,
                                                    ),
                                                  )
                                                : Text(
                                                    DataFormCubit.get(context)
                                                        .jopTypeList[index]
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
                  hintText: 'Enter Financial Package to Offer',
                  name: 'Salary',
               //   keyboardType: TextInputType.number,
                     controller: JopCubit.get(context).salaryController,
                ),
                CustomTextField(
                  height: 64.h,
                  hintText: 'Enter Number of candidate you are hiring',
                  name: 'Number of Available Posts',
                  keyboardType: TextInputType.number,
                  controller: JopCubit.get(context).noOfPostController,
                ),
                CustomTextField(
                  height: 64.h,
                  hintText: 'Enter details about shifts and timings',
                  name: 'Shift Time',
                  //  keyboardType: TextInputType.number,
                  controller: JopCubit.get(context).shiftController,
                ),
                SizedBox(
                  width: 322.w,
                  child: const Divider(
                    thickness: 1,
                  ),
                ),
                CustomTextField(
                  height: 147.h,
                  lines: 6,
                  controller: JopCubit.get(context).descController,
                  hintText: 'Description',
                ),
                if(s is AddJopLoading)
                   Padding(
                    padding: EdgeInsets.only(top: 50.sp, bottom: 15.sp),
                    child:const Center(child:  CircularProgressIndicator()),
                  ),

                BlocListener<JopCubit, AddJopStates>(
                  listener: (BuildContext context, state) {
                    if (state is AddSuccessJop) {
                      Navigator.pop(context);
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 50.sp, bottom: 15.sp),
                    child: CustomButton(
                      text: widget.isEdit?'Edit Jop':'Add new Jop',
                      color: ColorManager.yellow,
                      function: () {
                        widget.isEdit?
                        JopCubit.get(context).editJopCubit(GetJopModel(
                          jopCategortId:jopCategoryId ,
                          jopTypeId:jopTypeId1 ,
                          title: JopCubit.get(context).titleController.text,
                          salaryInt: int.parse(JopCubit.get(context).salaryController.text),
                          noOfPosts: int.parse(JopCubit.get(context).noOfPostController.text),
                          shiftTime: JopCubit.get(context).shiftController.text,
                          country2: countryId,
                          state2: stateId,
                          city2: cityId,
                          description: JopCubit.get(context).descController.text,))
                            :
                        JopCubit.get(context).addJopCubit(
                            context: context,
                            productModel: GetJopModel(
                                jopCategortId:jopCategoryId ,
                                jopTypeId:jopTypeId1 ,
                                title: JopCubit.get(context).titleController.text,
                                salaryInt: int.parse(JopCubit.get(context).salaryController.text),
                                noOfPosts: int.parse(JopCubit.get(context).noOfPostController.text),
                                shiftTime: JopCubit.get(context).shiftController.text,
                                country2: countryId,
                                state2: stateId,
                                city2: cityId,
                                description: JopCubit.get(context).descController.text,));
                      },
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
