import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RattingWidget extends StatelessWidget {
  const RattingWidget(
    this.ratting, {
    super.key,
    this.backgroundOpacity = 0.3,
    this.backgroundColor = Colors.orange,
  });

  final double ratting;
  final double backgroundOpacity;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor.withOpacity(backgroundOpacity),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              FontAwesomeIcons.solidStar,
              size: 16,
              color: Colors.yellow,
            ),
            const SizedBox(width: 20.0),
            Text(
              ratting.toStringAsFixed(1),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
