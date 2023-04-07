import 'package:equatable/equatable.dart';
import 'package:gradproj6/Model/product.dart';

class WishList extends Equatable {
  final List<Product> wishlists;

  const WishList({this.wishlists = const <Product>[]});


  @override
  List<Object?> get props => [wishlists];

}