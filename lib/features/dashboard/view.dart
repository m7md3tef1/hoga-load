import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/core/color_manager/color_manager.dart';
import 'package:hoga_load/core/data/models/UpdateProfile_model.dart';
import 'package:hoga_load/widgets/widgets/custom_appbar.dart';
import 'package:hoga_load/widgets/widgets/custom_button.dart';
import 'package:hoga_load/widgets/widgets/custom_scaffold.dart';
import 'package:hoga_load/widgets/widgets/custom_text_field.dart';

import '../../core/data/local/cacheHelper.dart';
import '../../core/keys/keys.dart';
import '../../core/validator/validator.dart';
import '../../core/widgets/custom_card.dart';
import 'cubit/UpdateProfile_state.dart';
import 'cubit/updateProfile_cubit.dart';

part 'units/form.dart';
class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomAppbar(title: 'Dashboard'),
             FormView(),
          ],
        ),
      ),
    );
  }
}
