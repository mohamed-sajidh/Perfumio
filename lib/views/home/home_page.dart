import 'package:flutter/material.dart';
import 'package:perfumio/core/app_assets.dart';
import 'package:perfumio/core/app_colors.dart';
import 'package:perfumio/views/home/home_page_widgets.dart';

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
      backgroundColor: AppColors.white,
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
    );
  }
}
