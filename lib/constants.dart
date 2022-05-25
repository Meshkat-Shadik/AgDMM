import 'package:agdmm_design/screens/menu_screen.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/material.dart';

const blackColor = Color(0xff2f1f2a);
const purpleColor = Color.fromARGB(255, 158, 126, 237);
const whiteColor = Color(0xffffffff);
const darkPurpleColor = Color(0xff5e42c6);
const lightPurpleColor = Color(0xff7661c6);
const mediumPurpleColor = Color(0xff8a73cf);
const extremeLightPurpleColor = Color.fromARGB(255, 217, 205, 246);

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

var myBoxShadow = const <BoxShadow>[
  BoxShadow(
    color: extremeLightPurpleColor,
    blurRadius: 4,
    offset: Offset(4, 8), // Shadow position
  ),
];

const riceDiseases = [
  'Bacterial Blight of Rice',
  'Tungro of Rice',
  'Blast of Rice',
  'Brown Spot of Rice',
  'Leaf Scald of Rice',
  'Sheath Rot of Rice'
];

const juteDiseases = [
  'Stem Rot of Jute',
  'Antracnose of Jute',
  'Black Band of Jute',
  'Soft Rot of Jute',
  'Mosaic of Jute',
];

const wheatDiseases = [
  'Leaf Rust of Wheat',
  'Loose Smut of Wheat',
  'Powdery Milidew of Wheat',
  'Stem Rust of Wheat',
  'Tan Spot of Wheat',
];

const maizeDiseases = [
  'Common Rust of Maize',
  'Gray Leaf Spot of Maize',
  'Northern Leaf Blight of Maize'
];
const soybeanDiseases = [
  'Alfalfa Mosaic of Soybean',
  'Bacterial Blight of Soybean',
  'Brown Stem Rot of Soybean',
];

const diseaseDetailTitle = [
  'Symptomps',
  'Origin',
  'Trigger',
  'Organic Solution',
  'Chemical Solution',
  'Defensive Steps',
];

const diseaseDetailTitleExtension = [
  '_symptoms',
  '_origin',
  '_trigger',
  '_organic',
  '_chemical',
  '_defensive_step',
];

/*

border-radius: 52px;
background: linear-gradient(145deg, #cacaca, #f0f0f0);
box-shadow:  24px 24px 47px #cacaca,
             -24px -24px 47px #f6f6f6;

             */