class BitCoinModel {
  List<PriceModel>? priceData;

  BitCoinModel.fromJson(Map<String, dynamic> json) {
    if (json['bpi'] is Map<String, dynamic>) {
      priceData = [];
      json['bpi'].forEach((k, v) {
        print("Key : $k, Value : $v");
        priceData!.add(PriceModel?.fromJson(v, k));
      });
    }
  }
}

class PriceModel {
  PriceModel({
    this.code,
    this.symbol,
    this.rate,
    this.description,
    this.rateFloat,
  });

  String? code;
  String? symbol;
  String? rate;
  String? description;
  String? title;
  double? rateFloat;

  PriceModel.fromJson(Map<String, dynamic> json, String key) {
    title = key;
    code = json['code'];
    symbol = json['symbol'];
    rate = json['rate'];
    description = json['description'];
    rateFloat = json['rate_float'];
  }
}
