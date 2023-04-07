import 'package:gradproj6/Model/category.dart';

abstract class CategoryRepositoryIndex {
  Stream<List<Category>> getCategories();
}