import 'package:flutter/material.dart';

import '../../../../config/config.dart';

class HeaderDetail extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const HeaderDetail({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.orangePrimary,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back,color: Colors.white,),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      centerTitle: true,
      title: Text(
        title,
        style: TextStyles.medium(
          size: 20,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}