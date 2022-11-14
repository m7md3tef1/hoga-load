part of'../view.dart';

class _BottomBar extends StatelessWidget {
  const _BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (_, s) {},
      builder: (context, state) => BottomNavigationBar(

          currentIndex: HomeCubit.get(context).currentIndex,
          onTap: (i) {
            HomeCubit.get(context).changeBottom(i,context);
          },
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(
              color:  Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 15.sp),
          unselectedLabelStyle: TextStyle(
              color: Colors.grey, fontSize: 12.sp, fontWeight: FontWeight.w400),
          unselectedItemColor: Colors.grey,
          selectedItemColor:  Colors.black,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: buildColumn(context,  0),
              label: 'Home'),
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: buildColumn(context,  1),
                label: 'Market'),
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: buildColumn(context, 2),
                label: 'Loads'),
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: buildColumn(context,  3),
                label: 'Vehicles'),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: buildColumn(context, 4),
              label: 'Jobs',
            ),
          ]),
    );
  }

  Column buildColumn(BuildContext context, index) {
    return Column(
      children: [
        SizedBox(
          height: 2.h,
        ),
        HomeCubit.get(context).currentIndex == index
            ? SizedBox(
                height: 5.h,
              )
            : const SizedBox()
      ],
    );
  }
}
