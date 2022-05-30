import 'package:agdmm_design/screens/contact.dart';
import 'package:agdmm_design/screens/pdf_view.dart';
import 'package:agdmm_design/widgets/contact_model.dart';
import 'package:flutter/material.dart';

import 'package:agdmm_design/constants.dart';
import 'package:agdmm_design/widgets/logo_header.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: lightPurpleColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Flexible(
                flex: 1,
                child: LogoHeader(
                  imagePath: 'assests/images/logo.png',
                  title: 'AgDMM',
                  color: Colors.white,
                  isCenter: false,
                  leftPaddingValue: 30,
                ),
              ),
              Flexible(
                flex: 3,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: itemList[index].leadingIcon,
                      title: Text(
                        itemList[index].title,
                        style: const TextStyle(fontSize: 18),
                      ),
                      iconColor: Colors.white70,
                      textColor: Colors.white70,
                      selected: selectedIndex == index ? true : false,
                      selectedColor: Colors.white,
                      selectedTileColor: mediumPurpleColor,
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                        if (selectedIndex == 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PdfViewWidget()));
                        } else if (selectedIndex == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ContactSir(
                                dataList: [
                                  Contact(
                                    name: 'Dr. S.M. Taohidul Islam',
                                    desig: 'Professor',
                                    faculty:
                                        'Faculty of Computer Science and Engineering',
                                    vname:
                                        'Patuakhali Science and Technology University',
                                    bName: 'Contact',
                                    email: 'staohidul@yahoo.com',
                                    img: 'assests/images/sir.png',
                                    phone: '01719-018370',
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else if (selectedIndex == 2) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ContactSir(
                                dataList: [
                                  Contact(
                                    name: 'Mahmudul Hasan Sumon',
                                    desig: 'Student',
                                    faculty:
                                        'Faculty of Computer Science and Engineering',
                                    vname:
                                        'Patuakhali Science and Technology University',
                                    bName: 'About Us',
                                    email: 'sumoon14@cse.pstu.ac.bd',
                                    img: 'assests/images/me.png',
                                    phone: '01832852963',
                                  ),
                                  Contact(
                                    name: 'Hasibul Hasan Ankur',
                                    desig: 'Student',
                                    faculty:
                                        'Faculty of Computer Science and Engineering',
                                    vname:
                                        'Patuakhali Science and Technology University',
                                    bName: 'About Us',
                                    email: 'ankur14@cse.pstu.ac.bd',
                                    img: 'assests/images/ankur.jpg',
                                    phone: '01521423870',
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: (width / 4.5)),
                child: const Text(
                  '© All Rights Reserved By PSTU',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyListItems {
  String title;
  Icon leadingIcon;
  MyListItems({
    required this.title,
    required this.leadingIcon,
  });
}

class ListItems extends StatelessWidget {
  const ListItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          iconColor: Colors.white,
          textColor: Colors.white,
          selected: true,
          selectedColor: Colors.white,
          selectedTileColor: mediumPurpleColor,
          leading: const Icon(Icons.phone),
          title: const Text('Contact'),
          onTap: () {},
        ),
        ListTile(
          iconColor: Colors.white,
          textColor: Colors.white,
          selected: false,
          selectedColor: Colors.white,
          selectedTileColor: mediumPurpleColor,
          leading: const Icon(Icons.help),
          title: const Text('Help'),
          onTap: () {},
        ),
        ListTile(
          iconColor: Colors.white,
          textColor: Colors.white,
          selected: false,
          selectedColor: Colors.white,
          selectedTileColor: mediumPurpleColor,
          leading: const Icon(Icons.person),
          title: const Text('About Me'),
          onTap: () {},
        ),
      ],
    );
  }
}
