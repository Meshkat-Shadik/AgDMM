import 'package:flutter/material.dart';

class LogoHeader extends StatelessWidget {
  const LogoHeader({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.color,
    required this.isCenter,
    required this.leftPaddingValue,
  }) : super(key: key);

  final String imagePath;
  final String title;
  final Color color;
  final bool isCenter;
  final double leftPaddingValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftPaddingValue),
      child: Column(
        crossAxisAlignment:
            isCenter ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: Image.asset(
              imagePath,
              scale: 10,
              fit: BoxFit.fill,
            ).image,
            radius: 50,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              title,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
