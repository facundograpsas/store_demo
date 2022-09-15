import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../models/product.dart';

class RatingStars extends StatelessWidget {
  const RatingStars(
      {Key? key,
      required this.product,
      this.size = 20,
      this.color = const Color.fromARGB(255, 223, 167, 2)})
      : super(key: key);

  final double size;
  final Product product;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: product.rating!['rate'] ?? 0,
      itemBuilder: (context, index) => Icon(
        Icons.star,
        color: color,
      ),
      itemCount: 5,
      itemSize: size,
      direction: Axis.horizontal,
    );
  }
}
