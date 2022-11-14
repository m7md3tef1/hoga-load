part of'../view.dart';
class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      widget: Column(
        children: [
        Plans(),
          Details(),
          const Facilities()



        ],
      ),
    );
  }
}

