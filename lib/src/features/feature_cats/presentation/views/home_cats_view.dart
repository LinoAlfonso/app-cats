import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

import '../../../../config/config.dart';
import '../../domain/domain.dart';
import '../presentation.dart';

class HomeCatsView extends StatefulWidget {

  const HomeCatsView({super.key});
  static const routeName = 'HomeCats';

  @override
  State<HomeCatsView> createState() => _HomeCatsViewState();
}

class _HomeCatsViewState extends State<HomeCatsView> {

  final controllerSearch = TextEditingController();
  final FocusNode focusNode = FocusNode();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: HeaderHome(
        onTapLogo: (){},
      ),
      body: Consumer<CatsProvider>(
        builder: (context,catsProvider,child) {
          return SafeArea(
            child: Column(
              children: [
                Container(
                  color: AppColors.orangePrimary,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30,right: 30,bottom: 10),
                    child: SearchTextField(
                      focusNode: focusNode,
                      controller: controllerSearch,
                      hintText: 'Breed cat...',
                      onChanged: (value) {
                        searchCat(value);
                      },
                      onClear: onClear,
                    ),
                  ),
                ),
            Expanded(
              child: PagedListView<int, Cat>(
                pagingController: catsProvider.pagingController,
                builderDelegate: PagedChildBuilderDelegate<Cat>(
                  itemBuilder: (context, cat, index) {
                    return CatCard(
                      cat: cat,
                      onTapCat: onTapCat,
                    );
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
              ),
            )
              ],
            ),
          );
        }
      ),
     );
  }

  void onTapCat(Cat cat) {
    focusNode.unfocus();
    context.pushNamed(DetailCatView.routeName, extra: cat);
  }

  void searchCat(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      final catsProvider = context.read<CatsProvider>();
      catsProvider.searchBreedCat(value);
    });
  }

  void onClear() {
    focusNode.unfocus();
    controllerSearch.clear();
    final catsProvider = context.read<CatsProvider>();
    catsProvider.searchBreedCat('');
  }

}