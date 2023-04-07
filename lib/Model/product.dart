import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,

  });

  static List<Product> products = [
    Product(
      name: 'Soft Drink 1',
      category: 'Soft Drinks',
      imageUrl: 'assets/AlfaRomeo.jpg',
      price: 2.99,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      name: 'Soft Drink 2',
      category: 'Soft Drinks',
      imageUrl: 'assets/AlfaRomeo.jpg',
      price: 2.99,
      isRecommended: false,
      isPopular: false,
    ),
    Product(
      name: 'Smoothies 1',
      category: 'Smoothies',
      imageUrl: 'assets/AlfaRomeo.jpg',
      price: 2.99,
      isRecommended: false,
      isPopular: true,
    ),
    Product(
      name: 'Smoothies2',
      category: 'Soft Drinks',
      imageUrl: 'assets/AlfaRomeo.jpg',
      price: 2.99,
      isRecommended: true,
      isPopular: true,
    )
  ];

  static Product getProduct(DocumentSnapshot snapshot){
    Product product = Product(
        name: snapshot['name'],
        category: snapshot['category'],
        imageUrl: snapshot['imageUrl'],
        price: snapshot['price'],
        isRecommended: snapshot['isRecommended'],
        isPopular: snapshot['isPopular']
    );
    return product;
  }

  @override
  List<Object?> get props => [name, category, imageUrl, price, isRecommended, isPopular];

}