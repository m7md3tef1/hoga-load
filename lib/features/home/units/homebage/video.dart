import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Video extends StatelessWidget {
  const Video({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 216.h,
      width: 1.sw,
      decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          image: const DecorationImage(image: AssetImage('assets/images/Rectangle 6.png'),fit: BoxFit.cover)
      ),
    )
    ;
  }
}
