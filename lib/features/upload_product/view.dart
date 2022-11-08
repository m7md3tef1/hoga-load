import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/features/loads/uploaded_loads/view.dart';
import 'package:hoga_load/features/search_product/cubit/getProduct_cubit.dart';
import 'package:hoga_load/features/upload_product/units/table_data.dart';
import 'package:hoga_load/widgets/widgets/custom_appbar.dart';
import 'package:hoga_load/widgets/widgets/custom_scaffold.dart';
import 'package:hoga_load/widgets/widgets/upgrade_member_ship.dart';
import '../../core/color_manager/color_manager.dart';
import '../../core/widgets/custom_card.dart';
import '../../core/widgets/custom_card_title.dart';
import '../../core/widgets/custom_no_container.dart';
part 'units/uploaded.dart';
class UploadProductsView extends StatefulWidget {
  const UploadProductsView({Key? key}) : super(key: key);

  @override
  State<UploadProductsView> createState() => _UploadProductsViewState();
}

class _UploadProductsViewState extends State<UploadProductsView> {
  @override
  void initState() {
    super.initState();
    ProductsCubit.get(context).getProduct(self: 1);
  }
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomAppbar(title: 'Uploaded Products'),
          const Expanded(child: Uploaded()),
        ],
      ),
    );
  }
}