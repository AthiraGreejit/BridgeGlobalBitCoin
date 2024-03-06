import 'package:flutter/material.dart';

class AppStyles {
  //PADDING
  static const EdgeInsets allPaddingZero = EdgeInsets.zero;
  static const EdgeInsets extraSmallPadding = EdgeInsets.all(4.0);
  static const EdgeInsets smallPadding = EdgeInsets.all(8.0);
  static const EdgeInsets mediumLargePadding = EdgeInsets.all(20.0);
  static const EdgeInsets commonScreenAllPadding = EdgeInsets.all(14.0);
  static const EdgeInsets commonScreenHorizonPadding =
      EdgeInsets.symmetric(horizontal: 14.0);
  static const EdgeInsets commonScreenHorizonPadding10 =
      EdgeInsets.symmetric(horizontal: 10.0);
  static const EdgeInsets commonScreenHorizonPadding20 =
      EdgeInsets.symmetric(horizontal: 20.0);
  static const EdgeInsets smallMenuPadding =
      EdgeInsets.symmetric(horizontal: 8, vertical: 12);
  static const EdgeInsets verticalPaddingSmall =
      EdgeInsets.symmetric(vertical: 10);
  static const EdgeInsets vertical10Horizontal20Padding =
      EdgeInsets.symmetric(vertical: 10, horizontal: 20);

  // BORDER RADIUS
  static const BorderRadius borderRadiusExtraSmall =
      BorderRadius.all(Radius.circular(4.0));
  static const BorderRadius borderRadiusSmall =
      BorderRadius.all(Radius.circular(8.0));
  static BorderRadius borderRadiusSmallMedium = BorderRadius.circular(10);
  static const BorderRadius borderRadiusMedium =
      BorderRadius.all(Radius.circular(12.0));
  static const BorderRadius borderRadiusLarge =
      BorderRadius.all(Radius.circular(16.0));
  static const BorderRadius borderRadiusExtraLarge =
      BorderRadius.all(Radius.circular(24.0));

  // SIZED BOX
  static const SizedBox smallMediumBox = SizedBox(
    height: 12.0,
    width: 12.0,
  );
  static const SizedBox mediumBox = SizedBox(
    height: 16.0,
    width: 16.0,
  );
  static const SizedBox largeBox = SizedBox(
    height: 24.0,
    width: 24.0,
  );
  static const SizedBox extraLargeBox = SizedBox(
    height: 32.0,
    width: 32.0,
  );
  static const SizedBox boxWidth2 = SizedBox(
    width: 2.0,
  );
  static const SizedBox boxWidthMicro = SizedBox(
    width: 5.0,
  );
  static const SizedBox boxWidth8 = SizedBox(
    width: 8.0,
  );
  static const SizedBox boxWidthExtraSmall = SizedBox(
    width: 10.0,
  );
  static const SizedBox boxWidthSmall = SizedBox(
    width: 15.0,
  );
  static const SizedBox boxWidthMedium = SizedBox(
    width: 17.0,
  );
  static const SizedBox boxWidthLarge = SizedBox(
    width: 20.0,
  );
  static const SizedBox boxHeight2 = SizedBox(
    height: 2,
  );
  static const SizedBox boxHeightMicro = SizedBox(
    height: 4,
  );
  static const SizedBox boxHeightExtraSmall = SizedBox(
    height: 8,
  );
  static const SizedBox boxHeightSmall = SizedBox(
    height: 10,
  );
  static const SizedBox boxHeightMedium = SizedBox(
    height: 15,
  );
  static const SizedBox boxHeightLarge = SizedBox(
    height: 20,
  );
  static const SizedBox boxHeight50 = SizedBox(
    height: 50,
  );
  static const SizedBox boxHeight12 = SizedBox(
    height: 12,
  );

  static Widget divider = Divider(
    color: Colors.grey.withOpacity(.2),
    height: 1,
    thickness: 1,
  );
  static Widget dividerHeight3 = const Divider(
    color: Colors.grey,
    height: 3,
    thickness: 3,
  );
  static Widget dividerWhite = const Divider(
    color: Colors.white,
    height: 1,
    thickness: 1,
  );

  static Widget verticalDivider = VerticalDivider(
    color: Colors.grey.withOpacity(.2),
    thickness: 1,
    width: 1,
  );
}
