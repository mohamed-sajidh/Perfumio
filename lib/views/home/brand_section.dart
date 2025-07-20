import 'package:flutter/material.dart';
import 'package:perfumio/core/app_assets.dart';
import 'package:perfumio/core/app_colors.dart';
import 'package:perfumio/providers/scroll_provider.dart';
import 'package:provider/provider.dart';

class BrandSection extends StatefulWidget {
  const BrandSection({super.key});

  @override
  State<BrandSection> createState() => _BrandSectionState();
}

class _BrandSectionState extends State<BrandSection> {
  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context);
    return Container(
      width: double.infinity,
      // height: MediaQuery.of(context).size.width / 1.50,
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
                itemCount: 10,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Container(
                      height: 16,
                      width: 140,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.containerBorderGrey)
                      ),

                      child: Image.asset(AppAssets.brandImg),
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
