import 'package:flutter/material.dart';

import '../../../../config/config.dart';
import '../../../feature_core/feature_core.dart';
import '../../domain/domain.dart';
import '../presentation.dart';


class CatCard extends StatelessWidget {
  final Cat cat;
  final Function(Cat) onTapCat;
  const CatCard({super.key, required this.cat, required this.onTapCat});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Positioned.fill(
              child: RenderImageNetwork(
                imageUrl: cat.imageCat?.url??'',
                size: const Size(double.infinity, 180),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          cat.name??'',
                          style: TextStyles.bold(color: Colors.white,size: 16),
                        ),
                      ),
                    ),
                    ButtonCircleIcon(
                        icon: const Icon(
                        Icons.more_horiz,
                        color: Colors.black),
                        backgroundColor: Colors.white,
                        onPressed: () => onTapCat(cat)),
                  ],
                ),
               const SizedBox(height: 180,),
                Container(
                  color: Colors.black.withOpacity(0.5),
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CountryCat(
                          country: cat.origin,
                          colorIcon: Colors.white,
                          textStyle: TextStyles.medium(color: Colors.white)),
                      Row(
                        children: [
                          Text(
                            "Intelligence: ${cat.intelligence}",
                            style: TextStyles.medium(color: Colors.white),
                          ),
                          const SizedBox(width: 4),
                          const Icon(Icons.star, color: Colors.white, size: 18),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
