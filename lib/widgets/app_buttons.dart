import 'package:flutter/material.dart';

import 'app_text.dart';

class AppButtons extends StatelessWidget {
  AppButtons({
    Key? key,
    required this.size,
    this.text = '',
    this.icon,
    this.isIcon = false,
    required this.color,
    required this.backgroundColor,
    required this.borderColor,
  }) : super(key: key);

  final double size;
  String text;
  IconData? icon;
  bool isIcon;
  final Color color;
  final Color backgroundColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.0),
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      child: !isIcon
          ? Center(
              child: AppText(
                text: text,
                color: color,
              ),
            )
          : Icon(
              icon,
              color: color,
            ),
    );
  }
}
