import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/constants.dart';

class SeeMoreButton extends StatelessWidget {
  const SeeMoreButton({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: Constances.listItemHeight,
        width: Constances.listItemWeight,
        margin: Constances.listItemMargin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: AppColors.black35,
        ),
        alignment: Alignment.center,
        child: const Text(
          "See More",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
