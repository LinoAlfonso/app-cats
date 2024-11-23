import 'package:app_cats/src/features/feature_cats/feature_cats.dart';
import 'package:flutter/material.dart';

import '../../../../config/config.dart';
import '../../domain/domain.dart';

class DetailCatView extends StatelessWidget {
  final Cat cat;

  const DetailCatView({super.key, required this.cat});

  static const String routeName = "detailCat";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
          slivers: [
        SliverPersistentHeader(
          pinned: true,
         delegate: CustomSliverHeaderDelegate(
            cat: cat,
            expandedHeight: MediaQuery.of(context).size.height * 0.6,
            minHeight: MediaQuery.of(context).size.height * 0.3,
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => customSliverApp(), childCount: 1)),
      ]),
    );
  }

  Widget customSliverApp(){
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Description', style: TextStyles.bold(size: 18)),
          const SizedBox(height: 8),
          Text(cat.description ?? '', style: TextStyles.regular(size: 16)),
          const SizedBox(height: 24),

          Text('Temperament', style: TextStyles.bold(size: 18)),
          const SizedBox(height: 8),
          Text(cat.temperament ?? '', style: TextStyles.regular(size: 16)),
          const SizedBox(height: 24),

          Text('Origin', style: TextStyles.bold(size: 18)),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.location_on, color: AppColors.gray),
              const SizedBox(width: 8),
              Text(cat.origin ?? '', style: TextStyles.regular(size: 16)),
            ],
          ),
          const SizedBox(height: 24),

          Text('Characteristics', style: TextStyles.bold(size: 18)),
          const SizedBox(height: 8),
          SectionAttributesCat(cat: cat)
        ],
      ),
    );
  }
}



