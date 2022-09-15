import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({Key? key, required this.product, this.width, this.height})
      : super(key: key);

  final Product product;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      product.image!,
      fit: BoxFit.contain,
      width: width,
      height: height,
    );
  }
}
