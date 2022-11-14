import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/core/color_manager/color_manager.dart';
import 'package:hoga_load/core/data/models/jobs/GetJop_model.dart';
import 'package:hoga_load/features/jobs/cubit/getJop_states.dart';
import 'package:hoga_load/widgets/widgets/custom_appbar.dart';
import 'package:hoga_load/widgets/widgets/custom_button.dart';
import 'package:hoga_load/widgets/widgets/custom_scaffold.dart';
import 'package:hoga_load/widgets/widgets/custom_text.dart';
import 'package:hoga_load/widgets/widgets/custom_text_field.dart';

import '../../../core/data/models/jobs/get_jop.dart';
import '../../../core/master_cubit/getDataForm_cubit.dart';
import '../../../core/master_cubit/getDataForm_state.dart';
import '../../../core/widgets/custom_card.dart';
import '../cubit/getJop_cubit.dart';

part 'units/add_jop_form.dart';

class AddJopView extends StatelessWidget {
  AddJopView(
      {Key? key,
      this.jopModel,
      this.isEdit = false,
      this.index,
      this.isFilter = false})
      : super(key: key);
  GetJop? jopModel;
  bool isEdit;
  bool isFilter;

  int? index;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomAppbar(
                title: isEdit
                    ? 'Edit Job'
                    : isFilter
                        ? 'Search Job'
                        : 'Add Job'),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 22),
                        child: FormInfo(
                          jopModel: jopModel,
                          isEdit: isEdit,
                          index: index,
                          isFilter: isFilter,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
