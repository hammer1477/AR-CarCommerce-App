import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradproj6/widgets/custom_appbar.dart';
import 'package:gradproj6/widgets/custom_navbar.dart';

import '../Model/product.dart';
import '../bloc/wishlist/wishlist_bloc.dart';
import '../widgets/custom_productcard.dart';


class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist';


  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => WishlistScreen()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'wishlist'),
      bottomNavigationBar: CustomNavBar(),
      body: BlocBuilder<WishListBloc, WishListState>(
        builder: (context, state) {
          if (state is WishListLoading){
            print('loading');
            return Center(child: CircularProgressIndicator());
          }
          if (state is WishListLoaded){
            print('loaded');
            return GridView.builder(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 16.0
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 2.4,
                ),
                itemCount: state.wishlist.wishlists.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: ProductCard(
                      product: state.wishlist.wishlists[index],
                      leftPosition: 100,
                      isWishList: true,
                    ),
                  );
                }
            );
          }
          else {
            return Text('something went wrong');
          }
        }),

    );
  }
}