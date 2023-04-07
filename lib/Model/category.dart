import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

   Category({
    required this.name,
    required this.imageUrl
});

   static List<Category> categories = [
     Category(name: 'cars', imageUrl: 'assets/AlfaRomeo.jpg'),
     Category(name: 'cars2', imageUrl: 'assets/AlfaRomeo.jpg'),
     Category(name: 'cars3', imageUrl: 'assets/AlfaRomeo.jpg'),


   ];


   static Category getCategory(DocumentSnapshot snapshot){
     Category category = Category(name: snapshot['name'], imageUrl: snapshot['imageUrl']);
     return category;
   }


  @override
  List<Object?> get props => [name, imageUrl];


}