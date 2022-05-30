import 'package:agdmm_design/constants.dart';
import 'package:flutter/material.dart';

class FirebaseDataBlock extends StatelessWidget {
  const FirebaseDataBlock({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: myTextStyle.copyWith(fontSize: 16)),
        Text(value, style: myTextStyle.copyWith(fontSize: 16)),
      ],
    );
  }
}
