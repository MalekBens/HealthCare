import 'package:flutter/material.dart';
import 'package:health_app/app/constants/theme/ColorsSchema.dart';

/// Creates a Widget to represent the months.
class MonthItem extends StatelessWidget {
  final String name;
  final Function onTap;
  final bool isSelected;
  final Color? color;

  MonthItem(
      {required this.name,
      required this.onTap,
      this.isSelected = false,
      this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap as void Function()?,
      child: Container(
        child: Text(
          this.name.toUpperCase(),
          style: TextStyle(
            fontSize: 14,
            color: isSelected ? color ?? Colors.black87 : greyText,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w300,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}
