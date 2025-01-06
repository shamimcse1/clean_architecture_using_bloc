
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;
  final Duration timeoutDuration;

  ProductRemoteDataSourceImpl({required this.client, this.timeoutDuration = const Duration(seconds: 10)});

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await client
        .get(Uri.parse('https://fakestoreapi.com/products'))
        .timeout(timeoutDuration, onTimeout: () {
      // Handle timeout here
      throw Exception('Request to API timed out');
    });

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}