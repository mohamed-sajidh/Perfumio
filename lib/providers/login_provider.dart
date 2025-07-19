import 'package:flutter/material.dart';
import 'package:perfumio/services/api_services.dart';
import 'package:perfumio/views/home/home_page.dart';

class LoginProvider extends ChangeNotifier {
  bool isLoading = false;

  Future<void> userLogin(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();

      String? response = await ApiServices.userLogin();

      if (response == null) {
        if (!context.mounted) return;
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false,
        );
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
