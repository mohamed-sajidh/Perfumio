import 'package:flutter/material.dart';
import 'package:perfumio/core/app_colors.dart';
import 'package:perfumio/models/product_model.dart';
import 'package:perfumio/providers/scroll_provider.dart';
import 'package:provider/provider.dart';

class BrandSection extends StatefulWidget {
  final List<Brand> brandItems;
  const BrandSection({super.key, required this.brandItems});

  @override
  State<BrandSection> createState() => _BrandSectionState();
}

class _BrandSectionState extends State<BrandSection> {
  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context);
    return Container(
      width: double.infinity,
      color: AppColors.lightGrey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  "Shop By Brands",
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                  textAlign: TextAlign.center,
                  textScaler: TextScaler.linear(
                    MediaQuery.of(context).textScaler.scale(1.0),
                  ),
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
          MediaQuery.removePadding(
            context: context,
            removeBottom: false,
            removeLeft: false,
            removeRight: false,
            removeTop: false,
            child: SizedBox(
              width: double.infinity,
              height: 130,
              child: ListView.builder(
                controller: scrollProvider.scrollController,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.fromLTRB(
                  15,
                  0,
                  15,
                  0,
                ),
                itemCount: widget.brandItems.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Container(
                      height: 16,
                      width: 140,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12),
                          border:
                              Border.all(color: AppColors.containerBorderGrey)),
                      child: Image.network(
                        widget.brandItems[i].image,
                        fit: BoxFit.fill,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) =>
                            const Center(child: Icon(Icons.broken_image)),
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                              child: CircularProgressIndicator());
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
