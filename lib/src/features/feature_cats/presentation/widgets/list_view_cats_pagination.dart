import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

import '../../../../config/config.dart';
import '../../domain/domain.dart';
import '../../feature_cats.dart';



class ListViewCatsPagination extends StatelessWidget {
  final CatsProvider catsProvider;
  final Function(Cat cat) onTapCat;

  const ListViewCatsPagination({super.key, required this.onTapCat, required this.catsProvider});

  @override
  Widget build(BuildContext context) {
    //final catsProvider = context.watch<CatsProvider>();
    return PagedListView<int, Cat>(
      pagingController: catsProvider.pagingController,
      builderDelegate: PagedChildBuilderDelegate<Cat>(
        itemBuilder: (context, cat, index) {
          return CatCard(cat: cat, onTapCat: onTapCat);
        },
        firstPageProgressIndicatorBuilder: (_) => const Center(
          child: CircularProgressIndicator(),
        ),
        newPageProgressIndicatorBuilder: (_) => const Center(
          child: CircularProgressIndicator(),
        ),
        noItemsFoundIndicatorBuilder: (_) =>  Center(
          child: Text('Search results...',style: TextStyles.bold(size: 20),),
        ),
      ),
    );
  }
}