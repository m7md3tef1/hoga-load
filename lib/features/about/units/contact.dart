part of'../view.dart';


class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomContainer(
                text:'232' ,
                hint:'Happy Customers' ,
                image: AppImages.happy,
              ),
            ),
            
            Expanded(
              child: CustomContainer(
                text:'521' ,
                hint: 'Vehicles',
                image: AppImages.vehicle,
              ),
            ),
          ],
        ),
        Row(
          children: [
            
            Expanded(
              child: CustomContainer(
                text:'1463' ,
                hint:'Products' ,
                image: AppImages.shoppingCart,
              ),
            ),
            
            Expanded(
              child: CustomContainer(
                text:'15' ,
                hint: 'Technical Staffs',
                image: AppImages.usersGroup,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
