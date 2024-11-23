import 'package:flutter/material.dart';

import '../../../../../config/config.dart';
import '../../../domain/domain.dart';
import '../../../feature_cats.dart';

class CustomSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Cat cat;
  final double expandedHeight;
  final double minHeight;

  CustomSliverHeaderDelegate({
    required this.cat,
    required this.expandedHeight,
    required this.minHeight,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        RenderImageNetwork(
          imageUrl: cat.imageCat?.url ?? '',
          size: Size(double.infinity, expandedHeight),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.4, 1],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              cat.name ?? '',
              style: TextStyles.bold(color: Colors.white, size: 18),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 28,horizontal: 16),
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: AppColors.orangePrimary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                visualDensity: VisualDensity.compact,
                icon: const Icon(
                  Icons.arrow_back,
                  size: 20,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}