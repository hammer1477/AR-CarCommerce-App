import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradproj6/bloc/product/product_bloc.dart';
import 'package:gradproj6/widgets/custom_appbar.dart';
import 'package:gradproj6/widgets/custom_navbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gradproj6/widgets/custom_carouselcard.dart';
import 'package:gradproj6/bloc/category/category_bloc.dart';
import '../Model/category.dart';
import '../Model/product.dart';
import '../widgets/custom_productcard.dart';
import '../widgets/custom_sectiontitle.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';


  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => HomeScreen()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavBar(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Image.asset(
                    "assets/back.jpg",
                    height: 30,
                    width: 30,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  }
                ),
                Column(children: [
                  Text('Home',
                      style:
                      TextStyle(fontWeight: FontWeight.w700, fontSize: 22)),
                ]),
                IconButton(
                  icon: Image.asset(
                    "assets/wish.jpg",
                    height: 40,
                    width: 40,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/wishlist');
                  },
                ),
              ],
            ),
          ),
          Container(

            child: BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state){
                if(state is CategoryLoading){
                  return Center(
                    child: CircularProgressIndicator()
                  );
                }
                if (state is CategoryLoaded){
                  return CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 1.5,
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      initialPage: 2,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      autoPlay: true,
                    ),
                    items: state.categories.map((category) => CustomCarouselCard(category: category)).toList(),
                  );
                }
                else {
                  return Text('No data availabe');
                }
              }
            )
          ),
          SectionTitle(title: 'RECOMMENDED'),
         // ProductCard(product: Product.products[0])
          SizedBox(
            height: 165,
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state){
                if(state is ProductLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ProductLoaded){
                    return ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10.0
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProductCard(product: state.products[index],),
                        );
                      },
                    );
                  }
               return Text('No Products to show');
              },
            )
          )
    ]
    ),

    );
  }




}

