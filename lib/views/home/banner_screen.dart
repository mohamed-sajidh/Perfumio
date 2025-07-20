import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:perfumio/models/product_model.dart';

class BannerScreen extends StatefulWidget {
  final List<CarouselItem> carouselItems;
  const BannerScreen({super.key, required this.carouselItems});

  @override
  State<BannerScreen> createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  int adsCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CarouselSlider.builder(
          itemCount: widget.carouselItems.length,
          itemBuilder: (context, index, realIdx) {
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
                widget.carouselItems[index].image,
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
          options: CarouselOptions(
            height: 150,
            autoPlay: true,
            enlargeCenterPage: true,
            autoPlayCurve: Curves.easeInOut,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                adsCurrentIndex = index;
              });
            },
          ),
        ),
      ],
    );
  }
}
