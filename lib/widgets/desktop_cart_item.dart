import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_demo/widgets/product_image.dart';
import 'package:store_demo/widgets/rating_stars.dart';

import '../models/product.dart';
import '../screens/product_detail_screen.dart';
import '../viewModel/storeVM.dart';

class DesktopCartItem extends StatelessWidget {
  const DesktopCartItem({
    required this.product,
    Key? key,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final storeVM = Provider.of<StoreViewModel>(context, listen: false);

    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product)));
      },
      onHover: (value) {},
      child: Row(
        children: [
          ProductImage(
            product: product,
            width: 80,
            height: 80,
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.title!,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Wrap(
                children: [
                  RatingStars(
                    product: product,
                    color: Colors.red,
                  ),
                  Text(
                    product.rating!['rate'].toString(),
                  )
                ],
              )),
          Expanded(
            child: Text(
              '\$${product.price}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  storeVM.removeFromCart(product.id.toString());
                },
                icon: const Icon(Icons.delete)),
          )
        ],
      ),
    );
  }
}
