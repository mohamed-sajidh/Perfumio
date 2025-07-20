import 'package:flutter/material.dart';
import 'package:perfumio/models/product_model.dart';
import 'package:perfumio/services/api_services.dart';

class ProductProvider extends ChangeNotifier {
  bool getProductsLoader = false;
  ProductModel? productList;

  Future<void> getAllProducts() async {
    try {
      getProductsLoader = true;
      notifyListeners();
      final  productItems = await ApiServices.getAllProducts();
      productList = productItems;
    } catch (e) {
      print(e);
    } finally {
      getProductsLoader = false;
      notifyListeners();
    }
  }
}
