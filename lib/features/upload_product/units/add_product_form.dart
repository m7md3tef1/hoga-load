part of '../add_view.dart';

class Form extends StatefulWidget {
  const Form({Key? key}) : super(key: key);

  @override
  State<Form> createState() => _FormState();
}

class _FormState extends State<Form> {
  var country = '';

  var state = '';

  var city = '';
  var product = '';

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      widget: Column(
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
            lines: 1,
            name: 'Product for',
            hintText: 'Buy',
          ),
          CustomTextField(
            // name: '',
            height: 64.h,
            lines: 1,
            hintText: 'Name of the Product',
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
                                        country =
                                            DataFormCubit.get(context)
                                                .countryList[index]
                                                .title!;
                                        Navigator.of(context).pop();
                                      });
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
          CustomTextField(
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
                                        state = DataFormCubit.get(context)
                                            .stateList[index]
                                            .title!;
                                        Navigator.of(context).pop();
                                      });
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
          CustomTextField(
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
          SizedBox(
            width: 322.w,
            child: const Divider(
              thickness: 1,
            ),
          ),
          CustomTextField(
            height: 147.h,
            lines: 6,
          ),
          Padding(
            padding: EdgeInsets.only(top: 50.sp, bottom: 15.sp),
            child: CustomButton(
                text: 'Add new product', color: ColorManager.orange),
          ),
        ],
      ),
    );
  }
}
