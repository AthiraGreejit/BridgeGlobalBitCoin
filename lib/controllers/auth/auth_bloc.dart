import 'package:bitcoin/controllers/auth/auth_event.dart';
import 'package:bitcoin/controllers/auth/auth_state.dart';
import 'package:bitcoin/controllers/home/home_bloc.dart';
import 'package:bitcoin/controllers/home/home_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/app_enums.dart';
import '../../main.dart';
import '../../repository/shared_preference_repository.dart';
import '../../ui/auth/sign_in.dart';
import '../../ui/home/home.dart';
import '../../utils/widget_utils.dart';

class AuthBloc extends Bloc<AuthEvents, AuthStates> {
  AuthBloc({SharedPreferenceBase? repository})
      : sharedPreferenceRepository = repository ?? CommonSharedPreference(),
        super(AuthStates(authStatus: AuthStatus.initial));
  final SharedPreferenceBase sharedPreferenceRepository;

  @override
  Stream<AuthStates> mapEventToState(AuthEvents event) async* {
    if (event is LoginEvent) {
      validateAndLogin(event.userName);
    } else if (event is UpdateAuthStatusEvent) {
      yield AuthStates(authStatus: event.authStatus);
    }else if (event is LogoutEvent) {
      logoutAlertBox();
    }
  }

  bool validateName(String? value) {
    return (value?.trim().length ?? 0) >= 3;
  }

  validateAndLogin(String? userName) async {
    if (validateName(userName)) {
      add(UpdateAuthStatusEvent(authStatus: AuthStatus.authenticating));
      await Future.delayed(Duration(seconds: 1));
      await sharedPreferenceRepository.setToken(userName!);
      loadHomeScreen();
      add(UpdateAuthStatusEvent(authStatus: AuthStatus.authenticated));
    }
  }

  logoutAlertBox() {
    WidgetUtils.showLogoutPopUp(navigatorKey.currentContext!,
        sBtnFunction: () => logout());
  }

  logout() async {
    await sharedPreferenceRepository.setToken("");
    Navigator.of(navigatorKey.currentContext!).pop();
    loadSignInScreen();
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
