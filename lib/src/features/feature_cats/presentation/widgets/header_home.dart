import 'package:flutter/material.dart';

import '../../../../config/config.dart';

class HeaderHome extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onTapLogo;
  const HeaderHome({super.key, required this.onTapLogo, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.orangePrimary,
      elevation: 0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyles.bold(
          color: Colors.white,
          size: 22
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}