import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double? fontSize;
  final BorderRadius? borderRadius;
  final void Function()? onpressed;
  const CustomButtom({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.borderRadius,
    this.fontSize,
    this.onpressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
        onPressed: onpressed,
        child: Text(
          text,
          style: Styles.textStyle18.copyWith(
            color: textColor,
            fontSize: fontSize,
          ),
        ),
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(16),
            ),
            backgroundColor: backgroundColor),
      ),
    );
  }
}
