import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_demo/constants/constants.dart';
import 'package:store_demo/models/product.dart';
import 'package:store_demo/screens/product_detail_screen.dart';
import 'package:store_demo/viewModel/storeVM.dart';
import 'package:store_demo/widgets/product_image.dart';
import 'package:store_demo/widgets/rating_stars.dart';

import '../widgets/desktop_cart_item.dart';
import '../widgets/mobile_cart_item.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.bgGrey,
      appBar: AppBar(backgroundColor: Colors.amber, actions: []),
      body: Container(
        color: Colors.white,
        margin: const EdgeInsets.all(50),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: double.maxFinite,
            color: Colors.amber,
            padding: const EdgeInsets.all(15.0),
            child: const Text(
              'My cart',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Consumer<StoreViewModel>(builder: ((context, value, child) {
            return Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var product = value.productList.firstWhere((element) =>
                      element.id.toString() == value.shoppingCart[index]);
                  return Card(child: cartItem(product, context, width));
                },
                itemCount: value.shoppingCart.length,
              ),
            );
          })),
          Row(
            children: [
              Expanded(
                child: Consumer<StoreViewModel>(
                  builder: (context, value, child) {
                    return Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Total: \$${value.getTotal()}',
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }

  Widget cartItem(Product product, BuildContext context, width) {
    if (width > 500) {
      return DesktopCartItem(product: product);
    } else {
      return MobileCartItem(product: product);
    }
  }
}
