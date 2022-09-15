// Import the test package and Counter class
import 'package:flutter_test/flutter_test.dart';
import 'package:store_demo/models/product.dart';
import 'package:store_demo/viewModel/storeVM.dart';

void main() {
  test('productId shoud be added to shoppingCart', () async {
    final storeVM = StoreViewModel();
    var productId = '3';
    storeVM.addToCart(productId);
    expect(storeVM.shoppingCart, ['3']);
  });

  test('productId shoud be removed from shoppingCart', () async {
    final storeVM = StoreViewModel();
    storeVM.shoppingCart = ['3'];
    var productId = '3';
    storeVM.removeFromCart(productId);
    expect(storeVM.shoppingCart, []);
  });

  test('selectedProduct shoud be "product"', () async {
    final storeVM = StoreViewModel();
    Product product = Product();
    storeVM.setCurrentProduct(product);
    expect(storeVM.selectedProduct, product);
  });
}
