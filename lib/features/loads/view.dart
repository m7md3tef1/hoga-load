import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/widgets/widgets/custom_appbar.dart';
import 'package:hoga_load/widgets/widgets/custom_row.dart';
import 'package:hoga_load/widgets/widgets/custom_scaffold.dart';
import 'package:hoga_load/widgets/widgets/custom_text.dart';

import 'cubit/getLoad_cubit.dart';
import 'cubit/getLoad_states.dart';

part 'units/body.dart';
class LoadsView extends StatelessWidget {
  const LoadsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomAppbar(title: 'Loads'),
            SizedBox(height: 22.h,),
             CustomSearchRow(2),
            SizedBox(height: 21.h,),
             Body()
          ],
        ),
      ),
    );
  }
}