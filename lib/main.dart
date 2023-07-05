import 'package:blocc/screen/checkout.dart';
import 'package:blocc/screen/shop_item.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const ShopItems(),
        '/checkout': (context) => const Checkout()
      },
    );
  }
}
