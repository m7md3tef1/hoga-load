import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/features/jobs/cubit/getJop_states.dart';
import 'package:hoga_load/features/jobs/upload_jop/units/table_jop_title.dart';
import 'package:hoga_load/features/search_product/cubit/getProduct_cubit.dart';
import 'package:hoga_load/features/upload_product/add_view.dart';
import '../../../../core/color_manager/color_manager.dart';
import '../../../../core/dialoges/delete_dialoge.dart';
import '../../../../core/router/router.dart';
import '../../../../widgets/widgets/custom_text.dart';
import '../../../../widgets/widgets/uploaded_table_row.dart';
import '../../../../widgets/widgets/uploaded_table_title.dart';
import '../../cubit/getJop_cubit.dart';
import '../add_view.dart';

class MyJopTable extends StatelessWidget {
  const MyJopTable({super.key});

  @override
  Widget build(BuildContext context) {
    return uploadedTableJop(
      child: BlocConsumer<JopCubit, AddJopStates>(
          listener: (BuildContext context, Object? state) {},
          builder: (context, state) {
            return ListView.builder(
                itemCount: JopCubit.get(context).jopList.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: index.isEven ? Colors.grey[300] : Colors.white,
                    child: UploadedTableDataRow(
                      flex: 2,
                      origin: "${JopCubit.get(context).jopList[index].title}",
                      editFunc: () {
                        MagicRouter.navigateTo(AddJopView(
                            isEdit: true,
                            jopModel: JopCubit.get(context).jopList[index],
                            index: index));
                      },
                      deleteFunc: () {
                        JopCubit.get(context).deleteJopCubit(
                            JopCubit.get(context).jopList[index].id);
                      },
                      flex2: 5,
                      tableWeight:
                          " (${JopCubit.get(context).jopList[index].state == null ? "other" : JopCubit.get(context).jopList[index].state!.title}, "
                          " → "
                          "${JopCubit.get(context).jopList[index].city == null ? "other" : JopCubit.get(context).jopList[index].city!.title})",
                      tableNumber: "${index + 1}",
                    ),
                  );
                });
          }),
    );
  }
}


