import 'package:dio/dio.dart';
import 'package:perfumio/constants/api_constants.dart';
import 'package:perfumio/core/dio_client.dart';
import 'package:perfumio/core/services.dart';
import 'package:perfumio/models/product_model.dart';

class ApiServices {
  static Future<String?> userLogin() async {
    try {
      final dio = Dio();
      var data = {
        'device_token': "test_token",
        'device_type': 1,
      };

      final response = await dio.post(ApiConstants.loginEndPoint, data: data);

      if (response.statusCode == 200) {
        SecureStorageService secureStorage = SecureStorageService();

        Map<String, dynamic>? res = response.data;

        if (res != null) {
          if (res["data"] != null) {
            final data = res["data"];

            final accessToken = data["access_token"];

            if (accessToken != null && accessToken is String) {
              await secureStorage.storeToken(accessToken);
            } else {
              return "Access token missing in response.";
            }
          } else {
            return "Data key missing in response.";
          }
        }

        return null;
      } else {
        return response.data.toString();
      }
    } on DioException catch (e) {
      Map<String, dynamic>? errorData = e.response?.data;

      if (errorData != null) {
        String? errorMessage = errorData.values.firstWhere(
          (value) => value is String,
          orElse: () => "Unknown error occurred",
        );
        return errorMessage;
      }
      return "Something went wrong. Please try again.";
    } catch (e) {
      return "Unexpected error: $e";
    }
  }

  static Future<ProductModel> getAllProducts() async {
    final dio = await DioClient().getAuthorizedDio();
    final response = await dio.get(ApiConstants.productEndPoint);

    if (response.statusCode == 200) {
      final jsonData = response.data;

      print("jsonData => $jsonData");

      if (jsonData["message"] == "Success") {
        final data = jsonData["data"];

        try {
          final productModel = ProductModel.fromJson(data);
          return productModel;
        } catch (e) {
          print("Error parsing ProductModel: $e");
          throw Exception("Failed to parse data");
        }
      } else {
        throw Exception("Unexpected message: ${jsonData["message"]}");
      }
    }

    throw Exception("Failed to load products");
  }
}
