import 'package:flutter/material.dart';

class AdultTag extends StatelessWidget {
  const AdultTag({super.key, this.tagText = "18+"});

  final String tagText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
          color: Colors.red),
      child: Text(
        tagText,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}
