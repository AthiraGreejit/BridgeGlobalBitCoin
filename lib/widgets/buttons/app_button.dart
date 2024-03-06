import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class AppButton extends StatelessWidget {
  AppButton(
      {Key? key,
      required this.onPressed,
      this.text = 'SUBMIT',
      this.child,
      this.borderRadius,
      this.isSmallButton = false,
      // this.pageStatusProvider,
      this.isLoading = false,
      this.color,
      this.showBorder = false,
      this.height,
      this.margin,
      this.expandWidth = false,
      this.fontSize,
      this.borderColor,
      this.textColor


      })
      : super(key: key);

  final String text;
  final double? borderRadius;
  final double? height;
  final double? fontSize;
  final Function onPressed;
  final Widget? child;
  final List<Color>? color;
  final EdgeInsetsGeometry? margin;
  final bool isLoading;
  final bool showBorder;
  final bool expandWidth;
  final Color? borderColor;
  final Color? textColor;

  /// To use inside a row enable small button
  final bool isSmallButton;

  @override
  Widget build(BuildContext context) {
    return _button();
  }

  Widget _button() {
    return Container(
      height: height,
      margin: margin,
      width: expandWidth ? double.infinity : null,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: color ??
                [AppColors.primaryDark, AppColors.primary],
          ),
          borderRadius: BorderRadius.circular(borderRadius ?? 26),
          border: showBorder
              ? Border.all(color: borderColor ?? Colors.black, width: 1)
              : null),
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: const Size(150, 36),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : child ??
                Text(
                  text,
                  style: TextStyle(
                      fontSize: fontSize,color: textColor ?? Colors.white,
                      fontWeight:
                          isSmallButton ? FontWeight.w500 : FontWeight.w700),
                ),
      ),
    );
  }
}
