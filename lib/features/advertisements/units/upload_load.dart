part of '../view.dart';

class UploadedLoad extends StatelessWidget {
  const UploadedLoad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      CustomCard(
        widget: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 11.sp),
        child: Column(
          children: [
            SizedBox(height: 18.h,),
            CustomCardTitle(text: 'UPLOADED LOADS',),
            CustomNoContainer(text: 'advertisements'),
            const Spacer(),
            const Button()


          ],
        ),
    ),
      );
  }
}
