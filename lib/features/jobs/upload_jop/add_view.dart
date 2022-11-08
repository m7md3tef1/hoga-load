import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/core/color_manager/color_manager.dart';
import 'package:hoga_load/core/data/models/jobs/GetJop_model.dart';
import 'package:hoga_load/core/data/models/product/GetProduct_model.dart';
import 'package:hoga_load/features/jobs/cubit/getJop_states.dart';
import 'package:hoga_load/features/search_product/cubit/getProduct__states.dart';
import 'package:hoga_load/features/search_product/cubit/getProduct_cubit.dart';
import 'package:hoga_load/widgets/widgets/custom_appbar.dart';
import 'package:hoga_load/widgets/widgets/custom_button.dart';
import 'package:hoga_load/widgets/widgets/custom_scaffold.dart';
import 'package:hoga_load/widgets/widgets/custom_text.dart';
import 'package:hoga_load/widgets/widgets/custom_text_field.dart';

import '../../../core/master_cubit/getDataForm_cubit.dart';
import '../../../core/master_cubit/getDataForm_state.dart';
import '../../../core/widgets/custom_card.dart';
import '../cubit/getJop_cubit.dart';


part 'units/add_jop_form.dart';

class AddJopView extends StatelessWidget {
  const AddJopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomAppbar(title: 'Add Jop'),


            const Expanded(child: SingleChildScrollView(
                physics:BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(top: 22.0),
                  child: FormInfo(),
                ))),
          ],
        ),
      ),
    );
  }
}
