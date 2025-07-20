import 'package:flutter/material.dart';
import 'package:perfumio/core/app_assets.dart';
import 'package:perfumio/core/app_colors.dart';
import 'package:perfumio/views/home/banner_grid_section.dart';
import 'package:perfumio/views/home/banner_screen.dart';
import 'package:perfumio/views/home/brand_section.dart';
import 'package:perfumio/views/home/category_section.dart';
import 'package:perfumio/views/home/home_page_widgets.dart';
import 'package:perfumio/views/home/latest_product.dart';
import 'package:perfumio/views/home/new_arrivals.dart';
import 'package:perfumio/views/home/secondary_banner_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        toolbarHeight: screenHeight * 0.15,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Welcome ",
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: "User!",
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  AppAssets.bellIcon,
                  color: AppColors.black,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: textfieldWidget()),
                const SizedBox(width: 15),
                scanhereButton(),
              ],
            ),
          ],
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              BannerScreen(),
              SizedBox(height: 15),
              BrandSection(),
              SizedBox(height: 15),
              CategorySection(),
              SizedBox(height: 5),
              SecondaryBannerSection(),
              SizedBox(height: 10),
              NewArrivals(),
              SizedBox(height: 15),
              BannerGridSection(),
              SizedBox(height: 15),
              LatestProduct(),
              SizedBox(height: 115),
            ],
          ),
        ),
      ),
    );
  }
}
