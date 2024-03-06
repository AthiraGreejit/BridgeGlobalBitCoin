import 'package:bitcoin/constants/app_enums.dart';
import 'package:bitcoin/controllers/home/home_bloc.dart';
import 'package:bitcoin/controllers/home/home_event.dart';
import 'package:bitcoin/controllers/splash/splash_event.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late HomeBloc homeBloc;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    homeBloc = HomeBloc();
  });

  test('initial page state should be PageStatus.initial', () {
    expect(homeBloc.state.pageStatus, PageStatus.initial);
  });

  group("FetchDataEvent() test cases", () {
    test('should add UpdatePageStatusEvent()', () async* {
      homeBloc.add(FetchDataEvent());
      expectLater(
        homeBloc,
        emitsInOrder([
          UpdatePageStatusEvent(pageStatus: PageStatus.loading),
          UpdateDataEvent(priceData: [])
        ]),
      );
    });

    test('should emits PageStatus.loaded', () async* {
      homeBloc.add(FetchDataEvent());
      expectLater(homeBloc.state.pageStatus, PageStatus.loaded);
    });
  });
}
