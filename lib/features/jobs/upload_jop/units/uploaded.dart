part of '../view.dart';

class Uploaded extends StatelessWidget {
  const Uploaded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      widget: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 11.sp),
        child:Column(
          children: [
            SizedBox(
              height: 18.h,
            ),
            CustomCardTitle(
              text: 'UPLOADED JOP',
            ),

            JopCubit.get(context).jopList.isEmpty
                ? Expanded(
              child: Column(
                children: [
                  CustomNoContainer(text: 'jop'),
                ],
              ),
            )
                : const MyJopTable(),
            Button()
          ],
        ),
      ),
    );
  }
}
