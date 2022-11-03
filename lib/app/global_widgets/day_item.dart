import 'package:flutter/material.dart';
import 'package:health_app/app/constants/theme/ColorsSchema.dart';

/// Creates a Widget representing the day.
class DayItem extends StatelessWidget {
  final int dayNumber;
  final String shortName;
  final bool isSelected;
  final Function onTap;
  final Color? dayColor;
  final Color? activeDayColor;
  final Color? activeDayBackgroundColor;
  final bool available;

  final Color? dayNameColor;

  const DayItem({
    Key? key,
    required this.dayNumber,
    required this.shortName,
    required this.onTap,
    this.isSelected = false,
    this.dayColor,
    this.activeDayColor,
    this.activeDayBackgroundColor,
    this.available = true,
    this.dayNameColor,
  }) : super(key: key);

  final double height = 70.0;
  final double width = 70.0;

  _buildDay(BuildContext context) {
    final textStyle = TextStyle(
        color: available
            ? dayColor ?? Theme.of(context).colorScheme.secondary
            : dayColor?.withOpacity(0.5) ??
                Theme.of(context).colorScheme.secondary.withOpacity(0.5),
        fontSize: 32,
        fontWeight: FontWeight.normal);
    final selectedStyle = TextStyle(
      color: activeDayColor ?? Colors.white,
      fontSize: 32,
      fontWeight: FontWeight.bold,
    );

    return GestureDetector(
      onTap: available ? onTap as void Function()? : null,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 7),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.bounceOut,
              decoration: isSelected
                  ? BoxDecoration(
                      color: activeDayBackgroundColor ??
                          Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(25.0),
                    )
                  : BoxDecoration(
                      color: greyText.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
              height: height,
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    dayNumber.toString(),
                    style: isSelected ? selectedStyle : textStyle,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              shortName,
              style: TextStyle(
                color: dayNameColor ?? activeDayColor ?? Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildDay(context);
  }
}
