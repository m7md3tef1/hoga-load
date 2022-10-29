part of '../view.dart';
class Instructions extends StatelessWidget {
  const Instructions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 1.sw,
          child: const Divider(thickness: 1,),),
        CustomTextField(
          height: 64.h,
          hintText: 'Weight ( in Kilogram )',
          suffixIcon: Icon(
            Icons.expand_more,
            size: 30.sp,
            color: ColorManager.blackColor,
          ),
        ),
        CustomTextField(
          height: 147.h,
          lines: 4,
          hintText: 'Instructions',
        ),
        SizedBox(
          height: 23.h,
        ),
        CustomButton(
            function: (){
              VehiclesCubit.get(context).addVehicle(VehicleModel(
                date: '10/27/2022',
                originCountry: "Canada" ,
                originState: "British Columbia" ,
                originCity: "Vancouver",
                destinationCountry:'Canada' ,
                destinationState:'Ontario' ,
                destinationCity: 'Brampton',
                equipmentTypes: 'Reefer',
                vehicleAttributes: 'Frozen',
                vehicleTypes: 'Mini Truck',
                vehicleSizes:'Full' ,
                weight: '200',
                instructions: 'dscdzvzv',
              ));

            },
            text: 'Add new vehicle', color: ColorManager.orange),      ],
    );
  }
}
