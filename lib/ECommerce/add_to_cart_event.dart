import 'package:blocc/ECommerce/model.dart';
import 'package:equatable/equatable.dart';

abstract class CartEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddtoCart extends CartEvent {
  Product? product;
  AddtoCart(this.product);
  @override
  List<Object> get props => [product!];
}
