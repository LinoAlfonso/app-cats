import 'package:animate_do/animate_do.dart';
import 'package:app_cats/src/features/feature_cats/feature_cats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../providers/on_boarding_provider.dart';
import '../../../../config/config.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static const routeName = '/';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final onBoardingProvider = context.read<OnBoardingProvider>();
      onBoardingProvider.getVersion();
      Future.delayed(const Duration(seconds: 2), () {
        context.goNamed(HomeCatsView.routeName);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Consumer<OnBoardingProvider>(
            builder: (_,auth,child) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ZoomIn(
                      duration: const Duration(seconds: 1),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/svg/cat.svg',
                          height: 300,
                          colorFilter: const ColorFilter.mode(AppColors.orangePrimary, BlendMode.srcIn)
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                          "Version:${auth.versionApp}",
                          style:TextStyles.regular()
                      ),
                    ),
                  )
                ],
              );
            }
        ),
      ),
    );
  }
}