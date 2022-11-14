import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

import '../../../../widgets/widgets/custom_text.dart';
import '../modelSwiper.dart';
class swiper2 extends StatelessWidget {
   swiper2({Key? key}) : super(key: key);
List image=[
  'assets/images/img3.png',
  'assets/images/img4.png',
  'assets/images/img5.png',
  'assets/images/img8.png',
  'assets/images/img7.png',
  'assets/images/img1.png',
  'assets/images/img2.png',
];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150.h,
        child: Swiper(
          autoplay: true,
          pagination: const SwiperPagination(
            alignment: Alignment.bottomCenter,
          ),
          itemCount: image.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(30.r),

              child: Image(
                  height: 46.h,
                  width: 132.w,
                  image: AssetImage(image[index])),
            );
          },
        ),
      ),
    );
  }
}
