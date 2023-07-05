import 'package:blocc/ECommerce/add_to_cart_event.dart';
import 'package:blocc/ECommerce/add_to_cart_state.dart';
import 'package:blocc/ECommerce/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc(super.initialState);

  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is AddtoCart) {
      final updatedCart = List<Product>.from(state.cartItems)
        ..add(event.product!);
      //emit(CartState(updatedCart));
    }
  }
}
