import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_demo/widgets/product_image.dart';
import 'package:store_demo/widgets/rating_stars.dart';

import '../models/product.dart';
import '../screens/product_detail_screen.dart';
import '../viewModel/storeVM.dart';

class MobileCartItem extends StatelessWidget {
  const MobileCartItem({
    required this.product,
    Key? key,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final storeVM = Provider.of<StoreViewModel>(context, listen: false);

    return InkWell(
      onHover: (value) {},
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product)));
      },
      child: Column(children: [
        Stack(
          alignment: Alignment.center,
          children: [
            ProductImage(
              product: product,
              width: 70,
              height: 70,
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {
                    storeVM.removeFromCart(product.id.toString());
                  },
                  icon: const Icon(Icons.delete)),
            ),
          ],
        ),
        Text(
          '\$${product.price}',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RatingStars(product: product, color: Colors.red),
            Text(
              product.rating!['rate']!.toString(),
            )
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              Text(product.title!,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ]),
    );
  }
}
