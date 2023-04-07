import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradproj6/screens/boot_screen.dart';
import 'package:gradproj6/screens/cart_screen.dart';
import 'package:gradproj6/screens/change_email.dart';
import 'package:gradproj6/screens/change_name.dart';
import 'package:gradproj6/screens/change_password.dart';
import 'package:gradproj6/screens/compare_screen.dart';
import 'package:gradproj6/screens/home_screen.dart';
import 'package:gradproj6/screens/change_phone.dart';
import 'package:gradproj6/screens/login_screen.dart';
import 'package:gradproj6/screens/onBoardingScreens/onboarding_screen.dart';
import 'package:gradproj6/screens/profile_screen.dart';
import 'package:gradproj6/screens/screens.dart';
import 'package:gradproj6/screens/search_screen.dart';

import 'Model/category.dart';
import 'Model/product.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings){
    print('This is route: ${settings.name}');
  switch(settings.name) {
    case '/':
      return HomeScreen.route();
    case HomeScreen.routeName:
      return HomeScreen.route();
    case CartScreen.routeName:
      return CartScreen.route();
    case WishlistScreen.routeName:
      return WishlistScreen.route();
    case ProductScreen.routeName:
      return ProductScreen.route(product: settings.arguments as Product);
    case CatalogScreen.routeName:
      return CatalogScreen.route(category: settings.arguments as Category);
    case OnBoardingScreen.routeName:
      return OnBoardingScreen.route();
    case LoginScreen.routeName:
      return LoginScreen.route();
    case BootScreen.routeName:
      return BootScreen.route();
    case profileScreen.routeName:
      return profileScreen.route();
    case emailChange.routeName:
      return emailChange.route();
    case NameChange.routeName:
      return NameChange.route();
    case changepassword.routeName:
      return changepassword.route();
    case changemobile.routeName:
      return changemobile.route();
    case searchScreen.routeName:
      return searchScreen.route();
    case compareScreen.routeName:
      return compareScreen.route();
    default:
      return _errorRoute();
  }


  }
  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: RouteSettings(name: '/error'),
        builder: (_) => Scaffold(appBar: AppBar(title: Text("Error")))
    );
  }
}


