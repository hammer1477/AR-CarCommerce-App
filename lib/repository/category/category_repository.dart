import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gradproj6/Model/category.dart';
import 'package:gradproj6/repository/category/category_repository_index.dart';

class CategoryRepository extends CategoryRepositoryIndex {
  final FirebaseFirestore _firebaseFirestore;


  CategoryRepository({FirebaseFirestore? firebaseFirestore}) : _firebaseFirestore = firebaseFirestore?? FirebaseFirestore.instance;

  @override
  Stream<List<Category>> getCategories() {
    return _firebaseFirestore
        .collection('categories')
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) => Category.getCategory(doc)).toList();
    });
  }

}