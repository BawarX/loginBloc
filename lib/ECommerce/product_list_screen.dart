import 'package:blocc/ECommerce/add_to_cart_bloc.dart';
import 'package:blocc/ECommerce/add_to_cart_event.dart';
import 'package:blocc/ECommerce/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> productList = [
      Product(id: 1, name: 'product 1', price: 12),
      Product(id: 2, name: 'product 2', price: 11),
      Product(id: 3, name: 'product 3', price: 122),
      Product(id: 4, name: 'product 4', price: 124),
      Product(id: 5, name: 'product 5', price: 125),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('hi'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          final product = productList[index];
          return ListTile(
            title: Text("${productList[index].name}"),
            subtitle: Text('\$${productList[index].price}'),
            trailing: IconButton(
              onPressed: () {
                final cartBloc = context.read<CartBloc>();
                cartBloc.add(AddtoCart(product));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("item ADDED"),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              icon: const Icon(Icons.add_shopping_cart_outlined),
            ),
          );
        },
      ),
    );
  }
}
