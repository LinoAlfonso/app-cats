import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
  Timer? _debounce;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final catsProvider = context.read<CatsProvider>();
      catsProvider.getBreedsCats();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: HeaderHome(
        onTapLogo: (){},
      ),
      body: Consumer<CatsProvider>(
        builder: (context,cats,child) {
          return SafeArea(
            child: Column(
              children: [
                Container(
                  color: AppColors.orangePrimary,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30,right: 30,bottom: 10),
                    child: SearchTextField(
                      controller: controllerSearch,
                      hintText: 'Breed cat...',
                      onChanged: (value) {
                        searchCat(value);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    itemCount: cats.cats.length,
                    itemBuilder: (context, index) {
                      final cat = cats.cats[index];
                      return CatCard(
                        cat: cat,
                        onTapCat: onTapCat,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
      ),
     );
  }

  void onTapCat(Cat cat) {
    context.pushNamed(DetailCatView.routeName, extra: cat);
  }

  void searchCat(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      final catsProvider = context.read<CatsProvider>();
      catsProvider.searchBreedCat(value);
    });
  }

}