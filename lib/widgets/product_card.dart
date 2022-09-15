import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_demo/constants/constants.dart';
import 'package:store_demo/screens/product_detail_screen.dart';
import 'package:store_demo/widgets/product_image.dart';
import 'package:store_demo/widgets/rating_stars.dart';

import '../models/product.dart';
import '../viewModel/storeVM.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final storeVM = Provider.of<StoreViewModel>(context, listen: false);
    storeVM.setCurrentProduct(product);

    return OpenContainer(
      middleColor: AppColors.bgGrey,
      openColor: AppColors.cardGrey,
      transitionType: ContainerTransitionType.fadeThrough,
      transitionDuration: const Duration(milliseconds: 500),
      closedElevation: 2,
      closedColor: AppColors.cardGrey,
      openBuilder: (context, _) => ProductDetailScreen(product: product),
      closedBuilder: (context, action) {
        return InkWell(
          onTap: () {
            action();
          },
          onHover: (isHovering) {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: ProductImage(product: product),
                ),
                const Divider(),
                Flexible(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '\$${product.price!}',
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                product.title!,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 75, 74, 74)),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  RatingStars(
                                    product: product,
                                    color: Colors.red,
                                  ),
                                  Text(product.rating!['rate'].toString()),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
