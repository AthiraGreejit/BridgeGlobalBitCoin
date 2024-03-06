import 'package:bitcoin/constants/app_enums.dart';
import 'package:bitcoin/controllers/auth/auth_bloc.dart';
import 'package:bitcoin/controllers/auth/auth_event.dart';
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
  late AuthBloc authBloc;
  late TestSharedPreferenceRepository sharedPreferenceRepository;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    sharedPreferenceRepository = TestSharedPreferenceRepository();
    authBloc = AuthBloc(repository: sharedPreferenceRepository);
  });

  test('initial page state should be PageStatus.initial', () {
    expect(authBloc.state.authStatus, AuthStatus.initial);
  });

  group("LoginEvent() test cases", () {
    test('should not add UpdatePageStatusEvent()', () async* {
      authBloc.add(LoginEvent(userName: ""));
      expectLater(authBloc, neverEmits(anything));
    });

    test('should not add UpdatePageStatusEvent()', () async* {
      authBloc.add(LoginEvent(userName: 'test'));
      expectLater(authBloc, neverEmits(anything));
    });

    test('should not add UpdatePageStatusEvent()', () async* {
      authBloc.add(LoginEvent(userName: '     '));
      expectLater(authBloc, neverEmits(anything));
    });

    test('should add UpdatePageStatusEvent()', () async* {
      authBloc.add(LoginEvent(userName: 'test user'));
      expectLater(
        authBloc,
        emitsInOrder(
            [UpdateAuthStatusEvent(authStatus: AuthStatus.authenticated)]),
      );
    });

    test('should emits PageStatus.loaded', () async* {
      authBloc.add(LoginEvent(userName: 'test user'));
      expectLater(authBloc.state.authStatus, AuthStatus.authenticated);
    });
  });

  group("LoginEvent() test cases", () {
    test('should return false', ()  {
      bool value = authBloc.validateName(null);
      expect(value, false);
    });

    test('should return false', ()  {
      bool value = authBloc.validateName("");
      expect(value, false);
    });

    test('should return false', ()  {
      bool value = authBloc.validateName("     ");
      expect(value, false);
    });

    test('should return false', () {
      bool value = authBloc.validateName("aa");
      expect(value, false);
    });

    test('should return false', ()  {
      bool value = authBloc.validateName("abi");
      expect(value, true);
    });

    test('should return false', ()  {
      bool value = authBloc.validateName("test user");
      expect(value, true);
    });
  });
}
