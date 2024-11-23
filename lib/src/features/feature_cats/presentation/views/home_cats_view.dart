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

}