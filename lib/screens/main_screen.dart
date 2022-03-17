import 'package:agdmm_design/constants.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final zoomDrawerController;
  // ignore: use_key_in_widget_constructors
  const MainScreen({Key? key, this.zoomDrawerController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'AgDMM',
          style: TextStyle(fontWeight: FontWeight.bold, color: blackColor),
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              color: blackColor,
              onPressed: () {
                zoomDrawerController.toggle();
              },
              icon: const Icon(Icons.menu),
            );
          },
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
            // children: [],
            ),
      ),
    );
  }
}
