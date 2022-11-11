import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/core/color_manager/color_manager.dart';
import 'package:hoga_load/core/router/router.dart';
import 'package:hoga_load/core/widgets/custom_card.dart';
import 'package:hoga_load/core/widgets/custom_card_title.dart';
import 'package:hoga_load/core/widgets/custom_no_container.dart';
import 'package:hoga_load/features/loads/cubit/getLoad_states.dart';
import 'package:hoga_load/features/vehicles/add_vehicle/view.dart';
import 'package:hoga_load/widgets/widgets/custom_appbar.dart';
import 'package:hoga_load/widgets/widgets/custom_button.dart';
import 'package:hoga_load/widgets/widgets/custom_scaffold.dart';
import '../../../widgets/widgets/upgrade_member_ship.dart';
import '../../../widgets/widgets/uploaded_table_row.dart';
import '../../../widgets/widgets/uploaded_table_title.dart';
import '../../plans/view.dart';
import '../add_load/add_load_view.dart';
import '../cubit/getLoad_cubit.dart';
part '../uploaded_loads/units/button.dart';
part '../uploaded_loads/units/my_table.dart';
part '../uploaded_loads/units/upload_load.dart';
class UploadedLoadsView extends StatefulWidget {
  const UploadedLoadsView({Key? key}) : super(key: key);

  @override
  State<UploadedLoadsView> createState() => _UploadedLoadsViewState();
}

class _UploadedLoadsViewState extends State<UploadedLoadsView> {
  @override
  void initState() {
    super.initState();
    LoadsCubit.get(context).getLoad(self: 1,isFilter: false,context: context);
  }
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppbar(title: 'Uploaded Products'),
            const Expanded(child: UploadedLoad()),

          ],
        ),
      ),
    );
  }
}
