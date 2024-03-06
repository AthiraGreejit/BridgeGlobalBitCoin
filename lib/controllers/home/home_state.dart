import '../../constants/app_enums.dart';
import '../../models/bit_coin_model.dart';

class HomeStates {
  final PageStatus pageStatus;
  final List<PriceModel>? priceData;

  HomeStates({required this.pageStatus, this.priceData});
}
