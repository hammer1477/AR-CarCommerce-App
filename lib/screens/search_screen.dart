import 'package:flutter/material.dart';
import 'package:gradproj6/widgets/custom_appbar.dart';
import 'package:gradproj6/widgets/custom_navbar.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';


class searchScreen extends StatelessWidget {
  static const String routeName = '/search';


  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => searchScreen()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // This is handled by the search bar itself.
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          buildFloatingSearchBar(),
        ],
      ),

    );
  }

  Widget buildFloatingSearchBar() {

    return FloatingSearchBar(
      hint: 'Search...',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment:  -1.0,
      openAxisAlignment: 0.0,
      width: 600,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        // Call your model, bloc, controller here.
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: Colors.accents.map((color) {
                return Container(height: 112, color: color);
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}

// ListView(
// children:[
// Container(
// padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// IconButton(
// icon: Image.asset(
// "assets/back.jpg",
// height: 34,
// width: 34,
// ),
// onPressed: () {
// Navigator.pushNamed(context, '/');
// }
// ),
// Column(children: [
// Text('ARC',
// style:
// TextStyle(fontWeight: FontWeight.w100, fontSize: 16)),
// Text('Search',
// style:
// TextStyle(fontWeight: FontWeight.w700, fontSize: 24)),
// ]),
// IconButton(
// icon: Image.asset(
// "assets/wish.jpg",
// height: 40,
// width: 40,
// ),
// onPressed: () {
// Navigator.pushNamed(context, '/wishlist');
// // Add to wish List
// },
// ),