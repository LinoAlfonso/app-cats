import 'package:flutter/material.dart';

import '../../../../config/config.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String> onChanged;

  const SearchTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        cursorColor: Colors.orange,
        cursorWidth: 1.5,
        style: TextStyles.medium(color: Colors.black),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
          hintText: hintText,
          hintStyle: TextStyles.medium(color: Colors.grey),
          prefixIcon: const Icon(Icons.search,color: Colors.orange,),
          border: InputBorder.none,
        ),
      ),
    );
  }
}