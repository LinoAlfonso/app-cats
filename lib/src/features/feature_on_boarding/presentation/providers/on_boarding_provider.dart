import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../feature_cats/feature_cats.dart';

class OnBoardingProvider with ChangeNotifier {

  String? _versionApp;

  String? get versionApp => _versionApp;
  set versionApp(String? value) {
    _versionApp = value;
    notifyListeners();
  }

  Future<void> initialize(BuildContext context) async {
    await getVersion();
    await Future.delayed(const Duration(seconds: 2));
    if (context.mounted) {
      context.goNamed(HomeCatsView.routeName);
    }
  }

  Future<void> getVersion() async {
    final version = await getAppVersion();
    versionApp = version;
  }

}