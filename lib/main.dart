import 'package:app_cats/src/config/setup_providers/factory_setup_providers.dart';
import 'package:app_cats/src/features/feature_on_boarding/presentation/providers/on_boarding_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/config/config.dart';

void main() async {
  await Environment.initEnvironment();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>OnBoardingProvider()),
        ChangeNotifierProvider(create: (_)=>FactorySetupProviders.createBreedsCatsProvider()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: routesApp,
        title: 'App Cats',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.orangePrimary),
          useMaterial3: true,
        ),
      ),
    );
  }
}


