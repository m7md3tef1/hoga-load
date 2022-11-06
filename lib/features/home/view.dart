import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/features/about/view.dart';
import 'package:hoga_load/features/add_update_card/view.dart';
import 'package:hoga_load/features/blogs/view.dart';
import 'package:hoga_load/features/change_password/view.dart';
import 'package:hoga_load/features/contactus/view.dart';
import 'package:hoga_load/features/dashboard/view.dart';
import 'package:hoga_load/features/home/states.dart';
import 'package:hoga_load/features/packages/view.dart';
import 'package:hoga_load/features/subscribtion_details/view.dart';
import 'package:hoga_load/features/upload_jop/view.dart';
import 'package:hoga_load/features/upload_product/view.dart';
import 'package:hoga_load/widgets/widgets/custom_rowdrawer.dart';
import '../../widgets/widgets/custom_scaffold.dart';
import '../loads/uploaded_loads/view.dart';
import '../vehicles/upload_vehicles/view.dart';
import 'controller.dart';

part 'units/drawer.dart';
part 'units/nav_bar.dart';
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      navBar: const _BottomBar(),
      drawer:const OnDrawer() ,
      body: BlocConsumer<HomeCubit, HomeStates>(
        listener: (_, s) {},
        builder: (context, s) {
          return HomeCubit.get(context)
              .bottomScreens[HomeCubit.get(context).currentIndex];
        },
      ),
    );
  }
}
