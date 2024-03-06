import 'package:bitcoin/constants/app_enums.dart';

abstract class AuthEvents {}

class LoginEvent extends AuthEvents {
  final String userName;

  LoginEvent({required this.userName});
}

class UpdateAuthStatusEvent extends AuthEvents {
  final AuthStatus authStatus;

  UpdateAuthStatusEvent({required this.authStatus});
}

class LogoutEvent extends AuthEvents {}
