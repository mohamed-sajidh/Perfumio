import 'package:flutter/material.dart';
import 'package:perfumio/core/app_colors.dart';

class LatestProduct extends StatelessWidget {
  const LatestProduct({super.key});

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
                " Latest Product",
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
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 10,
                  width: 10,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
