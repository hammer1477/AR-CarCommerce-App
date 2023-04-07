import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {

  const CustomNavBar({
    Key? key,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return BottomAppBar(
       color: Colors.white,
       child: Container(
           height: 70,
           child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 IconButton(icon: Icon(Icons.home, color: Colors.black), onPressed: () {
                   Navigator.pushNamed(context, '/');
                 }),
                 IconButton(icon: Icon(Icons.shopping_cart, color: Colors.black), onPressed: () {
                   Navigator.pushNamed(context, '/compare');
                 }),
                 IconButton(icon: Icon(Icons.person, color: Colors.black,), onPressed: () {
                   Navigator.pushNamed(context, '/Profile');
                 }),
                 IconButton(icon: Icon(Icons.search_outlined, color: Colors.black,), onPressed: () {
                   Navigator.pushNamed(context, '/search');
                 }),
               ])
       )
   );
  }

}