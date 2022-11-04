import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/features/home/units/homebage/bottom.dart';
import 'package:hoga_load/widgets/widgets/custom_appbar.dart';
import 'package:hoga_load/widgets/widgets/custom_scaffold.dart';

import '../../about/view.dart';

import 'homebage/body.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomAppbar(title: 'Home Screen'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const body(),
                  SizedBox(
                    height: 38.h,
                  ),
                  const Video(),
                  const Values(),
                  const Contact(),
                  const Bottom(),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
