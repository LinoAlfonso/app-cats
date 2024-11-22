import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class OnBoardingProvider with ChangeNotifier {

  String? _versionApp;

  String? get versionApp => _versionApp;
  set versionApp(String? value) {
    _versionApp = value;
    notifyListeners();
  }

  Future<void> getVersion() async {
    final version = await getAppVersion();
    versionApp = version;
  }

}