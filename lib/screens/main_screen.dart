import 'package:agdmm_design/constants.dart';
import 'package:agdmm_design/language_cubit.dart';
import 'package:agdmm_design/screens/image_process_page.dart';
import 'package:agdmm_design/widgets/box_widget.dart';
import 'package:agdmm_design/widgets/firebase_data_block.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final zoomDrawerController;
  // ignore: use_key_in_widget_constructors
  const MainScreen({Key? key, this.zoomDrawerController}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late DatabaseReference _dbref;
  String databasejson = '';
  @override
  void initState() {
    super.initState();
    _dbref = FirebaseDatabase.instance.ref();
  }

  String myCustomFractionMaker(String input) {
    bool isDotContains = input.contains('.');
    List<String> splittedValue = isDotContains ? input.split('.') : [];
    int countSplittedArray = isDotContains ? splittedValue[1].length : 0;
    bool is2Digit = countSplittedArray >= 2 ? true : false;
    return isDotContains && is2Digit
        ? splittedValue[0] + "." + splittedValue[1][0] + splittedValue[1][1]
        : input;
  }

  @override
  Widget build(BuildContext context) {
    //   Size size = MediaQuery.of(context).size;
    return BlocBuilder<LanguageCubit, bool>(
      builder: (context, state) {
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
                    widget.zoomDrawerController.toggle();
                  },
                  icon: const Icon(Icons.menu),
                );
              },
            ),
            actions: [
              Container(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  state ? '🇧🇩' : '🇬🇧',
                  style: myTextStyle,
                ),
              ),
              CupertinoSwitch(
                activeColor: darkPurpleColor,
                value: state,
                thumbColor: purpleColor,
                onChanged: (val) {
                  BlocProvider.of<LanguageCubit>(context)
                      .toggleTheme(value: !state);

                  state
                      ? context.setLocale(const Locale('en'))
                      : context.setLocale(const Locale('bn'));
                },
              ),
            ],
          ),
          backgroundColor: Colors.grey.shade100,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Center(
                      child: Text(
                        'Agro Disease Monitoring and Management',
                        style: myTextStyle.copyWith(fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) =>
                                    const ImageProcessPage()),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.only(top: 10),
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: extremeLightPurpleColor,
                              //boxShadow: myBoxShadow,
                              border: Border.all(color: darkPurpleColor),
                              image: const DecorationImage(
                                scale: 1.1,
                                image: AssetImage(
                                  'assests/images/agriculture.png',
                                ),
                                alignment: Alignment.bottomCenter,
                              ),
                            ),
                            child: const Align(
                              alignment: Alignment.topCenter,
                              child: Text("Image Process", style: myTextStyle),
                            ),
                          ),
                        )),
                        const SizedBox(width: 20),
                        const Expanded(
                          child: BoxWidget(
                            title: 'Rice',
                            imageUrl: 'assests/images/rice_leaf.png',
                            diseaseList: riceDiseases,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Expanded(
                          child: BoxWidget(
                            title: 'Jute',
                            imageUrl: 'assests/images/jute_leaf.png',
                            diseaseList: juteDiseases,
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: BoxWidget(
                            title: 'Soybean',
                            imageUrl: 'assests/images/soybean_leaf.png',
                            diseaseList: soybeanDiseases,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Expanded(
                          child: BoxWidget(
                            title: 'Maize',
                            imageUrl: 'assests/images/maize_leaf.png',
                            diseaseList: maizeDiseases,
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: BoxWidget(
                            title: 'Wheat',
                            imageUrl: 'assests/images/wheat_leaf.png',
                            diseaseList: wheatDiseases,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: purpleColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: myBoxShadow,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          const Text('Sensor Data', style: myTextStyle),
                          const SizedBox(height: 10),
                          Expanded(
                            child: StreamBuilder<DatabaseEvent>(
                                stream: _dbref.onValue,
                                builder: (context, snapshot) {
                                  // print(snapshot.data?.snapshot.value);
                                  if (snapshot.data != null) {
                                    if (snapshot.hasData &&
                                        !snapshot.hasError) {
                                      String humidity = snapshot.data!.snapshot
                                          .child('HUMIDITY')
                                          .value
                                          .toString();
                                      String lightIntensity = snapshot
                                          .data!.snapshot
                                          .child('LIGHT_INTNSITY')
                                          .value
                                          .toString();
                                      String moisture = snapshot.data!.snapshot
                                          .child('SOIL_MOISTURE')
                                          .value
                                          .toString();
                                      String temperature = snapshot
                                          .data!.snapshot
                                          .child('TEMPERATURE')
                                          .value
                                          .toString();

                                      return GridView.count(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        crossAxisCount: 2,
                                        childAspectRatio: 2,
                                        children: [
                                          FirebaseDataBlock(
                                            title: 'Humidity',
                                            value: myCustomFractionMaker(
                                                    humidity) +
                                                '° F',
                                          ),
                                          FirebaseDataBlock(
                                            title: 'Light Intensity',
                                            value: myCustomFractionMaker(
                                                    lightIntensity) +
                                                " lux",
                                          ),
                                          FirebaseDataBlock(
                                            title: 'Soil Moisture',
                                            value: myCustomFractionMaker(
                                                    moisture) +
                                                ' %',
                                          ),
                                          FirebaseDataBlock(
                                            title: 'Temperature',
                                            value: myCustomFractionMaker(
                                                    temperature) +
                                                '° C',
                                          ),
                                        ],
                                      );
                                    } else {
                                      return const Center(
                                        child: Text(
                                            'Check your internet connection!',
                                            style: myTextStyle),
                                      );
                                    }
                                  }
                                  return const Center(
                                    child: Text('Loading', style: myTextStyle),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      alignment: Alignment.center,
                      height: 80,
                      //width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assests/images/footer.png',
                          ),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
