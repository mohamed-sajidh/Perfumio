import 'package:flutter/material.dart';
import 'package:perfumio/core/app_assets.dart';

class BannerGridSection extends StatefulWidget {
  const BannerGridSection({super.key});

  @override
  State<BannerGridSection> createState() => _BannerGridSectionState();
}

class _BannerGridSectionState extends State<BannerGridSection> {
  final List<String> bannerImg = [
    AppAssets.bannerGridImg,
    AppAssets.bannerGridImg2,
    AppAssets.bannerthree,
    AppAssets.bannerfour,
    AppAssets.bannerfive,
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: bannerImg.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 250,
            width: (screenWidth / 2) - 15,
            margin: const EdgeInsets.symmetric(horizontal: 7.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset(
              bannerImg[index],
              fit: BoxFit.fill,
            ),
          );
        },
      ),
    );
  }
}
