import 'package:flutter/material.dart';
import 'package:perfumio/models/product_model.dart';
import 'package:perfumio/services/api_services.dart';

class ProductProvider extends ChangeNotifier {
  bool getProductsLoader = false;
  var productList = <ProductModel>[];

  Future<void> getAllProducts() async {
    try {
      getProductsLoader = true;
      notifyListeners();
      ProductModel productItems = await ApiServices.getAllProducts();
      print("productItems => $productItems");
    } catch (e) {
      print(e);
    } finally {
      getProductsLoader = false;
      notifyListeners();
    }
  }
}
