part of '../view.dart';


class contact extends StatelessWidget {
  const contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomContainer(
          text:'Emain Us' ,
          hint:'info@hegaload.com' ,
          image: AppImages.mail,
        ),
        CustomContainer(
          text:'Online Support' ,
          hint: '24 X 7',
          image: AppImages.clock,
        ),
      ],
    );
  }
}
