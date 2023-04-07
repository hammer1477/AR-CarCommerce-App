import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradproj6/widgets/custom_appbar.dart';
import 'package:gradproj6/widgets/custom_carouselcard.dart';
import 'package:gradproj6/widgets/custom_navbar.dart';

import '../Model/product.dart';
import '../bloc/wishlist/wishlist_bloc.dart';


class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';


  static Route route({required Product product}) {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => ProductScreen(product: product,)
    );
  }

  final Product product;

  ProductScreen({
    required this.product
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.share, color: Colors.white) ),
              BlocBuilder<WishListBloc, WishListState>(
                  builder: (context, state) {
                    return IconButton(
                        onPressed: () {
                      context.read<WishListBloc>().add(AddWishListProduct(product));
                    },
                        icon: Icon(Icons.favorite, color: Colors.white) );
                  }),
                  IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart), color: Colors.white),

            ],
          )
        )
      ),
      body:ListView(
        children:[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Image.asset(
                    "assets/back.jpg",
                    height: 34,
                    width: 34,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  }
                  ),
                Column(children: [
                  Text('add manufacturer here',
                      style:
                      TextStyle(fontWeight: FontWeight.w100, fontSize: 16)),
                  Text(product.name,
                      style:
                      TextStyle(fontWeight: FontWeight.w700, fontSize: 24)),
                ]),
                IconButton(
                  icon: Image.asset(
                    "assets/wish.jpg",
                    height: 40,
                    width: 40,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/wishlist');
                    // Add to wish List
                  },
                ),
              ],
            ),
          ),
          CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 1.5,
            viewportFraction: 0.9,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            initialPage: 2,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            autoPlay: true,
          ),
          items: [CustomCarouselCard(product: product)],
        ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    alignment: Alignment.bottomCenter,
                    color: Colors.black.withAlpha(50)
                  ),
                  Container(
                      margin: const EdgeInsets.all(0.0),
                      width: MediaQuery.of(context).size.width - 10,
                      height: 60,
                      alignment: Alignment.bottomCenter,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(product.name, style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 18),),
                            Text('${product.price}', style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 18))
                          ],
                        ),
                      )
                  )
                ],
              ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text('Product information',style:TextStyle(color: Colors.blue,fontWeight: FontWeight.w700,fontSize: 18)),
              children: [
                ListTile(
                  title: Text('lorumx5',style:TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 15)),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text('Delivery information',style:TextStyle(color: Colors.blue,fontWeight: FontWeight.w700,fontSize: 18)),
              children: [
                ListTile(
                  title: Text('lorumx5',style:TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 15)),
                )
              ],
            ),
          ),
          MaterialButton(
            minWidth: double.infinity,
            height:60,
            onPressed : () {

            },
            color: Colors.white,

            child: Text("Preview in Ar",style: TextStyle(
                fontWeight: FontWeight.w600,fontSize: 16,color: Colors.black
            ),),
          ),
        ]
    ),



      // CustomCarouselCard(product: product,)
    );
  }
}