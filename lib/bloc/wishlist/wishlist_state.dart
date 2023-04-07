part of 'wishlist_bloc.dart';

abstract class WishListState extends Equatable {
  const WishListState();

  @override
  List<Object> get props => [];

}

class WishListLoading extends WishListState {
  @override
  List<Object> get props => [];
}

class WishListLoaded extends WishListState {
  final WishList wishlist;

  const WishListLoaded({this.wishlist = const WishList()});

  @override
  List<Object> get props => [wishlist];
}

class WishListError extends WishListState {
  @override
  List<Object> get props => [];
}