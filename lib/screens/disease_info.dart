import 'package:agdmm_design/constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class DiseaseInfo extends StatelessWidget {
  const DiseaseInfo({Key? key, required this.diseaseTitle}) : super(key: key);

  final String diseaseTitle;

  @override
  Widget build(BuildContext context) {
    String formattedText = diseaseTitle.toLowerCase().replaceAll(' ', '_');
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: darkPurpleColor,
            floating: true,
            pinned: true,
            title: Text(diseaseTitle),
            centerTitle: true,
          ),
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: SliverImageHeader(
              imgUrl: '$formattedText.jpg',
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 60,
              margin: const EdgeInsets.only(
                bottom: 20,
                left: 20,
                right: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${formattedText}_type'.tr(), style: myTextStyle),
                  const SizedBox(width: 30),
                  Flexible(
                    child: Text(
                      '${formattedText}_type_name'.tr(),
                      style: myTextStyle,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return DiseaseRowInformation(
                  boxTitle: diseaseDetailTitle[index],
                  boxDetail:
                      '$formattedText${diseaseDetailTitleExtension[index]}',
                );
              },
              childCount: 6,
            ),
          ),
        ],
      ),
    );
  }
}

class SliverImageHeader extends SliverPersistentHeaderDelegate {
  final String imgUrl;

  SliverImageHeader({required this.imgUrl});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Image.asset(
      'assests/images/$imgUrl',
      fit: BoxFit.fill,
    );
  }

  @override
  double get maxExtent => 250;

  @override
  double get minExtent => 250;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class DiseaseRowInformation extends StatelessWidget {
  const DiseaseRowInformation({
    Key? key,
    required this.boxTitle,
    required this.boxDetail,
  }) : super(key: key);

  final String boxTitle;
  final String boxDetail;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 12,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: myBoxShadow,
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 40,
              width: size.width,
              decoration: const BoxDecoration(
                color: extremeLightPurpleColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      boxTitle,
                      style: myTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                boxDetail.tr(),
                style: myTextStyle,
              ),
            ),
          ],
        ),
        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [
        //     Text('$title :', style: myTextStyle),
        //     Text('Virus Name', style: myTextStyle),
        //   ],
        // ),
      ),
    );
  }
}
