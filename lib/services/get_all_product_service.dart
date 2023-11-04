import 'dart:convert';

import 'package:http/http.dart';
import 'package:simpleapp/helper/api.dart';
import 'package:simpleapp/model/UserModel.dart';

class AllProductsService {
  static List<UserModel> productsList = [];
  Future<List<UserModel>> getAllProducts() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');

    productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        UserModel.fromJson(data[i]),
      );
    }
    return productsList;
  }
}
