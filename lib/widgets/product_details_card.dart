import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:store_demo/widgets/add_to_cart_button.dart';
import 'package:store_demo/widgets/product_image.dart';
import 'package:store_demo/widgets/rating_stars.dart';

import '../constants/constants.dart';
import '../models/product.dart';
import '../viewModel/storeVM.dart';

class ProductDetailCard extends StatefulWidget {
  const ProductDetailCard({super.key, required this.product});
  final Product product;

  @override
  State<ProductDetailCard> createState() => _ProductDetailCardState();
}

class _ProductDetailCardState extends State<ProductDetailCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final storeVM = Provider.of<StoreViewModel>(context, listen: true);
    return Container(
        decoration: BoxDecoration(
            color: AppColors.cardGrey,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(color: Colors.grey, spreadRadius: 0.5, blurRadius: 0.8)
            ]),
        margin: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
            child: Column(children: [
          Text(
            widget.product.category!,
            style: const TextStyle(fontSize: 12),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              widget.product.title!,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ProductImage(
            product: widget.product,
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 0.7,
          ),
          const Divider(),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${widget.product.price}',
                            style: const TextStyle(fontSize: 20),
                          ),
                          Row(
                            children: [
                              RatingStars(
                                product: widget.product,
                                color: Colors.red,
                              ),
                              Text(
                                widget.product.rating!['rate'].toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text('(${widget.product.rating!['count']})')
                            ],
                          ),
                        ],
                      ),
                    ),
                    Consumer<StoreViewModel>(builder: (context, value, child) {
                      if (!value.showAddedToCarAnimation) {
                        return Visibility(
                          visible: !value.showAddedToCarAnimation,
                          child: AddToCartButton(
                              storeVM: storeVM, id: widget.product.id!),
                        );
                      } else {
                        return showAnimation(value);
                      }
                    }),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Description:',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.product.description!,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ))
        ])));
  }

  Visibility showAnimation(StoreViewModel value) {
    return Visibility(
      visible: value.showAddedToCarAnimation,
      child: Lottie.asset(
        'assets/lottie/110118-add-to-cart.json',
        width: 50,
        height: 50,
        controller: _controller,
        onLoaded: (composition) {
          _controller
            ..duration = composition.duration
            ..forward().whenComplete(() {
              value.setShowAddedToCarAnimation(false);
              _controller.reset();
            });
        },
      ),
    );
  }
}
