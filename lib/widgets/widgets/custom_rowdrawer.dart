import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/router/router.dart';

class CustomRowDrawer extends StatelessWidget {
  CustomRowDrawer(
      {Key? key,
      required this.text,
      this.beforeNavigate,
      this.icon,
      this.navigatename})
      : super(key: key);
  String text;
  Function? beforeNavigate;
  var icon;
  var navigatename;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          if (beforeNavigate != null) {
            beforeNavigate!();
          }
          MagicRouter.navigateTo(navigatename);
        },
        child: Row(
          children: [
            icon == null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      height: 30.h,
                      width: 25.w,
                      image: const AssetImage(
                        'assets/images/blog.png',
                      ),
                      color: Colors.orange,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      icon,
                      color: Colors.orange,
                    ),
                  ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
