import 'package:flutter/material.dart';
import 'package:movie_show_utilites/movie_show_utilites.dart';

class TagWidget extends StatelessWidget {
  const TagWidget({
    super.key,
    required this.text,
    this.learge = false,
    this.color = MSColors.black35,
  });

  final String text;
  final bool learge;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: learge ? 2.0 : 4.0,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: getStyle(context),
        textAlign: TextAlign.left,
      ),
    );
  }

  TextStyle? getStyle(BuildContext context) {
    if (learge) {
      return Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          );
    } else {
      return Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          );
    }
  }
}
