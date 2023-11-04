import 'dart:math';

import 'package:get/get.dart';
import 'package:simpleapp/helper/api.dart';
import 'package:simpleapp/model/UserModel.dart';

class productcontreoller extends GetxController {
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  List<UserModel> productsList = [];

  // productcontreoller() {
  //   isLoading == true;
  //   update();
  //   getAllProducts();
  //   isLoading == false;
  //   update();
  // }
  Future<List<UserModel>> getAllProducts() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');
    _isLoading = false;
    update();
    productsList.clear();
    for (int i = 0; i < data.length; i++) {
      productsList.add(UserModel.fromJson(data[i]));
    }

    return productsList;
  }
}
