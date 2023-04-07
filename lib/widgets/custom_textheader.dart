import 'package:flutter/material.dart';

class CustomTextHeader extends StatelessWidget {

  final TabController? tabController;
  final String text;

  const CustomTextHeader({
    Key? key,
    this.tabController,
    this.text = 'What is your email address'
});


  @override
  Widget build(BuildContext context) {
   return Text(text);
  }

}