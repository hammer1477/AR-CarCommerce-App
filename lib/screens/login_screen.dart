import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradproj6/cubit/login/login_cubit.dart';
import 'package:gradproj6/screens/home_screen.dart';
import 'package:gradproj6/screens/onBoardingScreens/onboarding_screen.dart';
import 'package:gradproj6/widgets/custom_appbar.dart';

import '../bloc/auth/auth_bloc.dart';
import '../repository/auth/auth_repository.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/custom_textheader.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';


  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context)
        {
          //  return BlocProvider.of<AuthBloc>(context).state.status == AuthStatus.unauthenticated ?
          //  LoginScreen() : HomeScreen();
          return BlocProvider(
            create: (context) => LoginCubit(authRepository: context.read<AuthRepository>()),
            child: LoginScreen(),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: CustomAppBar(title: 'login'),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextHeader(
                  text: 'Enter your Email address'),
              BlocBuilder<LoginCubit,LoginState>(
                  buildWhen: (previous, current) => previous.email != current.email,
                  builder: (context, state) {
                    return CustomTextField(
                      text: 'email address',
                      onChanged: (email) {
                        context.read<LoginCubit>().emailChanged(email);
                      },);
                  })
              ,
              CustomTextHeader(
                  text: 'Enter your password'),
              BlocBuilder<LoginCubit,LoginState>(
                buildWhen: (previous, current) => previous.password != current.password,
                  builder: (context, state) {
                    return CustomTextField(
                      text: 'password',
                      onChanged: (password) {
                        context.read<LoginCubit>().passwordChanged(password);
                      },);
                  }),
              ElevatedButton(child: Text('Login'),
              onPressed: () {
                context.read<LoginCubit>().login();
              },),
              ElevatedButton(child: Text('Signup'),
                onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(OnBoardingScreen.routeName, ModalRoute.withName('/onboarding'));
                },)
            ],
          ),
        )
      );
  }
}