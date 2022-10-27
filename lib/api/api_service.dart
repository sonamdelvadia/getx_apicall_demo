import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx_apicall_demo/model/product_response.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiService {
  late ProductResponse productResponse;
  List<ProductResponse> listData=[];

  static Future<List<ProductResponse>> fetchProduct() async {
    var jsonString;

    var response = await get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=marienatie'));

    jsonString = response.body;
    List<ProductResponse> lstProducts = [];
    if (response.statusCode == 200){
      var jsonString = response.body;
      lstProducts = productResponseFromJson(jsonString);
    }
    return lstProducts;


  }
}
