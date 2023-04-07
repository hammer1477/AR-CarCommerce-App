part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];

}

class StartCategory extends CategoryEvent{}

class LoadCategories extends CategoryEvent{
  final List<Category> categories;

  LoadCategories(this.categories);

  @override
  List<Object> get params => [categories];
}
