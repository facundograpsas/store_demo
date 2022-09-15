import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_demo/constants/constants.dart';
import 'package:store_demo/viewModel/storeVM.dart';

import '../widgets/product_card.dart';
import '../widgets/store_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final storeVM = Provider.of<StoreViewModel>(context, listen: false);
    storeVM.loadPreferences();
    storeVM.fetchProducts();
  }

  void loadSharedPreferences() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgGrey,
      appBar: const StoreAppBar(),
      body: Center(
        child: Consumer<StoreViewModel>(builder: (context, model, child) {
          switch (model.status) {
            case Status.loading:
              return const CircularProgressIndicator();
            case Status.completed:
              return GridView.builder(
                  physics: const ScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisExtent: 400,
                      maxCrossAxisExtent: 300,
                      childAspectRatio: 4 / 7,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1),
                  itemCount: model.productList.length,
                  itemBuilder: ((context, index) {
                    var product = model.productList[index];
                    return Tooltip(
                      message: product.title,
                      child: Container(
                          margin: const EdgeInsets.all(4),
                          child: ProductCard(product: product)),
                    );
                  }));
            case Status.error:
              return const Text("Upss, there's been an error");
          }
        }),
      ),
    );
  }
}
