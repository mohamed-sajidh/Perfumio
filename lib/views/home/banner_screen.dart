import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:perfumio/core/app_assets.dart';

class BannerScreen extends StatefulWidget {
  const BannerScreen({super.key});

  @override
  State<BannerScreen> createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  final List<String> bannerImg = [
    AppAssets.bannerone,
    AppAssets.bannertwo,
    AppAssets.bannerthree,
    AppAssets.bannerfour,
    AppAssets.bannerfive,
  ];

  int adsCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CarouselSlider.builder(
          itemCount: bannerImg.length,
          itemBuilder: (context, index, realIdx) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 3,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                bannerImg[index],
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            );
          },
          options: CarouselOptions(
            height: 140,
            autoPlay: true,
            enlargeCenterPage: true,
            autoPlayCurve: Curves.easeInOut,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                adsCurrentIndex = index;
              });
            },
          ),
        ),
      ],
    );
  }
}
