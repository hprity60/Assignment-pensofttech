import 'package:flutter/material.dart';

import '../../../../core/values/text_styles.dart';

class CustomButton extends StatelessWidget {
  final Color btnColor;
  final Color textColor;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  const CustomButton(
      {super.key,
      required this.text,
      required this.btnColor,
      required this.textColor,
      required this.onTap,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 150,
        height: 45,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: textStyleF20W700(color: textColor),
        ),
      ),
    );
  }
}
