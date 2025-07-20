import 'package:flutter/material.dart';
import 'package:perfumio/core/app_colors.dart';
import 'package:perfumio/models/product_model.dart';
import 'package:perfumio/widgets/product_card.dart';

class NewArrivals extends StatelessWidget {
  final List<Product> productItems;
  final String titleName;
  const NewArrivals({super.key, required this.productItems, required this.titleName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titleName,
                style: const TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
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
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productItems.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductCard(productItems: productItems, index: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
