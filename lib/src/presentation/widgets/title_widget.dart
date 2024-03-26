import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget(this.title, {
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 4),
      child: Text(
        title,style: Theme.of(context).textTheme.headlineMedium?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontFamily: 'open sans'
        ),
      ),
    );
  }
}
