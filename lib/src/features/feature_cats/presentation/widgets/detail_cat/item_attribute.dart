import 'package:flutter/material.dart';

import '../../../../../config/config.dart';

class ItemAttribute extends StatelessWidget {
  final String title;
  final String value;

  const ItemAttribute({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyles.medium(color: Colors.black, size: 15),
          ),
          DecoratedBox(
            decoration: const BoxDecoration(
              color: AppColors.grayLight,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                value,
                style: TextStyles.medium(color: Colors.black, size: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}