import 'package:bitcoin/constants/app_enums.dart';

abstract class SplashEvents {}

class StartTimerEvent extends SplashEvents {}

class UpdatePageStatusEvent extends SplashEvents {
  final PageStatus pageStatus;

  UpdatePageStatusEvent({required this.pageStatus});
}
