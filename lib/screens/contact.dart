import 'package:agdmm_design/widgets/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:agdmm_design/constants.dart';
import 'package:agdmm_design/widgets/icon_button.dart';
import 'package:agdmm_design/widgets/logo_header.dart';

class ContactSir extends StatelessWidget {
  const ContactSir({
    Key? key,
    // required this.bName,
    // required this.vname,
    // required this.name,
    // required this.desig,
    // required this.faculty,
    // required this.phone,
    // required this.email,
    // required this.img,
    // required this.lengthItem,
    required this.dataList,
  }) : super(key: key);
  // final String bName;
  // final String vname;
  // final String name;
  // final String desig;
  // final String faculty;
  // final String phone;
  // final String email;
  // final String img;
  // final int lengthItem;
  final List<Contact> dataList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dataList.length == 1 ? 'Contact' : 'About Us'),
        backgroundColor: darkPurpleColor,
      ),
      backgroundColor: Colors.grey.shade100,
      body: ListView.separated(
        separatorBuilder: ((context, index) => const Divider(
              thickness: 5,
              color: darkPurpleColor,
            )),
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: SingleCard(
              img: dataList[index].img!,
              name: dataList[index].name!,
              desig: dataList[index].desig!,
              faculty: dataList[index].faculty!,
              vname: dataList[index].vname!,
              phone: dataList[index].phone!,
              email: dataList[index].email!,
            ),
          );
        },
      ),
    );
  }
}

class SingleCard extends StatelessWidget {
  const SingleCard({
    Key? key,
    required this.img,
    required this.name,
    required this.desig,
    required this.faculty,
    required this.vname,
    required this.phone,
    required this.email,
  }) : super(key: key);

  final String img;
  final String name;
  final String desig;
  final String faculty;
  final String vname;
  final String phone;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
