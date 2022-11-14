import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/core/color_manager/color_manager.dart';
import 'package:hoga_load/features/search_product/cubit/getProduct_cubit.dart';
import 'package:hoga_load/features/search_product/model.dart';
import 'package:hoga_load/features/search_product/units/details.dart';
import 'package:hoga_load/features/upload_product/add_view.dart';
import 'package:hoga_load/widgets/widgets/custom_appbar.dart';
import 'package:hoga_load/widgets/widgets/custom_button.dart';
import 'package:hoga_load/widgets/widgets/custom_row.dart';
import 'package:hoga_load/widgets/widgets/custom_scaffold.dart';
import 'package:hoga_load/widgets/widgets/custom_text.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/router/router.dart';
import 'cubit/getProduct__states.dart';

part 'units/body.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomAppbar(title: 'Search Product'),
            SizedBox(
              height: 22.h,
            ),
            CustomSearchRow(
              3,
              function: () {
                MagicRouter.navigateTo(AddProductsView(
                  isFilter: true,
                ));
              },
            ),
            SizedBox(
              height: 21.h,
            ),
            Body()
          ],
        ),
      ),
    );
  }
}
