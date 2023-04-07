import 'package:gradproj6/Model/product.dart';

abstract class ProductRepositoryIndex {
  Stream<List<Product>> getProducts();
}