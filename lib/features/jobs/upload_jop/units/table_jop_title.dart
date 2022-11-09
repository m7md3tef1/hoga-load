import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets/widgets/custom_text.dart';
class uploadedTableJop extends StatelessWidget {
  uploadedTableJop({super.key, required this.child});
  Widget child;

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: ListView(
          children: [
            SizedBox(
              height: 0.7.sh,

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                    child: Container(
                        height: 43.h,
                        width: 1.sw,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex:1,
                              child: CustomText(
                                text: "#",
                                fontSize: 9.sp,
                                align: TextAlign.start,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Expanded(
                              flex:2,
                              child: CustomText(
                                text: "Job Title",
                                fontSize: 9.sp,
                                align: TextAlign.start,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Expanded(
                              flex:2,
                              child: CustomText(
                                text: "Other Details",
                                fontSize: 9.sp,
                                align: TextAlign.start,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Expanded(
                              flex:2,
                              child: CustomText(
                                text: "View(s)",
                                fontSize: 9.sp,
                                align: TextAlign.start,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                          ],
                        )

                    ),
                  ),
                  Expanded(child: child)

                ],
              ),

            ),
          ]),
    );
  }
}