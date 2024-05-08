import 'package:flutter/material.dart';
import 'package:movie_show_utilites/movie_show_utilites.dart';

class ListImageWidget extends StatelessWidget {
  const ListImageWidget(
    this.imagePath, {
    super.key,
    this.border = false,
    this.borderColor,
    this.onPressed,
    this.childAlignment,
    this.child,
    this.padding,
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
        height: MSConstances.listItemHeight,
        width: MSConstances.listItemWeight,
        margin: MSConstances.listItemMargin,
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
