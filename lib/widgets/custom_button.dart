import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/signup/signup_cubit.dart';

class CustomButton extends StatelessWidget {

  final TabController tabController;
  final String text;


  const CustomButton({
    Key? key,
    required this.tabController,
    this.text = 'Start',
});

  @override
  Widget build(BuildContext context) {
      return ElevatedButton(onPressed: () {
        tabController.animateTo(tabController.index + 1);
        if(tabController.index == 2){
          context.read<SignUpCubit>().signup();
        }
      },
          child: Text(text));
  }

}