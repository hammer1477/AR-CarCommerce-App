import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Model/models.dart';
import '../../Model/wishlist.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';


class WishListBloc extends Bloc<WishListEvent, WishListState> {

  WishListBloc() : super(WishListLoading()) {
    on<StartWishList>(_mapStartWishListToState);
    on<AddWishListProduct>(_mapAddWishListProduct);
    on<RemoveWishListProduct>(_mapRemoveWishListProduct);
  }

  void _mapStartWishListToState(StartWishList event, Emitter<WishListState> emit) async {
    emit(WishListLoading());
    try {
      await Future<void>.delayed(Duration(seconds: 1));
      emit(WishListLoaded());
    }
    catch (_) {
      emit(WishListError());
    }
  }


  void _mapAddWishListProduct(AddWishListProduct event,
      Emitter<WishListState> emit) {
    final state = this.state;
    if (state is WishListLoaded) {
      try {
        emit (WishListLoaded(
          wishlist: WishList(wishlists:List.from(state.wishlist.wishlists)..add(event.product))));
      }
      catch (_) {
        emit(WishListError());
      }
    }
  }


  void _mapRemoveWishListProduct(
      RemoveWishListProduct event, Emitter<WishListState> emit
      )  {
    final state = this.state;
    if (state is WishListLoaded){
      try{
        emit(WishListLoaded(wishlist: WishList(wishlists: [...state.wishlist.wishlists]..remove(event.product),),));
      }
      catch (_) {
        emit(WishListError());
      }
    }


  }
}