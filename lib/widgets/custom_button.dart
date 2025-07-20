import 'package:flutter/material.dart';
import 'package:perfumio/core/app_colors.dart';

Widget rfqButton() {
  return Container(
    height: 42,
    width: 65,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(24),
      border: Border.all(color: AppColors.containerBorderGrey),
    ),
    child: const Center(
      child: Text(
        "RFQ",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    ),
  );
}

Widget addToCartButton() {
  return Container(
    height: 42,
    width: 95,
    decoration: BoxDecoration(
      color: AppColors.brightRed,
      borderRadius: BorderRadius.circular(24),
    ),
    child: const Center(
      child: Text(
        "Add to Cart",
        style: TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
