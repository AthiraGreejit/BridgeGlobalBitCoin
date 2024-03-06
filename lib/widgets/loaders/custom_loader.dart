import 'package:flutter/material.dart';

import '../../constants/app_drawables.dart';
import '../../constants/app_styles.dart';

class CustomLoader extends StatelessWidget {
  final String text;

  const CustomLoader({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
        color: Colors.white,
        child: Align(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                  child: SizedBox(
                      height: 100,
                      width: 200,
                      child: Image.asset(Drawables.appLoader, fit: BoxFit.contain))),
              AppStyles.boxHeightMedium,
              Text(text,textAlign: TextAlign.center,style: TextStyle(
                fontSize: 16,fontWeight: FontWeight.w600
              ),)

            ],
          ),
          alignment: Alignment.center,
        ));
  }
}
