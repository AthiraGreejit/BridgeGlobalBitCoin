import 'package:bitcoin/constants/app_enums.dart';

import '../../models/bit_coin_model.dart';

abstract class HomeEvents {}

class FetchDataEvent extends HomeEvents {}

class UpdateHomePageStatusEvent extends HomeEvents {
  final PageStatus pageStatus;

  UpdateHomePageStatusEvent({required this.pageStatus});
}

class UpdateDataEvent extends HomeEvents {
  final List<PriceModel>? priceData;

  UpdateDataEvent({required this.priceData});
}
