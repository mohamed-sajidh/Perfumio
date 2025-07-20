import 'package:flutter/material.dart';
import 'package:perfumio/core/app_assets.dart';
import 'package:perfumio/core/app_colors.dart';
import 'package:perfumio/widgets/custom_button.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 185,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.containerBorderGrey),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 75,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  color: AppColors.lightGrey,
                ),
                child: const Center(
                  child: Text(
                    "40% OFF",
                    style: TextStyle(
                      color: AppColors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.favorite_border),
              )
            ],
          ),
          Image.asset(AppAssets.productImg),
          const SizedBox(height: 3),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Text(
              "Les Eaux De Chaneleau Spray",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 3),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: Text(
                "AED500.00",
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  fontWeight: FontWeight.bold,
                  color: AppColors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(height: 3),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Text(
                  "AED",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "484.00",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 3),
                Text(
                  "per",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(width: 3),
                Text(
                  "Dozen",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                rfqButton(),
                addToCartButton(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
