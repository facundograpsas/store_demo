import 'package:flutter/material.dart';

import '../viewModel/storeVM.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    Key? key,
    required this.storeVM,
    required this.id,
  }) : super(key: key);

  final StoreViewModel storeVM;
  final int id;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
          key: const Key("btnAddCart"),
          onPressed: () {
            storeVM.addToCart(id);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [Text('Add to cart'), Icon(Icons.shopping_cart)],
          )),
    );
  }
}
