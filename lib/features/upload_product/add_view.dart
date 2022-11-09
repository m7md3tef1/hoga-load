import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/core/color_manager/color_manager.dart';
import 'package:hoga_load/core/data/models/product/GetProduct_model.dart';
import 'package:hoga_load/features/search_product/cubit/getProduct__states.dart';
import 'package:hoga_load/features/search_product/cubit/getProduct_cubit.dart';
import 'package:hoga_load/widgets/widgets/custom_appbar.dart';
import 'package:hoga_load/widgets/widgets/custom_button.dart';
import 'package:hoga_load/widgets/widgets/custom_scaffold.dart';
import 'package:hoga_load/widgets/widgets/custom_text.dart';
import 'package:hoga_load/widgets/widgets/custom_text_field.dart';

import '../../core/master_cubit/getDataForm_state.dart';
import '../../core/widgets/custom_card.dart';
import '../../core/master_cubit/getDataForm_cubit.dart';

part 'units/add_product_form.dart';

  class AddProductsView extends StatelessWidget {
    AddProductsView({Key? key,this.productModel,this.isEdit=false,this.index,this.isFilter=false}) : super(key: key);
  GetProductModel? productModel;
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
            CustomAppbar(title: isEdit?'Edit Products':isFilter?'Search Product':'Add Product'),
            Expanded(child: SingleChildScrollView(
                physics:BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(top: 22.0),
                  child: Form(productModel: productModel,isEdit: isEdit,index: index,isFilter: isFilter,),
                ))),

          ],
        ),
      ),
    );
  }
}
