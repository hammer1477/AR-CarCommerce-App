import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Model/product.dart';
import '../bloc/wishlist/wishlist_bloc.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double leftPosition;
  final bool isWishList;

  const ProductCard({
    Key? key,
    required this.product,
    this.leftPosition = 5,
    this.isWishList = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      //  context.read<WishListBloc>().add(AddWishListProduct(product));
        Navigator.pushNamed(context, '/product', arguments: product);
      },
      child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2.5,
              height: 150,
              child: Image.asset(
                  Product.products[0].imageUrl,
                  fit: BoxFit.cover
              ),
            ),
            Positioned(
                top: 60,
                left: 5,
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.5 - 10,
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.black.withAlpha(50)
                  ),

                )
            ),
            Positioned(
                top: 65,
                left: 5,
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.5 - 10,
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.black
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(product.name, style: TextStyle(color: Colors.white),),
                                Text('\$${product.price}', style: TextStyle(color: Colors.white),)
                              ],
                            ),
                          ),
                          Expanded(
                              child: IconButton(onPressed: () {},
                                  icon: Icon(Icons.add_circle, color: Colors.white)
                              ),
                          ),
                          isWishList ?
                          Expanded(
                              child: IconButton(onPressed: () {},
                                  icon: Icon(Icons.remove_circle,
                                      color: Colors.white)
                              ),
                          ) : SizedBox()
                        ]
                    ),
                  ),
                )
            )

          ]
      ),
    );
  }
}