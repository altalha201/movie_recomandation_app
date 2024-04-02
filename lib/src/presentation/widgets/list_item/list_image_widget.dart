import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class ListImageWidget extends StatelessWidget {
  const ListImageWidget(
    this.imagePath, {
    super.key,
    this.border = false,
    this.borderColor,
    this.onPressed,
    this.childAlignment,
    this.child, this.padding,
  });

  final String imagePath;
  final bool border;
  final Color? borderColor;
  final VoidCallback? onPressed;
  final Alignment? childAlignment;
  final EdgeInsetsGeometry? padding;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: Constances.listItemHeight,
        width: Constances.listItemWeight,
        margin: Constances.listItemMargin,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border:
              border ? Border.all(color: borderColor ?? Colors.white) : null,
          image: DecorationImage(
            image: NetworkImage(imagePath),
            fit: BoxFit.fill,
          ),
        ),
        alignment: childAlignment,
        child: child,
      ),
    );
  }
}
