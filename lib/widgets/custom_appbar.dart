import 'package:flutter/material.dart';
import 'package:gradproj6/widgets/widgets.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10
        ),
        child:  Text(
          title,
          style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontFamily: 'Avenir',
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      iconTheme: IconThemeData(color: Colors.black),
      actions: [IconButton(onPressed: () {
        Navigator.pushNamed(context, '/wishlist');
      },
          icon: Icon(Icons.favorite))],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50.0);

}