import 'package:flutter/material.dart';
import 'package:perfumio/models/product_model.dart';

class SecondaryBannerSection extends StatelessWidget {
  final BannerItem banner;

  const SecondaryBannerSection({super.key, required this.banner});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.network(
        banner.image,
        fit: BoxFit.fill,
        width: double.infinity,
        height: 150,
      ),
    );
  }
}
