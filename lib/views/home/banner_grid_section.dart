import 'package:flutter/material.dart';
import 'package:perfumio/models/product_model.dart';

class BannerGridSection extends StatefulWidget {
  final List<BannerItem> bannerItem;
  const BannerGridSection({super.key, required this.bannerItem});

  @override
  State<BannerGridSection> createState() => _BannerGridSectionState();
}

class _BannerGridSectionState extends State<BannerGridSection> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.bannerItem.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 250,
            width: (screenWidth / 2) - 15,
            margin: const EdgeInsets.symmetric(horizontal: 7.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.network(
              widget.bannerItem[index].image,
              fit: BoxFit.fill,
              width: double.infinity,
              errorBuilder: (context, error, stackTrace) =>
                  const Center(child: Icon(Icons.broken_image)),
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator());
              },
            ),
          );
        },
      ),
    );
  }
}
