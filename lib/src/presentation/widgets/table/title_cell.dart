import 'package:flutter/material.dart';

class AppTitleCell extends StatelessWidget {
  const AppTitleCell(this.title,{
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 6.0,
          vertical: 4.0,
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'open sans',
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
