import 'package:bitcoin/constants/app_enums.dart';
import 'package:bitcoin/controllers/splash/splash_bloc.dart';
import 'package:bitcoin/controllers/splash/splash_event.dart';
import 'package:bitcoin/repository/shared_preference_repository.dart';
import 'package:flutter_test/flutter_test.dart';

class TestSharedPreferenceRepository implements SharedPreferenceBase {
  String username = "";

  @override
  Future<String> getToken() async {
    return username;
  }

  @override
  Future<void> setToken(String token) async {
    username = token;
  }
}

void main() {
  late SplashBloc splashBloc;
  late TestSharedPreferenceRepository sharedPreferenceRepository;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    sharedPreferenceRepository = TestSharedPreferenceRepository();
    splashBloc = SplashBloc(repository: sharedPreferenceRepository);
  });

  test('initial page state should be PageStatus.initial', () {
    expect(splashBloc.state.pageStatus, PageStatus.initial);
  });

  group("StartTimerEvent() test cases", () {
    test('should add UpdatePageStatusEvent()', () async* {
      splashBloc.add(StartTimerEvent());
      expectLater(
        splashBloc,
        emitsInOrder([UpdatePageStatusEvent(pageStatus: PageStatus.loaded)]),
      );
    });

    test('should emits PageStatus.loaded', () async* {
      splashBloc.add(StartTimerEvent());
      expectLater(splashBloc.state.pageStatus, PageStatus.loaded);
    });
  });
}
