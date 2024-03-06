import 'package:bitcoin/controllers/home/home_bloc.dart';
import 'package:bitcoin/controllers/home/home_state.dart';
import 'package:bitcoin/ui/home/components/price_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/app_enums.dart';
import '../../../models/bit_coin_model.dart';
import '../../../widgets/loaders/custom_loader.dart';

class PriceList extends StatelessWidget {
  PriceList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _listData();
  }

  Widget _listData() {
    return BlocSelector<HomeBloc, HomeStates, PageStatus>(
        selector: (HomeStates state) => state.pageStatus,
        builder: (context, PageStatus data) {
          if (data == PageStatus.loading) {
            return CustomLoader(
              text: "loading...",
            );
          } else {
            return _listView();
          }
        });
  }

  Widget _listView() {
    return BlocSelector<HomeBloc, HomeStates, List<PriceModel>?>(
        selector: (HomeStates state) => state.priceData,
        builder: (context, List<PriceModel>? data) {
          return (data?.length ?? 0) > 0
              ? Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return PriceTile(item: data?.elementAt(index));
                    },
                  ),
                )
              : SizedBox();
        });
  }
}
