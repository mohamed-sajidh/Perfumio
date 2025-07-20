import 'package:flutter/material.dart';
import 'package:perfumio/core/app_assets.dart';
import 'package:perfumio/core/app_colors.dart';
import 'package:perfumio/models/product_model.dart';

class CategorySection extends StatelessWidget {
  final List<Category> categoryItems;
  const CategorySection({super.key, required this.categoryItems});

  @override
  Widget build(BuildContext context) {
    final List<Color> backgroundColors = [
      AppColors.lightYellow,
      AppColors.softLavender,
      AppColors.lightPink,
      AppColors.lightGreen,
    ];

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  " Our Categories",
                  style: const TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  textScaler: TextScaler.linear(
                    MediaQuery.of(context).textScaler.scale(1.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    "View All",
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,
                    textScaler: TextScaler.linear(
                      MediaQuery.of(context).textScaler.scale(1.0),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 5),

            // Category Grid
            GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categoryItems.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 0.60,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                final category = categoryItems[index];
                final bgColor =
                    backgroundColors[index % backgroundColors.length];

                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: bgColor,
                      ),
                      child: ClipOval(
                        child: category.image.isNotEmpty
                            ? Image.network(
                                category.image,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Image.asset(AppAssets.categoryImg),
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return const Center(
                                    child: CircularProgressIndicator(
                                        strokeWidth: 2),
                                  );
                                },
                              )
                            : Image.asset(
                                AppAssets.categoryImg,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      category.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                      textScaler: TextScaler.linear(
                        MediaQuery.of(context).textScaler.scale(1.0),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
