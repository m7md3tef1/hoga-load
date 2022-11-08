part of'../view.dart';
class PlanBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return

      Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15.sp),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: CustomText(
                text: 'SUBSCRIPTION PLANS',
                align: TextAlign.center,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFFDC52F),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: CustomText(
                text: 'CHECK OUR PRICING POLICY',
                align: TextAlign.center,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF000000),
              ),
            ),
            BlocConsumer<PlansCubit, PlansStates>(
             listener: (context, state) {},
            builder: (context, state) {
                return ListView.builder(
                  itemCount: PlansCubit.get(context).plansList.length>3?3:PlansCubit.get(context).plansList.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context,index){
                  return
                  BuyContainer(text:PlansCubit.get(context).plansList[index].title,
                  loadsNo:PlansCubit.get(context).plansList[index].totalNumberOfLoads,
                 vehiclesNo: PlansCubit.get(context).plansList[index].totalNumberOfVehicles,
              jobsNo: PlansCubit.get(context).plansList[index].totalNumberOfJobs,
              productNo: PlansCubit.get(context).plansList[index].totalNumberOfProducts,
              price: PlansCubit.get(context).plansList[index].price,
                image:'assets/images/30day.png');


    });
              }
            ),

]
      ));
  }
}
