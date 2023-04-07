import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Model/models.dart';
import '../../repository/category/category_repository.dart';

part 'category_event.dart';
part 'category_state.dart';


class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  StreamSubscription? _categorySubscription;


  CategoryBloc({required CategoryRepository categoryRepository}) :
        _categoryRepository = categoryRepository,
        super(CategoryLoading()) {
    on<StartCategory>(_mapStartCategoryToState);
    on<LoadCategories>(_mapLoadCategoryToState);
  }

  void _mapStartCategoryToState(StartCategory event, Emitter<CategoryState> emit) async {
    _categorySubscription?.cancel();
    _categorySubscription = _categoryRepository.
    getCategories().
    listen((event) => add(LoadCategories(event)));

  }

  void _mapLoadCategoryToState(LoadCategories event, Emitter<CategoryState> emit) async {
    emit(CategoryLoaded(categories: event.categories));
  }




}