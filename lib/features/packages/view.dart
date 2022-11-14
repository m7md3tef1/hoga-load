import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/core/widgets/custom_card_title.dart';
import 'package:hoga_load/features/home/view.dart';
import 'package:hoga_load/widgets/widgets/custom_appbar.dart';
import 'package:hoga_load/widgets/widgets/custom_package.dart';
import 'package:hoga_load/widgets/widgets/custom_scaffold.dart';

import '../../core/router/router.dart';
import '../../core/widgets/custom_card.dart';
import '../../widgets/widgets/custom_button.dart';
import '../add_update_card/view.dart';
import 'cubit/package_cubit.dart';
import 'cubit/package_states.dart';

part 'units/body.dart';

GlobalKey<ScaffoldState> packagesScaffoldKey = GlobalKey<ScaffoldState>();

class PackagesView extends StatelessWidget {
  const PackagesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: packagesScaffoldKey,
      drawer: OnDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomAppbar(
                title: 'Packages',
                scaffoldKey: packagesScaffoldKey,
              ),
              Body(),
            ],
          ),
        ),
      ),
    );
  }
}
