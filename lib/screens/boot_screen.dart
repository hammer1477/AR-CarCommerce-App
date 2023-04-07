import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradproj6/screens/onBoardingScreens/onboarding_screen.dart';

import '../bloc/auth/auth_bloc.dart';
import 'home_screen.dart';

class BootScreen extends StatelessWidget {

  static const String routeName = '/boot';


  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) => BootScreen()
    );
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocListener<AuthBloc,AuthState>(
        listener: (context, state){
          if(state.status == AuthStatus.unauthenticated){
            Timer(
                Duration(seconds: 1),() => Navigator.of(context).pushNamedAndRemoveUntil(OnBoardingScreen.routeName, ModalRoute.withName('/onboarding'),
            ),
            );
          }
          else if(state.status == AuthStatus.authenticated) {
            Timer(
                Duration(seconds: 1),
                    () => Navigator.of(context).pushNamed(HomeScreen.routeName)
            );
          }
        },
        child: Scaffold(
          body: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Arrow')
                ],
              ),
            )
          ),
        ),
      ),
    );
  }

}