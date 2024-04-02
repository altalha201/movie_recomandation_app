import 'package:flutter/material.dart';

class AppDataCell extends StatelessWidget {
  const AppDataCell(this.data,{
    super.key,
  });

  final String data;

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 6.0,
          vertical: 4.0,
        ),
        child: Text(
          data,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'open sans',
            fontWeight: FontWeight.w500
          ),
        ),
      ),
    );
  }
}
