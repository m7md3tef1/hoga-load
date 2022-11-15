import 'package:flutter/material.dart';

import '../../core/color_manager/color_manager.dart';

class CustomScaffold extends StatelessWidget {
  var appBar;
  var body;
  var navBar;
  var drawer;
  GlobalKey<ScaffoldState>? scaffoldKey;


  CustomScaffold({Key? key, this.appBar, this.drawer, this.body, this.navBar,this.scaffoldKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: ColorManager.backgroundColor,
        bottomNavigationBar: navBar,
        body: body,
        drawer: drawer,
      ),
    );
  }
}
