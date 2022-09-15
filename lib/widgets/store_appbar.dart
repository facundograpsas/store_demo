import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/shopping_cart_screen.dart';
import '../viewModel/storeVM.dart';

class StoreAppBar extends StatelessWidget with PreferredSizeWidget {
  const StoreAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('FStore'),
      actions: [
        Consumer<StoreViewModel>(builder: (context, value, child) {
          return Badge(
            showBadge: value.shoppingCart.isEmpty ? false : true,
            position: const BadgePosition(start: 20, bottom: 20),
            badgeContent: Consumer<StoreViewModel>(
              builder: (context, value, child) => Text(
                value.shoppingCart.length.toString(),
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            child: IconButton(
              key: const Key('shoppingCartIcon'),
              icon: const Icon(Icons.shopping_cart),
              onPressed: (() {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ShoppingCartScreen()));
              }),
            ),
          );
        }),
        const SizedBox(
          width: 20,
        )
      ],
      backgroundColor: Colors.amber,
    );
  }
}
