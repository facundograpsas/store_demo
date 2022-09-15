import 'package:flutter/material.dart';
import 'package:store_demo/constants/constants.dart';
import 'package:store_demo/widgets/product_details_card.dart';

import '../models/product.dart';
import '../widgets/store_appbar.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);
  final Product product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgGrey,
      appBar: const StoreAppBar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: ProductDetailCard(product: widget.product),
      ),
    );
  }
}
