import 'package:bitcoin/constants/app_config.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_drawables.dart';
import '../constants/app_styles.dart';
import '../main.dart';

class WidgetUtils {
  static Widget errorWidget(String text, {String? image, Color? color}) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: <Widget>[
          // logo(),
          const Text(AppConfig.appName,
              style: TextStyle(fontSize: 30), textAlign: TextAlign.center),
          const Text(AppConfig.subTitle,
              style: TextStyle(fontSize: 14), textAlign: TextAlign.center),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(navigatorKey.currentContext!)
                  .textTheme
                  .labelMedium!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  static Widget appLogo() {
    return Image.asset("assets/logo.png", fit: BoxFit.contain, height: 100);
  }

  static showLogoutPopUp(
    BuildContext context, {
    GestureTapCallback? sBtnFunction,
  }) async {
    return await showPopUpLogout(context,
        title: "Confirmation",
        message: "Are you sure to Logout ?",
        sBtnLabel: "Confirm",
        sBtnFunction: sBtnFunction,
        showBtnN: true);
  }

  static showPopUpLogout(BuildContext context,
      {String? title,
      String? message,
      String? sBtnLabel,
      String? nBtnLabel,
      GestureTapCallback? sBtnFunction,
      GestureTapCallback? nBtnFunction,
      bool? showBtnN}) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text(
          title ?? AppConfig.appName,
          textAlign: TextAlign.center,
          style: Theme.of(navigatorKey.currentContext!)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.w600, color: Colors.black),
        ),
        content: Text(
          message ?? "",
          textAlign: TextAlign.center,
          style: Theme.of(navigatorKey.currentContext!)
              .textTheme
              .titleSmall!
              .copyWith(
                  fontWeight: FontWeight.w400, color: AppColors.lightSubText),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              sBtnLabel ?? "OK",
              style: Theme.of(navigatorKey.currentContext!)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.w400, color: Colors.black),
            ),
            onPressed: sBtnFunction ?? () => Navigator.of(context).pop(),
          ),
          showBtnN == true
              ? TextButton(
                  child: Text(
                    nBtnLabel ?? "Cancel",
                    style: Theme.of(navigatorKey.currentContext!)
                        .textTheme
                        .titleSmall!
                        .copyWith(
                            fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                  onPressed:
                      nBtnFunction ?? () => Navigator.of(context).pop(false),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
