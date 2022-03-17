import 'package:flutter/material.dart';
import 'package:agdmm_design/constants.dart';
import 'package:agdmm_design/widgets/icon_button.dart';
import 'package:agdmm_design/widgets/logo_header.dart';

class ContactSir extends StatelessWidget {
  const ContactSir({
    Key? key,
    required this.bName,
    required this.vname,
    required this.name,
    required this.desig,
    required this.faculty,
    required this.phone,
    required this.email,
    required this.img,
  }) : super(key: key);
  final String bName;
  final String vname;
  final String name;
  final String desig;
  final String faculty;
  final String phone;
  final String email;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bName),
        backgroundColor: darkPurpleColor,
      ),
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          const SizedBox(height: 20),
          Center(
            child: LogoHeader(
              imagePath: img,
              title: name,
              color: Colors.black,
              isCenter: true,
              leftPaddingValue: 0,
            ),
          ),
          Text(desig, style: myTextStyle),
          const SizedBox(height: 10),
          Text(
            faculty,
            style: myTextStyle.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            vname,
            style: myTextStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconWithButton(
                    icon: const Icon(Icons.phone),
                    text: phone,
                    isPhone: true,
                  ),
                  IconWithButton(
                    icon: const Icon(Icons.email),
                    text: email,
                    isPhone: false,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
