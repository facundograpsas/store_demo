import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_demo/constants/constants.dart';

import '../models/product.dart';
import '../api/rest_client.dart';

class StoreViewModel extends ChangeNotifier {
  final apiClient = RestClient(Dio());

  List<Product> productList = [];

  bool loadingProducts = false;
  Product? selectedProduct;
  List<String> shoppingCart = [];
  num total = 0;
  var status = Status.loading;
  bool showAddedToCarAnimation = false;
  bool addingToCart = false;

  void fetchProducts() async {
    try {
      productList = await apiClient.getProducts();
      status = Status.completed;
    } catch (e) {
      status = Status.error;
    }
    loadingProducts = false;
    notifyListeners();
  }

  void setCurrentProduct(product) {
    selectedProduct = product;
  }

  void setShowAddedToCarAnimation(value) {
    showAddedToCarAnimation = value;
    notifyListeners();
  }

  void setSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('cart', shoppingCart);
  }

  void addToCart(productId) {
    shoppingCart.add(productId.toString());
    setSharedPreferences();
    showAddedToCarAnimation = true;
    getTotal();
    notifyListeners();
  }

  void removeFromCart(productId) {
    shoppingCart.remove(productId);
    setSharedPreferences();
    getTotal();
    notifyListeners();
  }

  num getTotal() {
    num total = 0;
    if (productList.isNotEmpty) {
      for (var element in shoppingCart) {
        var productPrice = productList
            .firstWhere(
              (p) => p.id.toString() == element,
            )
            .price;
        total += productPrice!;
      }
    }
    return total;
  }

  void loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    var items = prefs.getStringList('cart');
    if (items != null) {
      shoppingCart = items;
    }
  }
}
