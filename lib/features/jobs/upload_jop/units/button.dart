part of '../view.dart';

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 27.h),
      child: Align(
        alignment: Alignment.bottomCenter,

        child: CustomButton(
          text: '+ Add',
          icon: Icons.add,
          color: ColorManager.yellow,
          function: () {
            MagicRouter.navigateTo(const AddJopView());
          },
        ),
      ),
    );
  }
}
