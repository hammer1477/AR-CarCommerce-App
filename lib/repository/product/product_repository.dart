import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gradproj6/Model/product.dart';
import 'package:gradproj6/repository/product/product_repository_index.dart';

class ProductRepository extends ProductRepositoryIndex {
  final FirebaseFirestore _firebaseFirestore;

  ProductRepository({FirebaseFirestore? firebaseFirestore}) : _firebaseFirestore = firebaseFirestore?? FirebaseFirestore.instance;

  @override
  Stream<List<Product>> getProducts() {
    return _firebaseFirestore
        .collection('products')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Product.getProduct(doc)).toList();
    });
  }

}