import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradproj6/bloc/category/category_bloc.dart';
import 'package:gradproj6/cubit/login/login_cubit.dart';
import 'package:gradproj6/repository/auth/auth_repository.dart';
import 'package:gradproj6/repository/category/category_repository.dart';
import 'package:gradproj6/repository/product/product_repository.dart';
import 'package:gradproj6/repository/user/user_repository.dart';
import 'package:gradproj6/screens/boot_screen.dart';
import 'package:gradproj6/screens/home_screen.dart';
import 'package:gradproj6/screens/login_screen.dart';
import 'package:gradproj6/screens/onBoardingScreens/onboarding_screen.dart';
import 'package:gradproj6/screens/profile_screen.dart';
import 'app_router.dart';
import 'bloc/auth/auth_bloc.dart';
import 'bloc/product/product_bloc.dart';
import 'bloc/wishlist/wishlist_bloc.dart';
import 'package:dcdg/dcdg.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (context) => AuthRepository())
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => WishListBloc()..add(StartWishList())),
          BlocProvider(create: (context) => CategoryBloc(categoryRepository: CategoryRepository())..add(StartCategory())),
          BlocProvider(create: (context) => ProductBloc(productRepository: ProductRepository())..add(StartProduct())),
          BlocProvider(create: (context) => AuthBloc(authRepository: context.read<AuthRepository>())),
          BlocProvider(create: (context) => LoginCubit(authRepository: context.read<AuthRepository>()))
        ],
        child: MaterialApp(
          title: 'tfteker?',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: profileScreen.routeName,
        ),

      ),
    );
  }
}





