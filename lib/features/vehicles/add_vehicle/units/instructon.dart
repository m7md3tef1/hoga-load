part of'../view.dart';
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
          keyboardType: TextInputType.number,
          controller: VehiclesCubit.get(context).weightController,
        ),
        CustomTextField(
          height: 147.h,
          lines: 4,
          hintText: 'Instructions',
          controller:  VehiclesCubit.get(context).instructionsController,
        ),
        SizedBox(
          height: 23.h,
        ),
      ],
    );
  }
}
