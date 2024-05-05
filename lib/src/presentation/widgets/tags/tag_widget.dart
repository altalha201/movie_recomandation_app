import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class TagWidget extends StatelessWidget {
  const TagWidget({
    super.key,
    required this.text,
    this.learge = false,
    this.color = AppColors.black35,
  });

  final String text;
  final bool learge;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 2.0,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(2),
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
      return Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          );
    }
  }
}
