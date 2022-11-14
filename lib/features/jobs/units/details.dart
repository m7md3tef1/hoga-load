import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/core/data/models/jobs/get_jop.dart';
import '../../../widgets/widgets/custom_appbar.dart';
import '../../../widgets/widgets/custom_container_jop_detail.dart';
import '../../../widgets/widgets/custom_scaffold.dart';
class Detail extends StatefulWidget {
  Detail(this.jop, {super.key}) ;
  GetJop? jop;

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomAppbar(title: 'View Jop'),
          Expanded(child: Column(
            children: [
              Expanded(child: CustomContainerJop(widget.jop!)),
            ],
          )),
          SizedBox(height: 22.h,)
        ],
      ),
    );
  }
}
