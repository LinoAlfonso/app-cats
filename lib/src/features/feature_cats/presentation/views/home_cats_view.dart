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
  void dispose() {
    controllerSearch.dispose();
    focusNode.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: HeaderHome(
        title: 'CatBreeds',
        onTapLogo: (){},
      ),
      body: Consumer<CatsProvider>(
        builder: (context,catsProvider,child) {
          return SafeArea(
            child: Column(
              children: [
                // Search TextField
                Container(
                  color: AppColors.orangePrimary,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30,right: 30,bottom: 10),
                    child: SearchTextField(
                      focusNode: focusNode,
                      controller: controllerSearch,
                      hintText: 'Breed cat...',
                      onChanged: searchCat,
                      onClear: onClear,
                    ),
                  ),
                ),

                // List Cats
                Expanded(
                  child: ListViewCatsPagination(onTapCat: onTapCat, catsProvider: catsProvider),
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
    final catsProvider = context.read<CatsProvider>();
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      catsProvider.searchBreedCat(value);
    });
  }

  void onClear() {
    final catsProvider = context.read<CatsProvider>();
    focusNode.unfocus();
    controllerSearch.clear();
    catsProvider.searchBreedCat('');
  }

}