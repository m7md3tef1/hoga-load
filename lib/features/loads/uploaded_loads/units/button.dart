part of'../view.dart';

class Button extends StatelessWidget {
  Button({super.key,this.isUpgradeMember=false});
  bool isUpgradeMember;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 27.h),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: CustomButton(text: '+ Add',icon: Icons.add, color: ColorManager.yellow,
       function: (){
         isUpgradeMember? MagicRouter.navigateTo( PlanView()):

         MagicRouter.navigateTo( AddVehiclesView(isLoad: true,));
       },
        ),
      ),
    );
  }
}
