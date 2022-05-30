import 'dart:io';

import 'package:agdmm_design/constants.dart';
import 'package:agdmm_design/screens/disease_info.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class ImageProcessPage extends StatefulWidget {
  const ImageProcessPage({Key? key}) : super(key: key);

  @override
  State<ImageProcessPage> createState() => _ImageProcessPageState();
}

class _ImageProcessPageState extends State<ImageProcessPage> {
  late File? pickedImage;
  bool isImageLoaded = false;
  List? _result;
  double? _confidence = 0.0;
  String _name = "";
  int? index;
  dynamic humid = 0;
  dynamic lIntense = 0;
  dynamic moisture = 0;
  dynamic temp = 0;
  bool isAddLater = false;
  bool isNavigateToDetails = true;
//  List<Data>? rawData;

  grabImage(ImageSource source) async {
    var tempStore = await ImagePicker().pickImage(source: source);
    setState(() {
      if (tempStore != null) {
        pickedImage = File(tempStore.path);
        isImageLoaded = true;
        applyModelOnImage(pickedImage!);
      } else {
        //  print('Please select an Image to test');
      }
    });
  }

  int selectedIndex = 0;
  String selectedItemName = "rice";
  Color selectedBgColor = extremeLightPurpleColor;
  Color selectedTxtColor = Colors.black;

  applyModelOnImage(File file) async {
    var res = await Tflite.runModelOnImage(
      path: file.path,
      numResults: 2,
      threshold: 0.00005,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      //   print(res);
      _result = res;
      String str = _result?[0]["label"];

      // _nameTemp = str.substring(2);

      // if(_nameTemp == "Leaf Mosaic of Jute"){
      //   _name
      // }

      _name = str.substring(2);

      if (_name == "Leaf Mosaic of Jute") {
        _name = "Mosaic of Jute";
      } else if (_name == "Mealybugs of Jute" &&
          _name == "Powdery Mildew of Jute") {
        isAddLater = true;
      } else if (_name == "Northern Blight of Maize") {
        _name = "Northern Leaf Blight of Maize";
      } else if (_name.split(" ")[0] == "Healthy") {
        isNavigateToDetails = false;
      } else if (_name == "Rice Blast") {
        _name = "Blast of Rice";
      } else if (_name == "Rice Brown Spot") {
        _name = "Brown Spot of Rice";
      } else if (_name == "Sheath Brown Rot of Rice") {
        _name = "Sheath Rot of Rice";
      }

      _confidence = _result != null ? (_result?[0]['confidence'] * 100.0) : 0.0;
      // print(_confidence);
    });
  }

  loadModel(String model, String label) async {
    await Tflite.loadModel(
      model: model,
      labels: label,
    );
    // print(
    //     "Result after loading model:${model.split("_").toString().split(".")[0]} $result");
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 0), () {
      loadModel(
          'assests/tflite/model_rice.tflite', 'assests/tflite/labels_rice.txt');
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: extremeLightPurpleColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Image Process'),
        backgroundColor: darkPurpleColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const SizedBox(height: 5),
                Container(
                  height: 50,
                  color: Colors.white70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: Container(
                          color: selectedIndex == 0
                              ? extremeLightPurpleColor
                              : Colors.transparent,
                          margin: const EdgeInsets.only(left: 10),
                          child: TextButton(
                            style: TextButton.styleFrom(primary: Colors.black),
                            onPressed: () {
                              loadModel('assests/tflite/model_rice.tflite',
                                  'assests/tflite/labels_rice.txt');
                              setState(() {
                                selectedIndex = 0;
                                selectedItemName = "Rice";
                              });
                            },
                            child: const Text('Rice'),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          color: selectedIndex == 1
                              ? extremeLightPurpleColor
                              : Colors.transparent,
                          child: TextButton(
                            style: TextButton.styleFrom(primary: Colors.black),
                            onPressed: () {
                              loadModel('assests/tflite/model_jute.tflite',
                                  'assests/tflite/labels_jute.txt');
                              setState(() {
                                selectedIndex = 1;
                                selectedItemName = "Jute";
                              });
                            },
                            child: const Text('Jute'),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          color: selectedIndex == 2
                              ? extremeLightPurpleColor
                              : Colors.transparent,
                          child: TextButton(
                            style: TextButton.styleFrom(primary: Colors.black),
                            onPressed: () {
                              loadModel('assests/tflite/model_maize.tflite',
                                  'assests/tflite/labels_maize.txt');
                              setState(() {
                                selectedIndex = 2;
                                selectedItemName = "Maize";
                              });
                            },
                            child: const Text('Maize'),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          color: selectedIndex == 3
                              ? extremeLightPurpleColor
                              : Colors.transparent,
                          child: TextButton(
                            style: TextButton.styleFrom(primary: Colors.black),
                            onPressed: () {
                              loadModel('assests/tflite/model_soybean.tflite',
                                  'assests/tflite/labels_soybean.txt');
                              setState(() {
                                selectedIndex = 3;
                                selectedItemName = "Soybean";
                              });
                            },
                            child: const Text('Soybean'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                isImageLoaded
                    ? Column(
                        children: [
                          ClipRRect(
                            child: Container(
                              height: 150,
                              width: size.width - 20,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: FileImage(File(pickedImage!.path)),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 80),
                          Text(
                            "Name : $_name",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                          Text(
                            "Confidence :  ${_confidence!.toStringAsFixed(2)}%",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isImageLoaded = false;
                                isAddLater = false;
                                isNavigateToDetails = true;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: darkPurpleColor,
                            ),
                            child: const Text('Reset'),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          const SizedBox(height: 100),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Card(
                                    elevation: 8,
                                    child: GestureDetector(
                                      onTap: () {
                                        grabImage(ImageSource.camera);
                                      },
                                      child: const Icon(
                                        Icons.camera_alt,
                                        size: 70,
                                        color: darkPurpleColor,
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "Camera",
                                    style: myTextStyle,
                                  ),
                                ],
                              ),
                              const SizedBox(width: 50),
                              Column(
                                children: [
                                  Card(
                                    elevation: 8,
                                    child: GestureDetector(
                                      onTap: () {
                                        grabImage(ImageSource.gallery);
                                      },
                                      child: const Icon(
                                        Icons.image,
                                        size: 70,
                                        color: darkPurpleColor,
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "Gallery",
                                    style: myTextStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "( Please select only $selectedItemName images )",
                            style: myTextStyle,
                          ),
                          const SizedBox(height: 100),
                          //  AllData(genre: widget.name),
                        ],
                      ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              if (isAddLater) {
                setState(() {
                  isAddLater = false;
                  isNavigateToDetails = true;
                });
                await Fluttertoast.showToast(
                  msg: "Coming Soon!!!!!",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              } else if (!isNavigateToDetails) {
                await Fluttertoast.showToast(
                  msg: "It is a healthy leaf!!",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => DiseaseInfo(
                          diseaseTitle: _name,
                          imageFile: pickedImage!,
                        )),
                  ),
                );
              }
            },
            child: Container(
              height: 50,
              color: darkPurpleColor,
              child: Center(
                child: Text(
                  'See the Disease Information',
                  style: myTextStyle.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
