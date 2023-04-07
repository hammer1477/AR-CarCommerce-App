part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];

}

class StartProduct extends ProductEvent{}

class LoadProducts extends ProductEvent{
  final List<Product> products;

  LoadProducts(this.products);

  @override
  List<Object> get params => [products];
}