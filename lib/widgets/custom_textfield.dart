import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final TabController? tabController;
  final String text;
  final TextEditingController? textController;
  final Function(String)? onChanged;

  const CustomTextField({
    Key? key,
    this.tabController,
    required this.text,
    this.textController,
    this.onChanged
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: text,
        contentPadding: const EdgeInsets.only(bottom: 5.0, top: 12.5)
      ),
      onChanged: onChanged,
    );
  }

}