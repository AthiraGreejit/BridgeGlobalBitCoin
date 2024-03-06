import 'dart:io';

import 'package:bitcoin/controllers/splash/splash_event.dart';
import 'package:bitcoin/controllers/splash/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/app_enums.dart';
import '../../main.dart';
import '../../repository/shared_preference_repository.dart';
import '../../ui/auth/sign_in.dart';
import '../../ui/home/home.dart';
import '../home/home_bloc.dart';
import '../home/home_event.dart';

class SplashBloc extends Bloc<SplashEvents, SplashStates> {
  SplashBloc({SharedPreferenceBase? repository})
      : sharedPreferenceRepository = repository ?? CommonSharedPreference(),
        super(SplashStates(pageStatus: PageStatus.initial));

  final SharedPreferenceBase sharedPreferenceRepository;

  @override
  Stream<SplashStates> mapEventToState(SplashEvents event) async* {
    if (event is StartTimerEvent) {
      startTimer();
    } else if (event is UpdatePageStatusEvent) {
      yield SplashStates(pageStatus: event.pageStatus);
    }
  }

  Future<void> startTimer() async {
    await Future.delayed(const Duration(seconds: 3));
    await checkUserToken();
  }

  Future<void> checkUserToken() async {
    try {
      String? token = await sharedPreferenceRepository.getToken();
      if (token.isNotEmpty == true) {
        debugPrint("token.isNotEmpty");
        loadHomeScreen();
      } else {
        loadSignInScreen();
      }
      add(UpdatePageStatusEvent(pageStatus: PageStatus.loaded));
    } on SocketException {
      debugPrint("SocketException");
      add(UpdatePageStatusEvent(pageStatus: PageStatus.loadingFailed));
    } catch (onError) {
      debugPrint(onError.toString());
      add(UpdatePageStatusEvent(pageStatus: PageStatus.loadingFailed));
    }
  }

  loadHomeScreen() {
    BlocProvider.of<HomeBloc>(navigatorKey.currentContext!).add(FetchDataEvent());
    Navigator.pushAndRemoveUntil(
        navigatorKey.currentContext!,
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
        (Route<dynamic> route) => false);
  }

  loadSignInScreen() {
    Navigator.pushAndRemoveUntil(
        navigatorKey.currentContext!,
        MaterialPageRoute(
          builder: (context) => SignIn(),
        ),
        (Route<dynamic> route) => false);
  }
}
