part of'../view.dart';

class Form extends StatelessWidget {
  const Form({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      widget: Padding(
        padding: const EdgeInsets.only(top: 15,bottom: 40),
        child: Column(
          children: [
            CustomTextField(
              hintText: 'Your Name',
              height: 55.h,
              color: const Color(0xFF757575),
            ),
            CustomTextField(
              hintText: 'Your Email',
              height: 55.h,
              color: const Color(0xFF757575),
            ),
            CustomTextField(
              hintText: 'Subject',
              height: 55.h,
              color: const Color(0xFF757575),
            ),
            CustomTextField(
              height:170.h ,
              hintText: 'Message',
              lines:6,
              color: const Color(0xFF757575),
            ),
            CustomButton(
              text: 'Send Message', color: ColorManager.yellow,

            ),

          ],
        ),
      ),
    );
  }
}
