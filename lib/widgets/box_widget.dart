import 'package:agdmm_design/constants.dart';
import 'package:agdmm_design/screens/disease_info.dart';
import 'package:flutter/material.dart';

class BoxWidget extends StatelessWidget {
  const BoxWidget({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.diseaseList,
  }) : super(key: key);

  final String imageUrl;
  final String title;
  final List<String> diseaseList;
  // final int containerLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(47, 0, 0, 0),
        boxShadow: myBoxShadow,
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.dstATop,
          ),
        ),
      ),
      //margin: const EdgeInsets.symmetric(horizontal: 100),
      //  padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Text(
            title,
            style: myTextStyle.copyWith(fontSize: 32),
          ),
          ExpansionTile(
            title: Container(height: 0),
            trailing: LayoutBuilder(builder: (ctx, constraints) {
              return Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  right: constraints.maxWidth * 0.3,
                ),
                child: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                  size: 60,
                ),
              );
            }),
            children: [
              Container(
                height: 220,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const Divider(thickness: 1),
                  itemCount: diseaseList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DiseaseInfo(
                              diseaseTitle: diseaseList[index],
                              imageFile: null,
                            ),
                          ),
                        );
                      },
                      child: Text(diseaseList[index]),
                    );
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
