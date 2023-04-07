import 'package:flutter/material.dart';
import 'package:gradproj6/screens/screens.dart';
import 'package:gradproj6/widgets/custom_appbar.dart';
import 'package:gradproj6/widgets/custom_navbar.dart';
import 'package:gradproj6/widgets/custom_productcard.dart';

import '../Model/category.dart';
import '../Model/product.dart';


class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';


  static Route route({required Category category}) {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => CatalogScreen(category: category)
    );
  }

  final Category category;

  const CatalogScreen({required this.category});


  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products.where((product) => product.category == category.name).toList();
    return Scaffold(
      appBar: CustomAppBar(title: category.name),
      bottomNavigationBar: CustomNavBar(),
      body: GridView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 16.0
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
          childAspectRatio: 1.15
      ),
          itemCount: categoryProducts.length,
          itemBuilder: (BuildContext context, int index){
            return ProductCard(
                product: categoryProducts[index]
            );
          })
      //ProductCard(product: Product.products[0])
    );
  }
}