import 'package:flutter/material.dart';
import 'package:perfumio/core/app_assets.dart';
import 'package:perfumio/core/app_colors.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Color> backgroundColors = [
      AppColors.lightYellow,
      AppColors.softLavender,
      AppColors.lightPink,
      AppColors.lightGreen,
    ];
    const int columns = 4;
    int rows = (5 <= columns) ? 1 : 2;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < (10 / (rows * columns)).ceil(); i++)
                    Column(
                      children: [
                        for (int row = 0; row < rows; row++)
                          SizedBox(
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            child: GridView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: columns,
                                childAspectRatio: 0.40,
                                mainAxisSpacing: 1,
                                crossAxisSpacing: 2,
                              ),
                              itemCount: columns,
                              itemBuilder: (context, index) {
                                int categoryIndex =
                                    i * columns * rows + row * columns + index;
                                if (categoryIndex < 10) {
                                  // var category = homeCategoryController
                                  //     .categories[categoryIndex];

                                  return SizedBox(
                                    height: 120,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        // Inner Circle (Existing Code)
                                        Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: backgroundColors[
                                                categoryIndex %
                                                    backgroundColors.length],
                                          ),
                                          child: Center(
                                            child: Image.asset(
                                              AppAssets.categoryImg,
                                              fit: BoxFit.cover,
                                            ),
                                          ),

                                          // Center(
                                          //   child: category.image != null &&
                                          //           category.image!.isNotEmpty
                                          //       ? ClipOval(
                                          //           child: Image.network(
                                          //             Uri.tryParse(category
                                          //                             .image!)
                                          //                         ?.isAbsolute ==
                                          //                     true
                                          //                 ? category.image!
                                          //                 : Uri.parse(category
                                          //                         .image!
                                          //                         .replaceFirst(
                                          //                             RegExp(
                                          //                                 r'^/+'),
                                          //                             ""))
                                          //                     .toString(),
                                          //             fit: BoxFit.cover,
                                          //             width: double.infinity,
                                          //             height: double.infinity,
                                          //             loadingBuilder: (context,
                                          //                 child,
                                          //                 loadingProgress) {
                                          //               if (loadingProgress ==
                                          //                   null) {
                                          //                 return child;
                                          //               } else {
                                          //                 return const Center(
                                          //                   child:
                                          //                       CircularProgressIndicator(),
                                          //                 );
                                          //               }
                                          //             },
                                          //             errorBuilder: (context,
                                          //                 error, stackTrace) {
                                          //               return Image.asset(
                                          //                 AppAssets.brandImg,
                                          //                 fit: BoxFit.cover,
                                          //               );
                                          //             },
                                          //           ),
                                          //         )
                                          //       : Image.asset(
                                          //           AppAssets.brandImg,
                                          //           fit: BoxFit.cover,
                                          //         ),
                                          // ),
                                        ),
                                        Text(
                                          "Aromatic",
                                          maxLines: 2,
                                          overflow: TextOverflow.visible,
                                          softWrap: true,
                                          style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          textAlign: TextAlign.center,
                                          textScaler: TextScaler.linear(
                                            MediaQuery.of(context)
                                                .textScaler
                                                .scale(1.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
