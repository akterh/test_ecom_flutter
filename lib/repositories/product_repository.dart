import 'package:test_project/data_model/product_mini_response.dart';
import 'package:flutter/services.dart';

class ProductRepository {

  Future<ProductMiniResponse> getProducts() async {
    final response = await rootBundle.loadString(
        'assets/jsonFile/products.json');
    print(productMiniResponseFromJson(response));
    return productMiniResponseFromJson(response);
  }




}
