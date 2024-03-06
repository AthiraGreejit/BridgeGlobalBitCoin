import 'package:bitcoin/constants/app_config.dart';
import 'package:bitcoin/controllers/auth/auth_bloc.dart';
import 'package:bitcoin/controllers/home/home_bloc.dart';
import 'package:bitcoin/controllers/splash/splash_bloc.dart';
import 'package:bitcoin/ui/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<SplashBloc>(create: (BuildContext context) => SplashBloc()),
      BlocProvider<AuthBloc>(create: (BuildContext context) => AuthBloc()),
      BlocProvider<HomeBloc>(create: (BuildContext context) => HomeBloc()),
    ],
    child: const MyApp(),
  ));
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConfig.appName,
        navigatorKey: navigatorKey,
        home: const Splash());
  }
}
