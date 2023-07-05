import 'dart:async';

class CartItemsBloc {
  final cartStreamController = StreamController.broadcast();

  Stream get getStream => cartStreamController.stream;

  final Map allItems = {
    'shop items': [
      {'name': 'App dev kit', 'price': 20, 'id': 1},
      {'name': 'app consulation', 'price': 30, 'id': 2},
      {'name': 'logoDesign', 'price': 30, 'id': 3},
      {'name': 'code Review', 'price': 90, 'id': 4}
    ],
    'cart items': []
  }; // for holding the data.

  void dispose() {
    cartStreamController.close();
  }

  void addToCart(item) {
    //allItems['shop items'].remove(item);
    allItems['cart items'].add(item);
    cartStreamController.sink.add(allItems);
  }

  void removeFromCart(item) {
    //allItems['shop items'].add(item);
    allItems['cart items'].remove(item);
    cartStreamController.sink.add(allItems);
  }
}

final bloc = CartItemsBloc();
