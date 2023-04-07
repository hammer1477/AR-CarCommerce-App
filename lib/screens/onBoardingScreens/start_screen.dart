import 'package:flutter/material.dart';

import '../../widgets/custom_button.dart';

class Start extends StatelessWidget {

  final TabController tabController;

  const Start({
    Key? key,
    required this.tabController
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
      child: Column(
        children: [
          Container(
            //insert picture here
          ),
          SizedBox(height: 50),
          Text(
            'Welcome to our App',

          ),
          SizedBox(height: 20,),
          Text(
            'Some Description'
          ),
          CustomButton(tabController: tabController,)
        ],
        //insert picture here
      ),
    );
  }

}