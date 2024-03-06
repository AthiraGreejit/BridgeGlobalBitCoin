import 'package:bitcoin/controllers/home/home_event.dart';
import 'package:bitcoin/controllers/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api_services/http_api_client.dart';
import '../../constants/app_enums.dart';
import '../../models/bit_coin_model.dart';

class HomeBloc extends Bloc<HomeEvents, HomeStates> {
  HomeBloc() : super(HomeStates(pageStatus: PageStatus.initial));

  List<PriceModel> priceChart = [
    PriceModel(
        code: "USD",
        symbol: "&#36;",
        rate: "66,107.107",
        description: "United States Dollar",
        rateFloat: 66107.1073),
    PriceModel(
        code: "GBP",
        symbol: "&pound;",
        rate: "52,146.741",
        description: "British Pound Sterling",
        rateFloat: 52146.7406),
    PriceModel(
        code: "EUR",
        symbol: "&euro;",
        rate: "60,945.332",
        description: "Euro",
        rateFloat: 60945.3322),
  ];

  @override
  Stream<HomeStates> mapEventToState(HomeEvents event) async* {
    if (event is UpdateHomePageStatusEvent) {
      yield HomeStates(pageStatus: event.pageStatus);
    } else if (event is FetchDataEvent) {
      getData();
    } else if (event is UpdateDataEvent) {
      yield HomeStates(
          pageStatus: PageStatus.loaded, priceData: event.priceData);
    }
  }

  getData() async {
    add(UpdateHomePageStatusEvent(pageStatus: PageStatus.loading));
    try {
      var response = await httpRequest(
          urlAddress: '',
          isShowLoader: false,
          isShowSnackBar: false,
          httpMethod: HttpMethod.get,
          isTestApi: true,
          requestBody: {});
      add(UpdateDataEvent(
          priceData: BitCoinModel.fromJson(response).priceData));
    } catch (e) {
      debugPrint('getData  Error : $e');
      add(UpdateHomePageStatusEvent(pageStatus: PageStatus.loadingFailed));
      return false;
    }
  }
}
