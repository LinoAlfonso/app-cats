import 'package:flutter/material.dart';

import '../../../../config/config.dart';
import '../../domain/domain.dart';
import '../../feature_cats.dart';

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
            minHeight: MediaQuery.of(context).size.height * 0.4,
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) => customSliverApp(), childCount: 1)),
      ]),
    );
  }

  Widget customSliverApp(){
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Description
          Text('Description', style: TextStyles.bold(size: 18)),
          const SizedBox(height: 8),
          Text(cat.description ?? '', style: TextStyles.regular(size: 16)),
          const SizedBox(height: 24),

          //Temperament
          Text('Temperament', style: TextStyles.bold(size: 18)),
          const SizedBox(height: 8),
          Text(cat.temperament ?? '', style: TextStyles.regular(size: 16)),
          const SizedBox(height: 24),

          //Origin
          Text('Origin', style: TextStyles.bold(size: 18)),
          const SizedBox(height: 8),
          CountryCat(
              country: cat.origin,
              colorIcon: AppColors.gray,
              textStyle: TextStyles.regular(size: 16)),
          const SizedBox(height: 24),

          //Characteristics
          Text('Characteristics', style: TextStyles.bold(size: 18)),
          const SizedBox(height: 8),
          SectionAttributesCat(cat: cat)
        ],
      ),
    );
  }
}



