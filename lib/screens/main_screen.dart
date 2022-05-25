import 'package:agdmm_design/constants.dart';
import 'package:agdmm_design/language_cubit.dart';
import 'package:agdmm_design/widgets/box_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final zoomDrawerController;
  // ignore: use_key_in_widget_constructors
  const MainScreen({Key? key, this.zoomDrawerController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                    zoomDrawerController.toggle();
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
                            child: Container(
                          height: 105,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: darkPurpleColor,
                            boxShadow: myBoxShadow,
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
                    const SizedBox(height: 150),
                    Container(
                      alignment: Alignment.center,
                      height: 80,
                      width: double.infinity,
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
