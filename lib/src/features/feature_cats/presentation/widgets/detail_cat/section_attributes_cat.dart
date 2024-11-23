import 'package:app_cats/src/features/feature_cats/domain/domain.dart';
import 'package:flutter/material.dart';

import 'item_attribute.dart';

class SectionAttributesCat extends StatelessWidget {
  final Cat cat;

  const SectionAttributesCat({super.key,required this.cat});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemAttribute(title: 'Weight', value: cat.weightCat?.weightInKg),
            ItemAttribute(title: 'Life span', value: cat.lifeSpanInYears),
            ItemAttribute(title: 'Intelligence', value: cat.intelligence?.toString() ?? ''),
            ItemAttribute(title: 'Adaptability', value: cat.adaptability?.toString() ?? ''),
            ItemAttribute(title: 'Affection level', value: cat.affectionLevel?.toString() ?? ''),
            ItemAttribute(title: 'Child friendly', value: cat.childFriendly?.toString() ?? ''),
          ],
        ),
      ),
    );
  }
}