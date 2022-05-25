import 'package:agdmm_design/constants.dart';
import 'package:agdmm_design/screens/main_screen.dart';
import 'package:agdmm_design/screens/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  String? title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final ZoomDrawerController drawerController;

  @override
  void initState() {
    drawerController = ZoomDrawerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZoomDrawer(
        controller: drawerController,
        style: DrawerStyle.Style1,
        menuScreen: const MenuScreen(),
        mainScreen: MainScreen(
          zoomDrawerController: drawerController,
        ),
        borderRadius: 24.0,
        showShadow: true,
        angle: -5.0,
        slideWidth: MediaQuery.of(context).size.width * 0.63,
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.easeOut,
        shadowLayer1Color: mediumPurpleColor,
        shadowLayer2Color: darkPurpleColor,
      ),
    );
  }
}
