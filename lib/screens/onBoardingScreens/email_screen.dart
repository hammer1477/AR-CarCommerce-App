import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/signup/signup_cubit.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/custom_textheader.dart';

class Email extends StatelessWidget {

  final TabController tabController;

  const Email({
    Key? key,
    required this.tabController
}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              CustomTextHeader(tabController: tabController,
                  text: 'What is your Email address'),
              CustomTextField(tabController: tabController,
                text: 'Enter your email address',
                onChanged: (value) {
                context.read<SignUpCubit>().emailChanged(value);
                },),
              CustomTextHeader(tabController: tabController,
                  text: 'Choose your new password'),
              CustomTextField(tabController: tabController,
                text: 'Enter your password',
                onChanged: (value) {
                context.read<SignUpCubit>().passwordChanged(value);
                },),
              CustomButton(tabController: tabController, text: 'Next Step',)
            ],
            //insert picture here
          ),
        );

      }
    );
  }

}