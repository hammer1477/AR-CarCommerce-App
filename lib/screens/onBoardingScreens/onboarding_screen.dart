import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradproj6/cubit/signup/signup_cubit.dart';
import 'package:gradproj6/screens/onBoardingScreens/email_verification_screen.dart';
import 'package:gradproj6/screens/onBoardingScreens/start_screen.dart';
import 'package:gradproj6/widgets/custom_appbar.dart';

import '../../repository/auth/auth_repository.dart';
import 'email_screen.dart';


class OnBoardingScreen extends StatelessWidget {
  static const routeName = '/onboarding';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: ( context ) => BlocProvider(
            create: (_) => SignUpCubit(authRepository: context.read<AuthRepository>()),
            child: OnBoardingScreen(),
        )
    );
  }


  static const List<Tab> tabs = <Tab>[
    Tab(text: 'Start'),
    Tab(text: 'Email'),
    Tab(text: 'Email Verification')
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: tabs.length,
        child: Builder(builder: (BuildContext context) {
          final TabController tabController = DefaultTabController.of(context)!;
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {}
          });
          return Scaffold(
            appBar: CustomAppBar(title: 'OnBoarding',),
            body: TabBarView(
              children: [
                Start(tabController: tabController,),
                Email(tabController: tabController,),
                EmailVerification(tabController: tabController)
              ],
            ),
          );
        }
        )
    );
  }
}