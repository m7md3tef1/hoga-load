part of '../add_view.dart';

class Form extends StatefulWidget {
  const Form({Key? key}) : super(key: key);

  @override
  State<Form> createState() => _FormState();
}

class _FormState extends State<Form> {
  String country = '';
  String state = '';
  String city = '';
  String product = '';
  String? buyOrSell;

  int? countryId;
  int? stateId;
  int? cityId;
  int? productId;
List productType=['Buy','Sell'];

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      widget: BlocConsumer<DataFormCubit,AddDataFormStates>(
          listener: (BuildContext context, state) {  },
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
                        text: 'ADD PRODUCT',
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
                readOnly: true,
                lines: 1,
                name: 'Product for',
                hintText: buyOrSell??'Buy',
                  suffixIcon: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return ListView.builder(
                              itemCount:
                              productType.length,
                              itemBuilder: (context, index) => Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        buyOrSell =
                                        productType[index];
                                        Navigator.of(context).pop();



                                      });

                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: productType[index]
                                           ==
                                          null
                                          ? const Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.green,
                                        ),
                                      )
                                          : Text(
                                          productType[index],
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
                // name: '',
                height: 64.h,
                lines: 1,
                hintText: 'Name of the Product',
                controller: ProductsCubit.get(context).nameController,
                color: Colors.grey,
              ),
              CustomTextField(

                  height: 64.h,
                  readOnly: true,
                  name: 'Country',
                  hintText:
                      country == '' ? 'Select a Country' : country,
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
                                            countryId= DataFormCubit.get(context)
                                                .countryList[index]
                                                .id!;
                                            country =
                                                DataFormCubit.get(context)
                                                    .countryList[index]
                                                    .title!;
                                            Navigator.of(context).pop();
                                            city='';
                                            state='';


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
              s is GetStateLoading?
              CustomText(text: 'Loading....',):CustomTextField(
                  height: 64.h,
                  readOnly: true,
                  name: 'state',
                  hintText: state == '' ? 'Select a state' : state,
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
                                            stateId= DataFormCubit.get(context)
                                                .stateList[index]
                                                .id!;
                                            state = DataFormCubit.get(context)
                                                .stateList[index]
                                                .title!;
                                            Navigator.of(context).pop();
                                            city='';

                                          });
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
              s is GetCityLoading?
              CustomText(text: 'Loading....',):CustomTextField(
                  height: 64.h,
                  readOnly: true,
                  name: 'City',
                  hintText: city == '' ? 'Select a city' : city,
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


              CustomTextField(
                  height: 64.h,
                  readOnly: true,
                  name: 'Product Type',
                  hintText: product == '' ? 'Select a product type' : product,
                  suffixIcon: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return ListView.builder(
                              itemCount: DataFormCubit.get(context).productList.length,
                              itemBuilder: (context, index) => Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        productId= DataFormCubit.get(context)
                                            .productList[index]
                                            .id!;
                                        product = DataFormCubit.get(context)
                                            .productList[index]
                                            .title!;
                                        Navigator.of(context).pop();
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: DataFormCubit.get(context)
                                          .productList[index]
                                          .title ==
                                          null
                                          ? const Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.green,
                                        ),
                                      )
                                          : Text(
                                        DataFormCubit.get(context)
                                            .productList[index]
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
                hintText: 'Price (CAD)',
                keyboardType: TextInputType.number,
                controller: ProductsCubit.get(context).priceController,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 14.w),
                child: Container(
                  height: 64.h,
                  width: 1.sw,
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorManager.greyColor),
                      color: ColorManager.whiteColor,
                      borderRadius: BorderRadius.circular(12.r)),
                  child: InkWell(
                    onTap: (){
                      ProductsCubit.get(context).pickFromGallery(context);
                    },
                    child: Row(
                      children: [
                        Container(
                          height: 64.h,
                          width: 106.w,
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(12.r)),
                          child: Center(
                            child: Text(
                              'Choose File',
                              style: TextStyle(
                                  color: const Color(0xFF757575),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            '    No File chosen',
                            style: TextStyle(
                                color: const Color(0xFF757575),
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
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
                controller: ProductsCubit.get(context).descController,
                hintText: 'Description',
              ),
    BlocListener<ProductsCubit,AddProductStates>(
    listener: (BuildContext context, state) {
    if(state is AddSuccess){
    Navigator.pop(context);
    }
    },
            child:Padding(
            padding: EdgeInsets.only(top: 50.sp, bottom: 15.sp),
                  child: CustomButton(
                      text: 'Add new product', color: ColorManager.yellow,
                  function: (){
                        ProductsCubit.get(context).addProductCubit(context: context
                            ,productModel:GetProductModel(buyOrSell:buyOrSell,
                                productName:ProductsCubit.get(context).nameController.text   ,
                                priceInt: int.parse(ProductsCubit.get(context).priceController.text),
                                productTypeId: productId,
                                country: countryId,
                                state: stateId,
                                city: cityId,
                                description: ProductsCubit.get(context).descController.text,
                                productImage: ProductsCubit.get(context).img64) );
                  },
                  ),
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
