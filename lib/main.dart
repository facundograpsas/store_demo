import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_demo/viewModel/storeVM.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StoreViewModel(),
      child: MaterialApp(
        title: 'Fstore',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: const HomeScreen(title: "FStore"),
      ),
    );
  }
}
