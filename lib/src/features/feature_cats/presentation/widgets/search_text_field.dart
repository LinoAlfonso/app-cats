import 'package:flutter/material.dart';

import '../../../../config/config.dart';

class SearchTextField extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String> onChanged;
  final VoidCallback? onClear;

  const SearchTextField({
    super.key,
    required this.focusNode,
    required this.controller,
    required this.hintText,
    required this.onChanged,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        autofocus: false,
        focusNode: focusNode,
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
          suffixIcon: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: onClear,
                ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}