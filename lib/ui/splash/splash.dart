import 'package:bitcoin/controllers/splash/splash_bloc.dart';
import 'package:bitcoin/controllers/splash/splash_event.dart';
import 'package:bitcoin/controllers/splash/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/app_config.dart';
import '../../constants/app_drawables.dart';
import '../../constants/app_enums.dart';
import '../../constants/app_styles.dart';
import '../../utils/widget_utils.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SplashBloc>(context).add(StartTimerEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      body: _buildBodyWidget(context),
    );
  }

  Widget _buildBodyWidget(BuildContext context) {
    return BlocSelector<SplashBloc, SplashStates, PageStatus>(
        selector: (SplashStates state) => state.pageStatus,
        builder: (context, PageStatus data) {
          return data == PageStatus.loadingFailed
              ? WidgetUtils.errorWidget("Something went wrong",
                  color: Colors.black)
              : _loader();
        });
  }

  Widget _loader() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(Drawables.splashImage, fit: BoxFit.contain, height: 300),
          AppStyles.boxHeightExtraSmall,
          Text(AppConfig.appName.toUpperCase(),
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center),
          const Text(AppConfig.subTitle,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
