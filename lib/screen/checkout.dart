import 'package:blocc/state_managment/cart_item_bloc.dart';
import 'package:flutter/material.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Checkout')),
        body: StreamBuilder(
            stream: bloc.getStream,
            initialData: bloc.allItems,
            builder: (context, snapshot) {
              return snapshot.data['cart items'].length > 0
                  ? Column(
                      children: [
                        Expanded(child: checkoutListBuilder(snapshot)),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text("chekcout"),
                        )
                      ],
                    )
                  : const Center(
                      child: Text("You haven't taken any item yet"),
                    );
            }));
  }
}

Widget checkoutListBuilder(snapshot) {
  return ListView.builder(
    itemCount: snapshot.data["cart items"].length,
    itemBuilder: (BuildContext context, index) {
      final cartList = snapshot.data["cart items"];
      return ListTile(
        title: Text(cartList[index]['name']),
        subtitle: Text("\$${cartList[index]['price']}"),
        trailing: IconButton(
          onPressed: () {
            bloc.removeFromCart(cartList[index]);
          },
          icon: const Icon(Icons.remove_shopping_cart),
        ),
      );
    },
  );
}
