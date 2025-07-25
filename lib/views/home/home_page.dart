import 'package:flutter/material.dart';
import 'package:perfumio/core/app_assets.dart';
import 'package:perfumio/core/app_colors.dart';
import 'package:perfumio/providers/product_provider.dart';
import 'package:perfumio/views/home/banner_grid_section.dart';
import 'package:perfumio/views/home/banner_screen.dart';
import 'package:perfumio/views/home/brand_section.dart';
import 'package:perfumio/views/home/category_section.dart';
import 'package:perfumio/views/home/home_page_widgets.dart';
import 'package:perfumio/views/home/new_arrivals.dart';
import 'package:perfumio/views/home/secondary_banner_section.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      Provider.of<ProductProvider>(context, listen: false).getAllProducts();
    });
  }

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
      body: Consumer<ProductProvider>(
        builder: (context, provider, child) {
          final homeFields = provider.productList?.homeFields ?? [];

          return provider.getProductsLoader
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      children: [
                        ...homeFields.map((field) {
                          if (field.type == 'carousel') {
                            return BannerScreen(
                                carouselItems: field.carouselItems ?? []);
                          } else if (field.type == 'brands') {
                            return BrandSection(brandItems: field.brands ?? []);
                          } else if (field.type == 'category') {
                            return CategorySection(
                                categoryItems: field.categories ?? []);
                          } else if (field.type == 'collection' &&
                              field.collectionId == 1) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: NewArrivals(
                                productItems: field.products ?? [],
                                titleName: field.name ?? "",
                              ),
                            );
                          } else if (field.type == 'banner-grid') {
                            return BannerGridSection(
                                bannerItem: field.banners ?? []);
                          } else if (field.type == 'collection' &&
                              field.collectionId == 2) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: NewArrivals(
                                productItems: field.products ?? [],
                                titleName: field.name ?? "",
                              ),
                            );
                          } else if (field.type == 'banner') {
                            return SecondaryBannerSection(
                                banner: field.banner!);
                          } else if (field.type == 'collection' &&
                              field.collectionId == 3) {
                            return NewArrivals(
                              productItems: field.products ?? [],
                              titleName: field.name ?? "",
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        }),
                        const SizedBox(height: 115),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
