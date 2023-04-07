import 'package:flutter/material.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/custom_textheader.dart';

class EmailVerification extends StatelessWidget {


  final TabController tabController;

  const EmailVerification({
    Key? key,
    required this.tabController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final codeController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
      child: Column(
        children: [
          CustomTextHeader(tabController: tabController, text:'Did you get your verification code?'),
          CustomTextField(tabController: tabController, text: 'Enter your verification code', textController: codeController,),
          CustomButton(tabController: tabController, text: 'Next Step',)
        ],
        //insert picture here
      ),
    );
  }
}