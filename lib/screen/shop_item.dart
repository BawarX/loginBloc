import 'package:blocc/ECommerce/add_to_cart_bloc.dart';
import 'package:blocc/ECommerce/add_to_cart_state.dart';
import 'package:blocc/state_managment/cart_item_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopItems extends StatelessWidget {
  const ShopItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart App'),
        actions: [
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Text("");
            },
          ),
        ],
      ),
      body: ShopItemsWidget(),
    );
  }
}

class ShopItemsWidget extends StatelessWidget {
  const ShopItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: StreamBuilder(
              initialData: bloc.allItems,
              stream: bloc.getStream,
              builder: (context, snapshot) {
                return snapshot.data['shop items'].length > 0
                    ? shopItemListBuilder(snapshot)
                    : const Center(
                        child: Text("All items in shop hve been taken"),
                      );
              }),
        ),
      ],
    );
  }
}

Widget shopItemListBuilder(snapshot) {
  return ListView.builder(
    itemCount: snapshot.data["shop items"].length,
    itemBuilder: (context, index) {
      final shopList = snapshot.data["shop items"];
      return ListTile(
        title: Text(shopList[index]['name']),
        subtitle: Text("\$${shopList[index]['price']}"),
        trailing: IconButton(
          onPressed: () {
            bloc.addToCart(
              shopList[index],
            );
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("item added to the cart "),
                duration: Duration(seconds: 2),
              ),
            );
          },
          icon: const Icon(Icons.add_shopping_cart),
        ),
        onTap: () {},
      );
    },
  );
}
