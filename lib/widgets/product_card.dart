import 'package:flutter/material.dart';
import 'package:perfumio/core/app_assets.dart';
import 'package:perfumio/core/app_colors.dart';
import 'package:perfumio/models/product_model.dart';
import 'package:perfumio/widgets/custom_button.dart';

class ProductCard extends StatelessWidget {
  final List<Product> productItems;
  final int index;
  const ProductCard({
    super.key,
    required this.productItems,
    required this.index,
  });

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
                child: Center(
                  child: Text(
                    productItems[index].offer,
                    style: const TextStyle(
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
          SizedBox(
            height: 100, // ✅ Set your desired fixed height
            width: 100, // ✅ Optional: set width if needed
            child: productItems[index].image.isNotEmpty
                ? Image.network(
                    productItems[index].image,
                    fit: BoxFit
                        .contain, // or BoxFit.cover depending on your design
                    errorBuilder: (context, error, stackTrace) =>
                        Image.asset(AppAssets.categoryImg, fit: BoxFit.contain),
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      );
                    },
                  )
                : Image.asset(
                    AppAssets.productImg,
                    fit: BoxFit.contain,
                  ),
          ),
          const SizedBox(height: 3),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Text(
              productItems[index].name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 3),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: Text(
                "${productItems[index].currency} ${productItems[index].actualPrice}",
                style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  fontWeight: FontWeight.bold,
                  color: AppColors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(height: 3),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Text(
                  productItems[index].currency,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 3),
                Text(
                  productItems[index].price,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 3),
                Text(
                  productItems[index].unit,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
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
