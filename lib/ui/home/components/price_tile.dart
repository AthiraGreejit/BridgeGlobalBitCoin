import 'package:bitcoin/models/bit_coin_model.dart';
import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import '../../../constants/app_styles.dart';

class PriceTile extends StatelessWidget {
  final PriceModel? item;
  final HtmlUnescape htmlUnescape = HtmlUnescape();

  PriceTile({Key? key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String decodedSymbol = htmlUnescape.convert(item?.symbol ?? "");
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      child: DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF00FF00), // Light green
                Color(0xFF008000), // Green
                Color(0xFF006400), // Dark green
              ],
            ),
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: AppStyles.commonScreenAllPadding,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item?.code ?? "",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  Text(
                    item?.description ?? "",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ],
              ),
              AppStyles.boxHeightSmall,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${decodedSymbol} ${item?.rate ?? ""}",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
