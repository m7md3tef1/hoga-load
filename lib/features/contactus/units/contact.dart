part of'../view.dart';

class contact extends StatelessWidget {
  const contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: CustomContainer(
            text: 'Email Us',
            hint: 'info@hegaload.com',
            image: AppImages.mail,
          ),
        ),
        Expanded(
          flex: 1,
          child: CustomContainer(
            text: 'Online Support',
            hint: '24 X 7',
            image: AppImages.clock,
          ),
        ),
        SizedBox(width: 15.h)
      ],
    );
  }
}
