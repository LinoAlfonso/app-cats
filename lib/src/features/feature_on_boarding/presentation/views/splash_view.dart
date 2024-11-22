import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../providers/on_boarding_provider.dart';
import '../../../../config/config.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  static const routeName = '/';

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
                          'assets/svg/el_tiempo.svg',
                          width: 174,
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