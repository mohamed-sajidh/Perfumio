import 'package:flutter/material.dart';
import 'package:perfumio/core/app_assets.dart';
import 'package:perfumio/core/app_colors.dart';

Widget textfieldWidget() {
  return TextField(
    decoration: InputDecoration(
      hintText: 'Search...',
      prefixIcon: const Icon(Icons.search),
      contentPadding: const EdgeInsets.symmetric(vertical: 14),
      filled: true,
      fillColor: AppColors.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: AppColors.grey.shade400),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: AppColors.grey),
      ),
    ),
  );
}

Widget scanhereButton() {
  return Container(
    height: 50,
    width: 125,
    decoration: BoxDecoration(
      color: AppColors.brightRed,
      borderRadius: BorderRadius.circular(25),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Scan Here",
            style: TextStyle(
              color: AppColors.white,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          Image.asset(AppAssets.barcode)
        ],
      ),
    ),
  );
}
