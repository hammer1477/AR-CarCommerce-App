import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Model/models.dart';
import '../../repository/category/category_repository.dart';
import '../../repository/product/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';


class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  StreamSubscription? _productSubscription;


  ProductBloc({required ProductRepository productRepository}) :
        _productRepository = productRepository,
        super(ProductLoading()) {
    on<StartProduct>(_mapStartProductToState);
    on<LoadProducts>(_mapLoadProductToState);
  }

  void _mapStartProductToState(StartProduct event, Emitter<ProductState> emit) async {
    _productSubscription?.cancel();
    _productSubscription = _productRepository.
    getProducts().
    listen((event) => add(LoadProducts(event)));

  }

  void _mapLoadProductToState(LoadProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoaded(products: event.products));
  }




}