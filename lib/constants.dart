import 'package:agdmm_design/screens/menu_screen.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/material.dart';

const blackColor = Color(0xff2f1f2a);
const purpleColor = Color(0xff9e7eed);
const whiteColor = Color(0xffffffff);
const darkPurpleColor = Color(0xff5e42c6);
const lightPurpleColor = Color(0xff7661c6);
const mediumPurpleColor = Color(0xff8a73cf);

const buttonGradient = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: <Color>[
    Color(0xff5e42c6), //high
    Color(0xff8a73cf) //mid
  ],
);

var itemList = <MyListItems>[
  MyListItems(title: 'Contact', leadingIcon: const Icon(Icons.phone, size: 25)),
  MyListItems(title: 'Help', leadingIcon: const Icon(Icons.help, size: 25)),
  MyListItems(
      title: 'About Me', leadingIcon: const Icon(Icons.person, size: 25)),
];

const myTextStyle = TextStyle(
  fontSize: 20,
  color: Colors.black,
  fontWeight: FontWeight.bold,
);
