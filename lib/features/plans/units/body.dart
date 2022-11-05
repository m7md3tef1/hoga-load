part of'../view.dart';
class PlanBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return

      Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15.sp),
        child: Column(
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
            BuyContainer('Free Trial 30 Days','30 Load Postings \n30 Truck Posts \n5 Buy-Sell Posts \n2 Career Posts','0','assets/images/30day.png'),
            BuyContainer('Bronze Plan','100 Load Postings \n100 Truck Posts \n10 Buy-Sell Posts \n5 Career Posts','35','assets/images/bronze.png'),
            BuyContainer('Silver Plan','300 Load Postings \n300 Truck Posts \n30 Buy-Sell Posts \n20 Career Posts','35','assets/images/silver.png'),
            BuyContainer('Gold Plan','600 Load Postings \n600 Truck Posts \n100 Buy-Sell Posts \n60 Career Posts','75','assets/images/gold.png'),        ],
        ),
      );
  }
}
